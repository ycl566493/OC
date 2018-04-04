//
//  FenLei_VC.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/3.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "FenLei_VC.h"
#import "FenLei_Cell.h"//分类cell
#import "FenLei_ShangPin_Cell.h"//商品列表
#import "FenLei_H_GG_V.h"//分类广告
#import "FenLei_H_Title_V.h"//分类标题
#import "FenLeiLieBiao_Model_RootClass.h"//分类列表
#import "FenLeiShangPin_Model_RootClass.h"//分类商品数据
#import "ShangPinXiangQing_VC.h"//商品详情
#import "GuangGao_Model_RootClass.h"//广告model
#import "KBY_View.h"

@interface FenLei_VC ()<UITableViewDelegate,UITableViewDataSource,FenLei_H_GG_V_Delegate,FenLei_ShangPin_Cell_Delegate>{
    UITableView *table_V_FL;//分类列表
    UITableView *table_V_SP;//商品列表
    FenLei_H_GG_V       *GG;//分类广告
    FenLei_H_Title_V    *BT;//分类标题
    
    NSInteger           Select_Index;//选中的分类

    FenLeiLieBiao_Model_RootClass       *model_FLLB;//分类列表
    FenLeiShangPin_Model_RootClass      *model_FLSP;//分类商品数据
    GuangGao_Model_RootClass            *model_GG;//广告
}

@property (nonatomic,weak)KBY_View      *kby;//空白页
@end

@implementation FenLei_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    Select_Index = 0;
    self.pageIndex = 1;
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"分类";
    [self init_UI];
    [self init_Data_FL];
    
    [self init_data_GG];
}

-(void)FenLei_H_GG_V_Delegate_Action{
    if (model_GG.data.count > 0) {
        GuangGao_Model_Data *MMM = model_GG.data[0];
        if (MMM.istype == 1) {
            //商品详情
            ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
            vc.Str_ID = [NSString stringWithFormat:@"%li",MMM.goodsId];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (MMM.istype == 2){
            
        }
    }
}

#pragma mark- 广告接口
- (void)init_data_GG{
    //    广告位类型 1首页 2今日团购 3分类 4个人中心
    
    [NetRequest postWithUrl:Advertisement_getBannerList params:@{@"type":@"3"} showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"广告数据  == %@",dict);
        model_GG = [[GuangGao_Model_RootClass alloc]initWithDictionary:dict];
        if (model_GG.code == 1) {
            if (model_GG.data.count>0) {
                GuangGao_Model_Data *MMM = model_GG.data[0];
                GG.image_TP = MMM.adverUrl;
            }
            [table_V_SP reloadData];
        }
    } fail:^(id error) {
        
    }];
}


#pragma mark- 分类列表
-(void)init_Data_FL{
    [NetRequest postWithUrl:Category_getCatelist params:@{} showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        model_FLLB = [[FenLeiLieBiao_Model_RootClass alloc]initWithDictionary:dict];
        NSLog(@"分类列表 ==  %@",dict);
        if (model_FLLB.code == 1) {
            [table_V_FL reloadData];
            [self init_data_SP:YES];
        }
        
    } fail:^(id error) {
        
    }];
}


-(void)init_data_SP:(BOOL)Y_N{
    
    FenLeiLieBiao_Model_Data *MMMM = model_FLLB.data[Select_Index];
    [NetRequest postWithUrl:Category_getCategoryName params:@{@"page":[NSString stringWithFormat:@"%li",self.pageIndex],@"pid":[NSString stringWithFormat:@"%li",MMMM.idField]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"商品 == %@",dict);
        if (Y_N) {
            model_FLSP = [[FenLeiShangPin_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model_FLSP Add_Dictionary:dict];
        }
        
        if (model_FLSP.code == 1) {
            [table_V_SP reloadData];
        }
        [self UP_KBse];
    } fail:^(id error) {
        
    }];
}

-(KBY_View *)kby{
    if (!_kby) {
        KBY_View*  kby = [KBY_View init_Xib];
        _kby = kby;
        _kby.frame = table_V_SP.bounds;
        _kby.hidden = YES;
        [table_V_SP addSubview:_kby];
    }
    return _kby;
}

#pragma mark- 刷新空白页
- (void)UP_KBse{
    
    if (model_FLSP.data.count == 0) {
        self.kby.hidden = NO;
    }else{
        self.kby.hidden = YES;
    }
    
}

#pragma mark- 添加购物车
- (void)FenLei_ShangPin_Cell_Delegate_GWC:(NSInteger)tag{
    FenLeiShangPin_Model_Data   *MMMM = model_FLSP.data[tag];

    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"goods_id":[NSString stringWithFormat:@"%li",MMMM.idField],@"num":@"1"};
    
    [NetRequest postWithUrl:goodscar_addGoodsToCar params:dic showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        
        NSLog(@"添加购物车 = = =%@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [MyHelper UP_GWCSL];
        }
    } fail:^(id error) {
        
        
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
}

-(void)init_UI{
    table_V_FL = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 90, ScreenHeight  - kTabbarHeight - kStatusBarAndNavigationBarHeight)];
    table_V_FL.delegate = self;
    table_V_FL.dataSource = self;
    table_V_FL.separatorStyle = UITableViewCellSeparatorStyleNone;
    table_V_FL.backgroundColor = RGBA(246, 246, 246, 1);
    if (@available(iOS 11.0, *)){
        table_V_FL.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:table_V_FL];
    
    table_V_SP = [[UITableView alloc]initWithFrame:CGRectMake(90, 0, ScreenWidth - 90, ScreenHeight  - kTabbarHeight - kStatusBarAndNavigationBarHeight)];
    table_V_SP.delegate = self;
    table_V_SP.dataSource = self;
    table_V_SP.separatorStyle = UITableViewCellSeparatorStyleNone;
    table_V_SP.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)){
        table_V_SP.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
//    tableV下拉刷新
    table_V_SP.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //  结束刷新
        self.pageIndex =1;
        [self init_data_SP:YES];
        [table_V_SP.mj_header endRefreshing];
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    table_V_SP.mj_header.automaticallyChangeAlpha = YES;
    // tableV上拉加载
    table_V_SP.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.pageIndex += 1;
        [self init_data_SP:NO];
        [table_V_SP.mj_footer endRefreshing];
    }];

    [self.view addSubview:table_V_SP];
    
    GG = [[FenLei_H_GG_V alloc]initWithFrame:CGRectMake(0, 0, table_V_SP.width, [FenLei_H_GG_V get_H:nil])];
    GG.delegate = self;
    
    BT = [[FenLei_H_Title_V alloc]initWithFrame:CGRectMake(0, 0, table_V_SP.width, [FenLei_H_Title_V get_H:nil])];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == table_V_SP) {
        return 2;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == table_V_FL) {
        return model_FLLB.data.count;
    }
    if ((section == 1 &&table_V_SP == tableView)) {
        return model_FLSP.data.count;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == table_V_FL) {
        return [FenLei_Cell get_H:nil];
    }
    if (tableView == table_V_SP) {
        return [FenLei_ShangPin_Cell get_H:nil
                ];
    }
    return 0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == table_V_FL) {
        FenLei_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_FL"];
        if (!cell) {
            cell = [[FenLei_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_FL"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        FenLeiLieBiao_Model_Data *mmm = model_FLLB.data[indexPath.row];
        cell.model = mmm;
        [cell iF_Select:indexPath.row == Select_Index ? YES : NO];
        
        return cell;
    }else{
        FenLei_ShangPin_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_SP"];
        if (!cell) {
            cell = [[FenLei_ShangPin_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_SP"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        FenLeiShangPin_Model_Data   *MMm = model_FLSP.data[indexPath.row];
        cell.model = MMm;
        cell.tag = indexPath.row;
        cell.delegate = self;
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView && model_GG.data.count>0) {
        return [FenLei_H_GG_V get_H:nil];
    }
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView && model_GG.data.count>0) {
        return GG;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView) {
        return [FenLei_H_Title_V get_H:nil];
    }
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView) {
        return BT;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == table_V_FL) {
        Select_Index = indexPath.row;
        [table_V_FL reloadData];
        [self init_data_SP:YES];
    }else if (tableView == table_V_SP){
        ShangPinXiangQing_VC *vc = [[ShangPinXiangQing_VC alloc]init];
        FenLeiShangPin_Model_Data   *MMm = model_FLSP.data[indexPath.row];

        vc.Str_ID = [NSString stringWithFormat:@"%li",MMm.idField];
        [self.navigationController pushViewController:vc animated:YES];

    }
}

@end
