//
//  WoDe_VC.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/3.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "WoDe_VC.h"
#import "WoDe_TouBu_V.h"//我的头部1
#import "WoDe_DD_V.h"//我的订单
#import "WoDe_FuWo_V.h"//服务
#import "WoDe_ELeMa_V.h"//广告位
#import "ChongZhi_VC.h"//充值页面
#import "DiZhiLieBiao_VC.h"//地址
#import "DingDanLieBiao_VC.h"//订单列表
#import "YouHuiJuan_VC.h"//优惠券

@interface WoDe_VC ()<WoDe_TouBu_V_Delegate,WoDe_FuWo_V_Delegate,WoDe_DD_V_Delegate>{
    WoDe_TouBu_V    *TouBu;//头部
    WoDe_DD_V       *DD;//我的订单模块
    WoDe_FuWo_V     *FW;//服务模块
    WoDe_ELeMa_V    *GGW;//广告位
    
}

@end

@implementation WoDe_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的";
    
    self.view.mj_y = -kStatusBarHeight;

    [self init_UI];
    
}

-(void)init_UI{
    self.scrollView.backgroundColor = RGBA(239, 239, 239, 1);
    
    TouBu = [[WoDe_TouBu_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [WoDe_TouBu_V get_H:nil])];
    TouBu.delegate = self;
    [self.scrollView addSubview:TouBu];
    
    DD = [[WoDe_DD_V alloc]initWithFrame:CGRectMake(0, TouBu.bottom, ScreenWidth, [WoDe_DD_V get_H:nil])];
    DD.delegate = self;
    [self.scrollView addSubview:DD];
    
    FW = [[WoDe_FuWo_V alloc]initWithFrame:CGRectMake(0, DD.bottom, ScreenWidth, [WoDe_FuWo_V get_H:nil])];
    FW.delegate = self;
    [self.scrollView addSubview:FW];
    
    GGW = [[WoDe_ELeMa_V alloc]initWithFrame:CGRectMake(0, FW.bottom, ScreenWidth, [WoDe_ELeMa_V get_H:nil])];
    [self.scrollView addSubview:GGW];
    
    self.scrollView.contentSize = CGSizeMake(0, GGW.bottom);
    
    self.scrollView.height = ScreenHeight  - kTabbarHeight;
    if (!iOS11) {
        self.scrollView.top = -20;
        self.scrollView.height = ScreenHeight  + kStatusBarAndNavigationBarHeight - kTabbarHeight;
    }
}

#pragma mark- 我的订单
- (void)WoDe_DD_V_Delegate_Acion:(NSInteger)tag{
    DingDanLieBiao_VC *vc = [[DingDanLieBiao_VC alloc]init];
    vc.int_Tag = tag;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 服务回调
//我的地址
- (void)WoDe_FuWo_V_Delegate_DZ{
    DiZhiLieBiao_VC *vc = [[DiZhiLieBiao_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 充值
- (void)WoDe_TouBu_V_Delegate_CZ{
    ChongZhi_VC *vc = [[ChongZhi_VC alloc]init];

    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 优惠劵
-(void)WoDe_TouBu_V_Delegate_YHJ{
    YouHuiJuan_VC   *vc = [[YouHuiJuan_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self FGX:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"yinchangtabbarviewcontroller" object:@"3" userInfo:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self FGX:NO];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}



@end
