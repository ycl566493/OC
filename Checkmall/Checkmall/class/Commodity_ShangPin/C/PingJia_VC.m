//
//  PingJia_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "PingJia_VC.h"
#import "PingJia_Cell.h"

@interface PingJia_VC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PingJia_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    self.title = @"评价";
    [self init_UI];
}

-(void)init_Data:(BOOL)Y_N{
    
}

-(void)init_UI{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"PingJia_Cell" bundle:nil] forCellReuseIdentifier:@"PingJia_Cell"];
    
    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    //    tableV下拉刷新
    WeakSelf(ws);
    self.tableV.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws.tableV.mj_header endRefreshing];
        ws.pageIndex =1;
        [ws init_Data:YES];
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    // tableV上拉加载
    self.tableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [ws.tableV.mj_footer endRefreshing];
        ws.pageIndex += 1;
        [ws init_Data:NO];
    }];

}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [PingJia_Cell get_H:@"啊哈哈啊哈哈哈哈哈哈哈" row:indexPath.row % 4];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PingJia_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"PingJia_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PingJia_Cell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell set_W:indexPath.row];
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
