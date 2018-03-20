//
//  DingDanLieBiao_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DingDanLieBiao_VC.h"
#import "SlideButtonView.h"//头部
#import "DingDan_Cell.h"//订单cell

@interface DingDanLieBiao_VC ()<SlideButtonViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    SlideButtonView * slide;
}

@end

@implementation DingDanLieBiao_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    [self init_UI];
}

-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        
    }
}

#pragma mark- 初始化
-(void)init_UI{
    slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    slide.arr_Title = @[@"全部",@"代付款",@"代发货",@"待收货"];
    slide.Font_Size = 14;
    slide.No_Color = UIColorFromHex(0x333333);
    slide.Yes_Color = UIColorFromHex(0x5db851);
    slide.No_backgroundColor = UIColorFromHex(0xffffff);
    slide.Yes_backgroundColor = UIColorFromHex(0xffffff);
    slide.bool_SlideBar = YES;
    slide.SlideBar_Color = UIColorFromHex(0x5db851);
    slide.delegate = self;
    slide.tag = self.int_Tag;
    slide.init_Selected = self.int_Tag;
    [self.view addSubview:slide];
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;

    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.tableV_H.constant = ScreenHeight -kStatusBarAndNavigationBarHeight - kTabbarSafeBottomMargin - slide.height ;
    if (!iOS11) {
        self.tableV_H.constant = ScreenHeight - kTabbarHeight - 5 ;
    }
    
    
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [DingDan_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DingDan_Cell *cell = (DingDan_Cell *)[tableView dequeueReusableCellWithIdentifier:@"DingDan_Cell"];
    if (cell == nil) {
        cell= (DingDan_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"DingDan_Cell" owner:self options:nil]  lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
