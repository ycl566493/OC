//
//  ZhuanXiang_VC.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/3.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ZhuanXiang_VC.h"
#import "ZhuanXiang_GG_H.h"//专享
#import "ZhuanXiang_Title_V.h"//专享标题
#import "ZhuanXiang_Cell.h"//专享cell
#import "ZhuanXiang_ShangPin_Cell.h"//专享商品cell
#import "ZhuanXiang_DiBu_V.h"//专享底部
#import "QueRenDingDan_TG_VC.h"//团购

@interface ZhuanXiang_VC ()<UITableViewDelegate,UITableViewDataSource,ZhuanXiang_DiBu_V_Delegate>{
    UITableView *table_V_FL;//分类列表
    UITableView *table_V_SP;//商品列表
    ZhuanXiang_GG_H *GG;//广告
    ZhuanXiang_Title_V *BT;//标题
    ZhuanXiang_DiBu_V   *DB;//底部
    
    NSInteger           Select_Index;//选中的分类
}

@end

@implementation ZhuanXiang_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"今日团购";
    
    [self init_UI];
    
    
    [self setLeftItemWithIcon:[UIImage imageNamed:@"FanHui"] title:@"" selector:@selector(backAction)];
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    table_V_FL.height = DB.top;
//    table_V_SP.height = DB.top;
//    self.view.height = ScreenHeight;
}

//视图已经出现
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s", __FUNCTION__);
    [super viewDidAppear:animated];
    [table_V_FL reloadData];
}

#pragma mark- 返回上一页
-(void)backAction{
    if (self.bool_TZ) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
    
}

#pragma mark- 底部返回
-(void)ZhuanXiang_DiBu_V_Delegate_FH{
    [self backAction];
}

#pragma mark- 确认订单
-(void)ZhuanXiang_DiBu_V_Delegate_QD{
    QueRenDingDan_TG_VC *vc = [[QueRenDingDan_TG_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}



-(void)init_UI{
    table_V_FL = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 90, ScreenHeight - kStatusBarAndNavigationBarHeight - [ZhuanXiang_DiBu_V get_H:nil] )];
    table_V_FL.delegate = self;
    table_V_FL.dataSource = self;
    table_V_FL.separatorStyle = UITableViewCellSeparatorStyleNone;
//    table_V_FL.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    table_V_FL.backgroundColor = RGBA(246, 246, 246, 1);
    if (@available(iOS 11.0, *)){
        table_V_FL.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:table_V_FL];

    table_V_SP = [[UITableView alloc]initWithFrame:CGRectMake(90, 0, ScreenWidth - 90, ScreenHeight -kTabbarSafeBottomMargin- kStatusBarAndNavigationBarHeight - [ZhuanXiang_DiBu_V get_H:nil])];
    table_V_SP.delegate = self;
    table_V_SP.dataSource = self;
    table_V_SP.separatorStyle = UITableViewCellSeparatorStyleNone;
//    table_V_SP.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    table_V_SP.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)){
        table_V_SP.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:table_V_SP];

    GG = [[ZhuanXiang_GG_H alloc]initWithFrame:CGRectMake(0, 0, table_V_SP.width, [ZhuanXiang_GG_H get_H:nil])];
    BT = [[ZhuanXiang_Title_V alloc]initWithFrame:CGRectMake(0, 0, table_V_SP.width, [ZhuanXiang_Title_V get_H:nil])];
    
    DB = [[ZhuanXiang_DiBu_V alloc]initWithFrame:CGRectMake(0, ScreenHeight - kStatusBarAndNavigationBarHeight - kTabbarSafeBottomMargin - [ZhuanXiang_DiBu_V get_H:nil], ScreenWidth, [ZhuanXiang_DiBu_V get_H:nil])];
    DB.delegate = self;
    [self.view addSubview:DB];
    table_V_FL.height = DB.top;
    
    if (!iOS11) {
         if (self.bool_TZ){
             table_V_FL.height = ScreenHeight -kStatusBarAndNavigationBarHeight;

         }else{
             table_V_FL.height = ScreenHeight -kStatusBarAndNavigationBarHeight - DB.height;
         }
             
        table_V_SP.height = ScreenHeight - kStatusBarAndNavigationBarHeight -  DB.height;

    }
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == table_V_SP) {
        return 2;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ((section == 1 &&table_V_SP == tableView) || tableView == table_V_FL) {
        return 30;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == table_V_FL) {
        return [ZhuanXiang_Cell get_H:nil];
    }
    if (tableView == table_V_SP) {
        return [ZhuanXiang_ShangPin_Cell get_H:nil];
    }
    return 0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == table_V_FL) {
        ZhuanXiang_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_FL"];
        if (!cell) {
            cell = [[ZhuanXiang_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_FL"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell iF_Select:indexPath.row == Select_Index ? YES : NO];
        
        return cell;
    }else{
        ZhuanXiang_ShangPin_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_SP"];
        if (!cell) {
            cell = [[ZhuanXiang_ShangPin_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_SP"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView) {
        return [ZhuanXiang_GG_H get_H:nil];
    }
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView) {
        return GG;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView) {
        return [ZhuanXiang_Title_V get_H:nil];
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
    }
    
}

@end
