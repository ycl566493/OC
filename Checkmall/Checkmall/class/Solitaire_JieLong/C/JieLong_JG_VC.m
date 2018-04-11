//
//  JieLong_JG_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/11.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JieLong_JG_VC.h"
#import "TC_JL_Cell.h"
#import "JLLPSP_Model_RootClass.h"
#import "QueRenDingDan_Model_RootClass.h"//确认订单

@interface JieLong_JG_VC ()<UITableViewDelegate,UITableViewDataSource,TC_JL_Cell_Delegate>{
    JLLPSP_Model_RootClass  *model;
    
    QueRenDingDan_Model_RootClass * model_QRDD;
}

@end

@implementation JieLong_JG_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"接龙商品";
    
    [self init_UI];
    
    [self init_Data];
    
}

#pragma mark-  请求数量
- (void)init_Data{
    [NetRequest postWithUrl:Solitaire_goodslists params:@{@"sid":self.str_ID} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"接龙数据 = = %@",dict);
        model = [[JLLPSP_Model_RootClass alloc]initWithDictionary:dict];
        if (model.code == 1) {
            [self.tableV reloadData];
        }
    } fail:^(id error) {
        
    }];
}


- (void)init_UI{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"TC_JL_Cell" bundle:nil] forCellReuseIdentifier:@"TC_JL_Cell"];
    
    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    //    tableV下拉刷新
    WeakSelf(ws);
    self.tableV.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws.tableV.mj_header endRefreshing];
        
        //  结束刷新
        ws.pageIndex =1;
//        [ws init_Data:YES];
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    //    self.tableV.mj_header.automaticallyChangeAlpha = YES;
    // tableV上拉加载
    self.tableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [ws.tableV.mj_footer endRefreshing];
        
        ws.pageIndex += 1;
//        [ws init_Data:NO];
    }];

}

-(void)TC_JL_Cell_Delegate_SLUP{
    CGFloat fffff = 0.0;
    for (JLLPSP_Model_Data *MMM in model.data) {
        fffff += [MMM.sprice floatValue] * [MMM.str_SL integerValue];
    }
    self.lbl_JG.text = [NSString stringWithFormat:@"订单金额：￥%.2f",fffff];
}


#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [TC_JL_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TC_JL_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"TC_JL_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TC_JL_Cell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    JLLPSP_Model_Data *MMMM = model.data[indexPath.row];
    cell.model = MMMM;
    cell.delegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark- 提交订单
- (IBAction)btn_TJ:(id)sender {
    NSLog(@"提交");
    
    
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSMutableArray  *arr_Data = [[NSMutableArray alloc]init];
    for (JLLPSP_Model_Data *MMM in model.data) {
        if ([MMM.str_SL integerValue]>1) {
            NSMutableDictionary *dic_DDDDDD = [[NSMutableDictionary alloc]init];
            [dic_DDDDDD setObject:[NSString stringWithFormat:@"%li",MMM.gid] forKey:@"goodsid"];
            [dic_DDDDDD setObject:MMM.sprice forKey:@"price"];
            [dic_DDDDDD setObject:[NSString stringWithFormat:@"%@",MMM.str_SL] forKey:@"num"];
            
            [arr_Data addObject:[MyHelper toJson:dic_DDDDDD]];
        }
    }
    if (arr_Data.count == 0) {
        return;
    }
    //       type 商品类型 1 拼团 2 开团 3 单独购买 4今日团购 5兑换 6接龙
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"car":arr_Data,@"type":@"6"};
    [NetRequest postWithUrl:order_getOrderDesc params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"确认订单 == %@",dict);
        model_QRDD = [[QueRenDingDan_Model_RootClass alloc]initWithDictionary:dict];
        if (model_QRDD.code == 1) {
//            QueRenDingDan_GWC_VC    *VC = [[QueRenDingDan_GWC_VC alloc]init];
//            VC.model = model_QRDD;
//            [self.navigationController pushViewController:VC animated:YES];
        }
    } fail:^(id error) {
        
    }];
}


@end
