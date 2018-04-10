//
//  ShangPinJiaJian_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPinJiaJian_V.h"

@implementation ShangPinJiaJian_V


-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self init_UI];
}

-(void)init_UI{
    
}

#pragma mark- 减
- (IBAction)btn_Jian_Action:(id)sender {
    NSInteger   int_S = [self.lbl_SL.text integerValue];
    if (int_S != 1) {
        int_S --;
        self.lbl_SL.text = [NSString stringWithFormat:@"%li",int_S];
    }
    if (int_S == 1) {
        self.btn_Jian.hidden = YES;
    }else{
        self.btn_Jian.hidden = NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShangPinJiaJian_V_Delegate_SL:)]) {
        [self.delegate ShangPinJiaJian_V_Delegate_SL:self.lbl_SL.text];
    }
}

-(void)set_str_SL:(NSString *)str{
    self.lbl_SL.text = str;
    NSInteger   int_S = [self.lbl_SL.text integerValue];
    if (int_S == 1) {
        self.btn_Jian.hidden = YES;
    }else{
        self.btn_Jian.hidden = NO;
    }
}

#pragma mark- 加
- (IBAction)btn_Jia_Action:(id)sender {
    NSInteger   int_S = [self.lbl_SL.text integerValue];
    int_S ++;
    self.lbl_SL.text = [NSString stringWithFormat:@"%li",int_S];
    
    if (int_S == 1) {
        self.btn_Jian.hidden = YES;
    }else{
        self.btn_Jian.hidden = NO;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShangPinJiaJian_V_Delegate_SL:)]) {
        [self.delegate ShangPinJiaJian_V_Delegate_SL:self.lbl_SL.text];
    }
}

+(CGFloat)get_H{
    return 52;
}

@end
