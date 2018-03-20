//
//  ShangPinXiangQing_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/10.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPinXiangQing_VC.h"
#import "ShangPin_TuPian_V.h"//商品图片详情
#import "ShangPin_XinXi_V.h"//商品信息
#import "ShangPin_XiaDan_V.h"//商品下单
#import "ShangPin_MS_V.h"//商品描述
#import "ShangPin_PinTuanXuZhi_V.h"//拼团须知
#import "QueRenDingDan_VC.h"//确认订单
#import "QueRenDingDan_PT_VC.h"//确认订单拼团
#import "TC_PTXZ_V.h"//拼团须知

@interface ShangPinXiangQing_VC ()<ShangPin_PinTuanXuZhi_V_Delegate>{
    ShangPin_TuPian_V       *TuPian;
    UIScrollView            *scrollV;//滑动背景
    ShangPin_XinXi_V        *XinXi;//商品信息
    ShangPin_XiaDan_V       *XiaDan;//商品下单信息
    ShangPin_MS_V           *MS;//商品描述
    ShangPin_PinTuanXuZhi_V *PinTuan;//拼团
    
    UIButton                *btn_GM;//购买
    UIButton                *btn_PT;//拼团
    
    UILabel                 *lbl_GM;//购买文字
    UILabel                 *lbl_PT;//购买文字
    UIButton                *btn_GWC;//购物车按钮
    
    
}

@property(weak,nonatomic)TC_PTXZ_V          *PTXZ;//拼团须知

@end

@implementation ShangPinXiangQing_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    [self init_UI];

    
}


-(TC_PTXZ_V *)PTXZ{
    if (!_PTXZ) {
        TC_PTXZ_V* PTXZ = [TC_PTXZ_V init_Xib];
        [self.view addSubview:PTXZ];
        _PTXZ = PTXZ;
        _PTXZ.frame = self.window.bounds;
    }
    return _PTXZ;
}

#pragma mark- 拼团须知
-(void)ShangPin_PinTuanXuZhi_V_Delegate_PTXZ{
    [self.window addSubview:self.PTXZ];
}

#pragma mark- 初始化
-(void)init_UI{
  
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - kStatusBarAndNavigationBarHeight  - 54 - kTabbarSafeBottomMargin)];
    if (@available(iOS 11.0, *)){
        scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:scrollV];
    
    TuPian = [[ShangPin_TuPian_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShangPin_TuPian_V get_H:nil])];
    [scrollV addSubview:TuPian];
    
    NSString *str_Title = @"商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称";
    XinXi = [[ShangPin_XinXi_V alloc]initWithFrame:CGRectMake(0, TuPian.bottom, ScreenWidth, [ShangPin_XinXi_V get_H:str_Title])];
    XinXi.str_Title = str_Title;
    [scrollV addSubview:XinXi];
    
    //下单模块
    XiaDan = [[ShangPin_XiaDan_V alloc]initWithFrame:CGRectMake(0, XinXi.bottom, ScreenWidth, [ShangPin_XiaDan_V get_H:nil])];
    [scrollV addSubview:XiaDan];
    
    
    NSString    *str_MS = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    MS = [[ShangPin_MS_V alloc]initWithFrame:CGRectMake(0, XiaDan.bottom, ScreenWidth, [ShangPin_MS_V get_H:str_MS])];
    MS.str_Title = str_MS;
    MS.height = [ShangPin_MS_V get_H:str_MS];
    [scrollV addSubview:MS];
    
    PinTuan = [[ShangPin_PinTuanXuZhi_V alloc]initWithFrame:CGRectMake(0, MS.bottom, ScreenWidth, [ShangPin_PinTuanXuZhi_V get_H:nil])];
    PinTuan.delegate = self;
    [scrollV addSubview:PinTuan];
    
    scrollV.contentSize = CGSizeMake(0, PinTuan.bottom );
    
    btn_GM = [[UIButton alloc]initWithFrame:CGRectMake(0, scrollV.bottom, ScreenWidth / 2, 54)];
    btn_GM.backgroundColor = UIColorFromHex(0xff9333);
    [btn_GM addTarget:self action:@selector(btn_GM_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_GM];
    lbl_GM = [[UILabel alloc]initWithFrame:btn_GM.bounds];
    lbl_GM.numberOfLines = 2;
    lbl_GM.textAlignment = 1;
    lbl_GM.text = @"￥25\n单独购买";
    lbl_GM.textColor = [UIColor whiteColor];
    lbl_GM.font = [UIFont systemFontOfSize:17];
    [btn_GM addSubview:lbl_GM];
    
    btn_PT = [[UIButton alloc]initWithFrame:CGRectMake(lbl_GM.right, scrollV.bottom, ScreenWidth / 2, 54)];
    btn_PT.backgroundColor = UIColorFromHex(0xff7800);
    [btn_PT addTarget:self action:@selector(btn_PT_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_PT];
    lbl_PT = [[UILabel alloc]initWithFrame:btn_GM.bounds];
    lbl_PT.numberOfLines = 2;
    lbl_PT.textAlignment = 1;
    lbl_PT.text = @"￥15\n马上参团";
    lbl_PT.textColor = [UIColor whiteColor];
    lbl_PT.font = [UIFont systemFontOfSize:17];
    [btn_PT addSubview:lbl_PT];

    btn_GWC = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 50 - 15, btn_GM.top - 5 - 50, 50, 50)];
    [btn_GWC setImage:[UIImage imageNamed:@"GouWuCheYuan"] forState:UIControlStateNormal];
    [self.view addSubview:btn_GWC];
    
    if (!iOS11) {
        scrollV.height = ScreenHeight - kStatusBarAndNavigationBarHeight ;
    }
    
}


#pragma mark- 拼团
- (void)btn_PT_Action{
    QueRenDingDan_PT_VC *VC = [[QueRenDingDan_PT_VC alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark- 购买
-(void)btn_GM_Action{
    QueRenDingDan_VC *VC= [[QueRenDingDan_VC alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}













@end
