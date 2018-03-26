//
//  GouWuChe_VC.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/3.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "GouWuChe_VC.h"
#import "GouWuChe_DiBu_V.h"//购物车底部
#import "GouWuChe_Cell.h"//购物车cell
#import "QueRenDingDan_GWC_VC.h"//确认订单
#import "GouWuChe_Model_RootClass.h"

@interface GouWuChe_VC ()<GouWuChe_DiBu_V_Delegate,GouWuChe_Cell_Delegate>{
    GouWuChe_DiBu_V  *DiBu;
    GouWuChe_Model_RootClass        *Model_GWC;//购物车model
    UIButton        *btn_QKGWC;//清空购物车
}

@end

@implementation GouWuChe_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"购物车";

    [self init_UI];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self init_data:YES];

}

#pragma mark- 购物车
- (void)init_data:(BOOL)Y_N{
    NSDictionary  *dic = @{@"token":[MyHelper toToken]};
    [NetRequest postWithUrl:goodscar_getGoodsCarData params:dic showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        if (Y_N) {
            Model_GWC = [[GouWuChe_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [Model_GWC Add_Dictionary:dic];
        }
        [MyHelper UP_GWCSL];
        [self.tableview reloadData];
        
        NSLog(@"购物车列表 = = =%@",dict);
    } fail:^(id error) {
        
    }];
}

- (void)refresh{
    [self endRefreshing];
    self.pageIndex  = 1;

    //下拉请求
    [self init_data:YES];
}
- (void)loadMore{
//    self.pageIndex ++;
    [self endRefreshing];
//    [self init_data:NO];

    //加载更多
    NSLog(@"%li",self.pageIndex);
}

#pragma mark- 清空购物车
- (void)btn_QKGWC_Action{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (GouWuChe_Model_Data*MMMM in Model_GWC.data) {
        [arr addObject:[NSString stringWithFormat:@"%li",MMMM.goodsId]];
    }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
    message:[NSString stringWithFormat:@"亲，确定将这%li个宝贝删除？",arr.count] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"清空" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
  
        NSDictionary *dic = @{@"token":[MyHelper toToken],@"gid":arr};
        __weak GouWuChe_VC *weak_self = self;
        [NetRequest postWithUrl:goodscar_clearShopCar params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            if ([dict[@"code"] integerValue] == 1) {
                [weak_self init_data:YES];
                
            }
            NSLog(@"清空购物车 %@",dict);
        } fail:^(id error) {
            
        }];
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {
        //响应事件
        NSLog(@"action = %@", action);
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];


}

-(void)init_UI{
    
    btn_QKGWC = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 100, 0, 100, 50)];
    [btn_QKGWC setTitle:@"清空购物车" forState:UIControlStateNormal];
    [btn_QKGWC setTitleColor:UIColorFromHex(0xff7800) forState:UIControlStateNormal];
    [btn_QKGWC addTarget:self action:@selector(btn_QKGWC_Action) forControlEvents:UIControlEventTouchUpInside];
    btn_QKGWC.titleLabel.font = font15;
    [self.view addSubview:btn_QKGWC];
    
    UIView *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, btn_QKGWC.bottom, ScreenWidth, .5)];
    view_FGX.backgroundColor =  RGBA(219, 215, 215, 1);
    [self.view addSubview:view_FGX];
    
    self.tableview.top = view_FGX.bottom;
    self.tableview.backgroundColor = RGBA(237, 236, 236, 1);
    DiBu = [[GouWuChe_DiBu_V alloc]initWithFrame:CGRectMake(0, ScreenHeight - kTabbarHeight - kStatusBarAndNavigationBarHeight - [GouWuChe_DiBu_V get_H:nil], ScreenWidth, [GouWuChe_DiBu_V get_H:nil])];
    DiBu.delegate = self;
    [self.view addSubview:DiBu];
    self.tableview.height = ScreenHeight  - kTabbarHeight - kStatusBarAndNavigationBarHeight - [GouWuChe_DiBu_V get_H:nil] - view_FGX.bottom;

    if (!iOS11) {
        self.tableview.height = ScreenHeight - kStatusBarAndNavigationBarHeight - [GouWuChe_DiBu_V get_H:nil] - view_FGX.bottom;
    }
}

#pragma mark- 下单
-(void)GouWuChe_DiBu_V_Delegate_Action{

    NSMutableArray  *arr_Data = [[NSMutableArray alloc]init];
    for (GouWuChe_Model_Data *MMM in Model_GWC.data) {
        if (MMM.is_XZ) {
            NSMutableDictionary *dic_DDDDDD = [[NSMutableDictionary alloc]init];
            [dic_DDDDDD setObject:[NSString stringWithFormat:@"%li",MMM.goodsId] forKey:@"goodsid"];
            [dic_DDDDDD setObject:MMM.price forKey:@"price"];
            [dic_DDDDDD setObject:[NSString stringWithFormat:@"%li",MMM.num] forKey:@"num"];
            [arr_Data addObject:dic_DDDDDD];
        }
    }
    if (arr_Data.count == 0) {
        return;
    }
//       type 商品类型 1 拼团 2 开团 3 单独购买 4今日团购 5兑换 6接龙
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"car":arr_Data,@"type":@"3"};
    [NetRequest postWithUrl:order_getOrderDesc params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"确认订单 == %@",dict);
        
    } fail:^(id error) {
        
    }];
    
//    QueRenDingDan_GWC_VC    *VC = [[QueRenDingDan_GWC_VC alloc]init];
//    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark-  cell代理
-(void)GouWuChe_Cell_Delegate_Jia:(NSInteger)tag{
    //加
    GouWuChe_Model_Data *MM = Model_GWC.data[tag];
//    MM.num++;
    [self UP_Num:MM];
}
-(void)GouWuChe_Cell_Delegate_Jian:(NSInteger)tag{
    //减
    GouWuChe_Model_Data *MM = Model_GWC.data[tag];
//    MM.num--;
    [self UP_Num:MM];
}
-(void)GouWuChe_Cell_Delegate_SR:(NSInteger)tag str_Num:(NSString *)num{
    GouWuChe_Model_Data *MM = Model_GWC.data[tag];
    MM.num = [num integerValue];
    [self UP_Num:MM];
}
-(void)GouWuChe_Cell_Delegate_XZ:(NSInteger)tag{

    [self ShangPinJiaGe];
}

#pragma mark- 计算价格
-(void)ShangPinJiaGe{
    CGFloat JG_fff = 0.00;
    CGFloat YH_fff = 0.00;
    NSInteger SL = 0;
    for (GouWuChe_Model_Data *MMM in Model_GWC.data) {
        if (MMM.is_XZ) {
            JG_fff += MMM.num * [MMM.price floatValue];
            YH_fff += MMM.num * ([MMM.mprice floatValue] - [MMM.price floatValue]);
            SL += MMM.num;
        }
    }
    [DiBu set_JG:JG_fff YH:YH_fff SL:SL];
}

#pragma mark- 全选
-(void)GouWuChe_DiBu_V_Delegate_QX:(BOOL)XZ{
    for (GouWuChe_Model_Data *MMM in Model_GWC.data) {
        if (XZ) {
            MMM.is_XZ = YES;
        }else{
            MMM.is_XZ = NO;
        }
    }
    [self.tableview reloadData];
    
    [self ShangPinJiaGe];
}

#pragma mark- 修改商品数量
-(void)UP_Num:(GouWuChe_Model_Data*)mmmm{
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"gid":[NSString stringWithFormat:@"%li",mmmm.goodsId],@"num":[NSString stringWithFormat:@"%li",mmmm.num]};
    [NetRequest postWithUrl:goodscar_addAndReduce params:dic showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"修改商品数量 ==  ==%@",dict);
        [MyHelper UP_GWCSL];
        [self ShangPinJiaGe];

    } fail:^(id error) {
        
    }];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return Model_GWC.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [GouWuChe_Cell get_H:nil];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GouWuChe_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[GouWuChe_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    GouWuChe_Model_Data *MM = Model_GWC.data[indexPath.row];
    cell.tag = indexPath.row;
    cell.delegate = self;
    cell.model = MM;
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



@end
