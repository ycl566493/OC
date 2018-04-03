//
//  ZhiFuFangShi_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  支付模块

#import "MyUIView.h"

@protocol ZhiFuFangShi_V_Delegate <NSObject>

@optional
- (void)ZhiFuFangShi_V_Delegate_LJCZ;//立即充值

@end

@interface ZhiFuFangShi_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_ZFFS;//支付方式

@property (weak, nonatomic) IBOutlet UIButton *btn_WX;//微信

@property (weak, nonatomic) IBOutlet UIButton *btn_ZFB;//支付宝

@property (weak, nonatomic) IBOutlet UIButton *btn_YE;//余额

@property (weak, nonatomic) IBOutlet UIButton *btn_LJCZ;//立即充值

@property (nonatomic, assign) NSInteger         int_ZFFS;//支付方式 1 微信 2 支付宝 3 余额支付

@property (nonatomic,assign)id<ZhiFuFangShi_V_Delegate>       delegate;


@end
