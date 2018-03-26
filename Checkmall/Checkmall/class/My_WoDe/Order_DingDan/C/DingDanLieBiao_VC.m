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
#import "DingDanLieBiao_Model_RootClass.h"

@interface DingDanLieBiao_VC ()<SlideButtonViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    SlideButtonView * slide;
    DingDanLieBiao_Model_RootClass *model_DD;//model
    
}

@end

@implementation DingDanLieBiao_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    self.title = @"我的订单";
    [self init_UI];
    [self init_Data:YES];
}

#pragma mark- 初始化
-(void)init_Data:(BOOL)Y_N{
    
//    类型 1全部 2代付款3未发货4待收货5待评价
    NSString *str = @"1";
    if (slide.tag == 1) {
        str = @"2";
    }else if (slide.tag == 2){
        str = @"3";
    }else if (slide.tag == 3){
        str = @"4";
    }else if (slide.tag == 4){
        str = @"5";
    }
    
    NSError *error;
    NSString *dataStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"jsonjson" ofType:@"txt"] encoding:NSUTF8StringEncoding error:&error];
    
    NSData *jsonData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jerror;
    
    NSDictionary*dicttttt = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jerror];

    
    
    
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"order_status":str,@"page":[NSString stringWithFormat:@"%li",self.pageIndex]};
    [NetRequest postWithUrl:order_orderList params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        if (Y_N) {
            model_DD = [[DingDanLieBiao_Model_RootClass alloc]initWithDictionary:dicttttt];
            
        }else{
            [model_DD Add_Dictionary:dicttttt];
        }
        [self.tableV reloadData];
        
        NSLog(@"订单列表 == %@",dict);
    } fail:^(id error) {
        
    }];
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
    
    //    tableV下拉刷新
    self.tableV.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //  结束刷新
        self.pageIndex =1;
        [self init_Data:YES];
        [self.tableV.mj_header endRefreshing];
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    self.tableV.mj_header.automaticallyChangeAlpha = YES;
    // tableV上拉加载
    self.tableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.pageIndex += 1;
        [self init_Data:NO];
        [self.tableV.mj_footer endRefreshing];
    }];
    
    
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model_DD.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [DingDan_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DingDan_Cell *cell = (DingDan_Cell *)[tableView dequeueReusableCellWithIdentifier:@"DingDan_Cell"];
    if (cell == nil) {
        cell= (DingDan_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"DingDan_Cell" owner:self options:nil]  lastObject];
    }
    DingDanLieBiao_Model_Data   *MMMM = model_DD.data[indexPath.row];
    
    cell.model = MMMM;
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
