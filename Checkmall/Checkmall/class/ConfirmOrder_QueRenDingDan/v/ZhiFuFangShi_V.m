//
//  ZhiFuFangShi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhiFuFangShi_V.h"

@implementation ZhiFuFangShi_V

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.int_ZFFS = 1;
}

//微信
- (IBAction)btn_WX_Action:(id)sender {
    NSLog(@"微信");
    self.lbl_ZFFS.text = @"微信支付";
    self.btn_WX.selected = YES;
    self.btn_YE.selected = NO;
    self.btn_ZFB.selected = NO;
    self.int_ZFFS = 1;
}

//支付宝
- (IBAction)btn_ZFB_Action:(id)sender {
    NSLog(@"支付宝");
    self.lbl_ZFFS.text = @"支付宝支付";
    self.btn_WX.selected = NO;
    self.btn_YE.selected = NO;
    self.btn_ZFB.selected = YES;
    self.int_ZFFS = 2;
}

//余额
- (IBAction)btn_YE_Action:(id)sender {
    NSLog(@"余额");
    self.lbl_ZFFS.text = @"余额支付";
    self.btn_WX.selected = NO;
    self.btn_YE.selected = YES;
    self.btn_ZFB.selected = NO;
    self.int_ZFFS = 3;

}
//立即充值
- (IBAction)btn_LJCZ_Action:(id)sender {
    NSLog(@"立即充值");
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZhiFuFangShi_V_Delegate_LJCZ)]) {
        [self.delegate ZhiFuFangShi_V_Delegate_LJCZ];
    }
}

+(CGFloat)get_H:(id)data{
    return 178.5;
}

@end
