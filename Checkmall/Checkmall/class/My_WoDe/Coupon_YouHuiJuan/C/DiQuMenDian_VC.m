//
//  DiQuMenDian_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DiQuMenDian_VC.h"
#import "SlideButtonView.h"
#import "DiQuMenDian_Cell.h"
#import "DiQu_Model_RootClass.h"//地区model
#import "MenDian_Model_RootClass.h"//门店

@interface DiQuMenDian_VC ()<SlideButtonViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    SlideButtonView * slide;
    DiQu_Model_RootClass    * model_DQ;
    MenDian_Model_RootClass * model_MD;
}

@end

@implementation DiQuMenDian_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex =1;
    self.title = @"选择门店";
    [self init_UI];
    [self init_data_DQ];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)init_UI{
    slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    slide.arr_Title = @[];
    slide.Font_Size = 14;
    slide.No_Color = UIColorFromHex(0x333333);
    slide.Yes_Color = UIColorFromHex(0x5db851);
    slide.No_backgroundColor = UIColorFromHex(0xffffff);
    slide.Yes_backgroundColor = UIColorFromHex(0xffffff);
    slide.bool_SlideBar = YES;
    slide.SlideBar_Color = UIColorFromHex(0x5db851);
    slide.delegate = self;
    slide.tag = 0;
    [self.view addSubview:slide];
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"DiQuMenDian_Cell" bundle:nil] forCellReuseIdentifier:@"DiQuMenDian_Cell"];
    
    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
//    self.tableV_H.constant = ScreenHeight -kStatusBarAndNavigationBarHeight - kTabbarSafeBottomMargin - slide.height ;
//    if (!iOS11) {
//        self.tableV_H.constant = ScreenHeight - kTabbarHeight - 5 ;
//    }
    
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

- (void)SlideButtonViewDelegate_Acion:(NSInteger )btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        DiQu_Model_Data *MMMM = model_DQ.data[btn_Tag];
        [self init_data_MD:MMMM.geoId];
    }
}


#pragma mark- 获取地区
- (void)init_data_DQ{
    [NetRequest postWithUrl:address_getArea params:@{} showAnimate:YES showMsg:YES vc:nil success:^(NSDictionary *dict) {
        NSLog(@"获取地区");
        model_DQ = [[DiQu_Model_RootClass alloc]initWithDictionary:dict];
        if (model_DQ.code == 1) {
            NSMutableArray *Arr_data = [[NSMutableArray alloc]init];
            for (DiQu_Model_Data *MMMM in model_DQ.data) {
                [Arr_data addObject:MMMM.geoName];
            }
            slide.arr_Title = Arr_data;
            if (Arr_data.count >0) {
                DiQu_Model_Data *MMMM = model_DQ.data[0];
                [self init_data_MD:MMMM.geoId];
            }
        }
    } fail:^(id error) {
        
    }];
}

#pragma mark- 获取门店地址
- (void)init_data_MD:(NSInteger)code_id{
    [NetRequest postWithUrl:address_getStoreInfo params:@{@"code":[NSString stringWithFormat:@"%li",(long)code_id]} showAnimate:YES showMsg:YES vc:nil success:^(NSDictionary *dict) {
        NSLog(@"获取门店 = = %@",dict);
        model_MD  = [[MenDian_Model_RootClass alloc]initWithDictionary:dict];
        if (model_MD.code == 1) {
            [self.tableV reloadData];
        }
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model_MD.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [DiQuMenDian_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiQuMenDian_Cell *cell = (DiQuMenDian_Cell *)[tableView dequeueReusableCellWithIdentifier:@"DiQuMenDian_Cell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DiQuMenDian_Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
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













@end
