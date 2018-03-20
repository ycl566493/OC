//
//  ZhiFuFangShi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhiFuFangShi_V.h"

@implementation ZhiFuFangShi_V

//微信
- (IBAction)btn_WX_Action:(id)sender {
    NSLog(@"微信");
    self.lbl_ZFFS.text = @"微信支付";
    self.btn_WX.selected = YES;
    self.btn_YE.selected = NO;
    self.btn_ZFB.selected = NO;
}

//支付宝
- (IBAction)btn_ZFB_Action:(id)sender {
    NSLog(@"支付宝");
    self.lbl_ZFFS.text = @"支付宝支付";
    self.btn_WX.selected = NO;
    self.btn_YE.selected = NO;
    self.btn_ZFB.selected = YES;
}

//余额
- (IBAction)btn_YE_Action:(id)sender {
    NSLog(@"余额");
    self.lbl_ZFFS.text = @"余额支付";
    self.btn_WX.selected = NO;
    self.btn_YE.selected = YES;
    self.btn_ZFB.selected = NO;
}
//立即充值
- (IBAction)btn_LJCZ_Action:(id)sender {
    NSLog(@"立即充值");

}

+(CGFloat)get_H:(id)data{
    return 204;
}

@end
