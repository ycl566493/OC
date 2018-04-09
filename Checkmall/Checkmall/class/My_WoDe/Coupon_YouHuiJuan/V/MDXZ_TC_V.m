//
//  MDXZ_TC_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/9.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MDXZ_TC_V.h"

@implementation MDXZ_TC_V


#pragma mark- 提交按钮
- (IBAction)btn_TJ:(id)sender {
    if ([self.txt_XM.text isEqualToString:@""]) {
        [MyHelper showMessage:@"请输入姓名！"];
    }else if (![MyHelper isPhone:self.txt_SJ.text ]) {
        [MyHelper showMessage:@"请输入正确的手机号！"];
    }else{
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(MDXZ_TC_V_Delegate_XM:DH:)]) {
            [self.delegate MDXZ_TC_V_Delegate_XM:self.txt_XM.text DH:self.txt_SJ.text];
        }
        self.hidden = YES;
        [self removeFromSuperview];
    }
}

#pragma mark- 关闭
- (IBAction)btn_GB:(id)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}

@end
