//
//  QueRenDingDan_TG_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "QueRenDingDan_TG_VC.h"
#import "DiZhiXinXi_V.h"//地址信息
#import "ShangPinXinXi_Cell.h"//商品信息
#import "ShangPinLieBiao_QRDD_V.h"//商品列表
#import "PeiSongFangShi_V.h"//配送方式
#import "ZhiFuFangShi_V.h"//支付方式


@interface QueRenDingDan_TG_VC (){
    UIScrollView    *scrollV;
    
    BOOL            bool_PS;//配送方式 0 自提 1 快递
}

@property (nonatomic,weak)DiZhiXinXi_V   *DZ;//地址信息

@property (nonatomic,weak)ShangPinLieBiao_QRDD_V     *QRDD;//商品列表

@property (nonatomic,weak)PeiSongFangShi_V      *PS;//配送方式

@property (nonatomic,weak)ZhiFuFangShi_V        *ZFFS;//支付方式


@end

@implementation QueRenDingDan_TG_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.width = ScreenWidth;
    
    bool_PS = 1;
    self.title = @"确认订单";
    [self init_UI];
    
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);
    
}


-(void)init_UI{
    
    
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.btn_DR.top - 1)];
    if (@available(iOS 11.0, *)){
        scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        scrollV.height = ScreenHeight - kTabbarSafeBottomMargin - kStatusBarAndNavigationBarHeight - 50-1;
    }
    if (!iOS11) {
        scrollV.height = ScreenHeight - self.btn_DR.height - kStatusBarAndNavigationBarHeight;
    }
    
    [self.view addSubview:scrollV];
    
    NSString *str_DZ = @"北京市北北京市北京京市北北京市北京市北京市京市北北京市北京市北京市京市北北京市北京市北京市市北京市";
    self.DZ.height = [DiZhiXinXi_V FS:bool_PS str_NR:str_DZ];
    self.DZ.bool_SC =0;
    self.DZ.str_DZ = str_DZ;
    self.DZ.bool_FS = bool_PS;
    [scrollV addSubview:self.DZ];
    
    self.QRDD.top = self.DZ.bottom;
    self.QRDD.height = [ShangPinLieBiao_QRDD_V get_H:@"3"];
    self.QRDD.index_Row = 3;
    [scrollV addSubview:self.QRDD];
    
    self.PS.top = self.QRDD.bottom;
    self.PS.height = [PeiSongFangShi_V get_H:nil];
    self.PS.bool_PS = bool_PS;
    [scrollV addSubview:self.PS];
    
    self.ZFFS.top = self.PS.bottom;
    self.ZFFS.height = [ZhiFuFangShi_V get_H:nil];
    [scrollV addSubview:self.ZFFS];
    
    scrollV.contentSize = CGSizeMake(0, self.ZFFS.bottom);
    
    if (!bool_PS) {
        //        self.lbl_JE.height = 30;
        self.lbl_JE_H.constant = 30;
        self.lbl_YF.hidden = YES;
    }else{
        //        self.lbl_JE.height = 20;
        self.lbl_JE_H.constant = 20;
        self.lbl_YF.hidden = 0;
    }
}

-(ZhiFuFangShi_V *)ZFFS{
    if (!_ZFFS) {
        ZhiFuFangShi_V *ZFFS = [ZhiFuFangShi_V init_Xib];
        ZFFS.width = self.view.width;
        [self.view addSubview:ZFFS];
        _ZFFS = ZFFS;
    }
    return _ZFFS;
}

-(PeiSongFangShi_V *)PS{
    if (!_PS) {
        PeiSongFangShi_V *PS = [PeiSongFangShi_V init_Xib];
        PS.width = self.view.width;
        [self.view addSubview:PS];
        _PS = PS;
    }
    return _PS;
}

-(ShangPinLieBiao_QRDD_V *)QRDD{
    if (!_QRDD) {
        ShangPinLieBiao_QRDD_V *QRDD = [ShangPinLieBiao_QRDD_V init_Xib];
        QRDD.width = self.view.width ;
        [self.view addSubview:QRDD];
        _QRDD = QRDD;
    }
    return _QRDD;
}

- (DiZhiXinXi_V *)DZ {
    if (!_DZ) {
        DiZhiXinXi_V *DZ = [DiZhiXinXi_V init_Xib];
        [self.view addSubview:DZ];
        _DZ = DZ;
    }
    return _DZ;
}






@end
