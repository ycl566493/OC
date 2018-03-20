//
//  QueRenDingDan_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "QueRenDingDan_VC.h"
#import "DiZhiXinXi_V.h"//地址信息
#import "ShangPinXinXi_Cell.h"//商品信息
#import "ShangPinJiaJian_V.h"//加减
#import "PeiSongFangShi_V.h"//配送方式
#import "ZhiFuFangShi_V.h"//支付方式
#import "ZhiFuChengGong_VC.h"//支付成功

@interface QueRenDingDan_VC (){
    UIScrollView    *scrollV;
    
    BOOL            bool_PS;//配送方式 0 自提 1 快递
}

@property (nonatomic,weak)DiZhiXinXi_V   *DZ;//地址信息

@property (nonatomic,weak)ShangPinXinXi_Cell *SP;//商品信息

@property (nonatomic,weak)ShangPinJiaJian_V     *JJ;//加减

@property (nonatomic,weak)PeiSongFangShi_V      *PS;//配送方式

@property (nonatomic,weak)ZhiFuFangShi_V        *ZFFS;//支付方式

@end

@implementation QueRenDingDan_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.width = ScreenWidth;
    
    bool_PS = 0;
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
    
    self.SP.top = self.DZ.bottom;
    self.SP.height = [ShangPinXinXi_Cell get_H];
    [scrollV addSubview:self.SP];
    
    self.JJ.top = self.SP.bottom;
    self.JJ.height = [ShangPinJiaJian_V get_H];
    [scrollV addSubview:self.JJ];
    
    self.PS.top = self.JJ.bottom;
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

-(ShangPinJiaJian_V *)JJ{
    if (!_JJ) {
        ShangPinJiaJian_V *JJ = [ShangPinJiaJian_V init_Xib];
        JJ.width = self.view.width ;
        [self.view addSubview:JJ];
        _JJ = JJ;
    }
    return _JJ;
}

-(ShangPinXinXi_Cell *)SP{
    if (!_SP) {
        ShangPinXinXi_Cell *SP = [ShangPinXinXi_Cell init_Xib];
        SP.width = self.view.width;
        [self.view addSubview:SP];
        _SP = SP;
    }
    return _SP;
}

- (DiZhiXinXi_V *)DZ {
    if (!_DZ) {
        DiZhiXinXi_V *DZ = [DiZhiXinXi_V init_Xib];
        [self.view addSubview:DZ];
        _DZ = DZ;
    }
    return _DZ;
}


#pragma mark- 支付

- (IBAction)btn_ZF_Action:(UIButton *)sender {
    ZhiFuChengGong_VC *vc = [[ZhiFuChengGong_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
