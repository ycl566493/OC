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

@interface GouWuChe_VC ()<GouWuChe_DiBu_V_Delegate>{
    GouWuChe_DiBu_V  *DiBu;
}

@end

@implementation GouWuChe_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"购物车";

    [self init_UI];
}

-(void)init_UI{
    
    self.tableview.backgroundColor = RGBA(237, 236, 236, 1);
    DiBu = [[GouWuChe_DiBu_V alloc]initWithFrame:CGRectMake(0, ScreenHeight - kTabbarHeight - kStatusBarAndNavigationBarHeight - [GouWuChe_DiBu_V get_H:nil], ScreenWidth, [GouWuChe_DiBu_V get_H:nil])];
    DiBu.delegate = self;
    [self.view addSubview:DiBu];
    self.tableview.height = ScreenHeight  - kTabbarHeight - kStatusBarAndNavigationBarHeight - [GouWuChe_DiBu_V get_H:nil];

    if (!iOS11) {
        self.tableview.height = ScreenHeight - kStatusBarAndNavigationBarHeight - [GouWuChe_DiBu_V get_H:nil];
    }
}

-(void)GouWuChe_DiBu_V_Delegate_Action{
    QueRenDingDan_GWC_VC    *VC = [[QueRenDingDan_GWC_VC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
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
