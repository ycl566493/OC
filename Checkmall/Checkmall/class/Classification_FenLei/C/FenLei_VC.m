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

@interface FenLei_VC ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *table_V_FL;//分类列表
    UITableView *table_V_SP;//商品列表
    FenLei_H_GG_V       *GG;//分类广告
    FenLei_H_Title_V    *BT;//分类标题
    
    NSInteger           Select_Index;//选中的分类

}

@end

@implementation FenLei_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"分类";
    [self init_UI];
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
    [self.view addSubview:table_V_SP];
    
    GG = [[FenLei_H_GG_V alloc]initWithFrame:CGRectMake(0, 0, table_V_SP.width, [FenLei_H_GG_V get_H:nil])];
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
    if ((section == 1 &&table_V_SP == tableView) || tableView == table_V_FL) {
        return 30;
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
        [cell iF_Select:indexPath.row == Select_Index ? YES : NO];
        
        return cell;
    }else{
        FenLei_ShangPin_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_SP"];
        if (!cell) {
            cell = [[FenLei_ShangPin_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_SP"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 && table_V_SP == tableView) {
        return [FenLei_H_GG_V get_H:nil];
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
    }
}

@end
