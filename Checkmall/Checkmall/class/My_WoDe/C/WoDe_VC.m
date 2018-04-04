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
#import "WoDe_Model_RootClass.h"//modle
#import "GuangGao_Model_RootClass.h"//广告model
#import "ShangPinXiangQing_VC.h"//商品详情
#import "JieLong_VC.h"

@interface WoDe_VC ()<WoDe_TouBu_V_Delegate,WoDe_FuWo_V_Delegate,WoDe_DD_V_Delegate,WoDe_ELeMa_V_Delegate>{
    WoDe_TouBu_V    *TouBu;//头部
    WoDe_DD_V       *DD;//我的订单模块
    WoDe_FuWo_V     *FW;//服务模块
    WoDe_ELeMa_V    *GGW;//广告位
    WoDe_Model_RootClass    *model_WD;//我的modle
    GuangGao_Model_RootClass        *model_GG;
}

@end

@implementation WoDe_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的";
    
    self.view.mj_y = -kStatusBarHeight;

    [self init_UI];
    [self init_data_GG];
}

-(void)WoDe_ELeMa_V_Delegate_Action{
    if (model_GG.data.count > 0) {
        GuangGao_Model_Data *MMM = model_GG.data[0];
        if (MMM.istype == 1) {
            //商品详情
            ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
            vc.Str_ID = [NSString stringWithFormat:@"%li",MMM.goodsId];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (MMM.istype == 3){
            //接龙
//            JieLong_VC *vc = [[JieLong_VC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark- 帮助
-(void)WoDe_FuWo_V_Delegate_BZ{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"帮助中心" message:@"" preferredStyle: UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"010-57281579" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
        if (phoneVersion.floatValue < 10.0) {
            //iOS10 以前使用
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Tel://01057281579"]];
        }
        else {
            //iOS10 以后使用
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Tel://01057281579"]
                                               options:@{}
                                     completionHandler:nil];
        }
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
}

#pragma mark- 客服
-(void)WoDe_FuWo_V_Delegate_KF{
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"客服电话" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"010-57281579" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
        if (phoneVersion.floatValue < 10.0) {
            //iOS10 以前使用
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Tel://01057281579"]];
        }
        else {
            //iOS10 以后使用
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Tel://01057281579"]
                                               options:@{}
                                     completionHandler:nil];
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
}



#pragma mark- 广告接口
- (void)init_data_GG{
    //    广告位类型 1首页 2今日团购 3分类 4个人中心
    
    [NetRequest postWithUrl:Advertisement_getBannerList params:@{@"type":@"4"} showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"广告数据  == %@",dict);
        model_GG = [[GuangGao_Model_RootClass alloc]initWithDictionary:dict];
        if (model_GG.code == 1) {
            if (model_GG.data.count > 0) {
                GuangGao_Model_Data *MMM = model_GG.data[0];
                GGW.str_imageTP = MMM.adverUrl;
            }
        }
    } fail:^(id error) {
        
    }];
}


-(void)init_Data{
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    [NetRequest postWithUrl:user_getUserInfo params:@{@"token":[MyHelper toToken]} showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"个人信息 == = %@",dict);
        model_WD = [[WoDe_Model_RootClass alloc]initWithDictionary:dict];
        [kUserDefaults setObject:model_WD.data.creditCardBalance forKey:YuE];

        TouBu.model = model_WD;
    } fail:^(id error) {
        
    }];
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
    GGW.delegate = self;
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
    vc.bool_SH = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 充值
- (void)WoDe_TouBu_V_Delegate_CZ{
    ChongZhi_VC *vc = [[ChongZhi_VC alloc]init];

    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 优惠劵
-(void)WoDe_TouBu_V_Delegate_YHJ{
//    YouHuiJuan_VC   *vc = [[YouHuiJuan_VC alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self FGX:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"yinchangtabbarviewcontroller" object:@"3" userInfo:nil];
    [self init_Data];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self FGX:NO];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}



@end
