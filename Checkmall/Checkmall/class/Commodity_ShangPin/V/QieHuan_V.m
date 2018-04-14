//
//  QieHuan_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "QieHuan_V.h"

@implementation QieHuan_V

- (void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
}

#pragma mark- 初始化
- (void)init_UI{
    [self.btn_XQ setTitle:@"详情介绍" forState:UIControlStateNormal];
    [self.btn_XQ setTitleColor:UIColorFromHex(0x5db851) forState:UIControlStateSelected];
    [self.btn_XQ setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn_XQ.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
   
    [self.btn_SP setTitle:@"视频教程" forState:UIControlStateNormal];
    [self.btn_SP setTitleColor:UIColorFromHex(0x5db851) forState:UIControlStateSelected];
    [self.btn_SP setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn_SP.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];


}

#pragma mark- 详情点击
- (IBAction)btn_XQ:(id)sender {
    if (self.btn_XQ.selected) {
        
    }else{
        self.btn_XQ.selected = YES;
        self.btn_SP.selected = NO;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(QieHuan_V_Delegate_QH:)]) {
            [self.delegate QieHuan_V_Delegate_QH:YES];
        }
    }
}

#pragma mark- 视频点击
- (IBAction)btn_SP:(id)sender {
    if (self.btn_SP.selected) {
        
    }else{
        self.btn_SP.selected = YES;
        self.btn_XQ.selected = NO;
        if (self.delegate && [self.delegate respondsToSelector:@selector(QieHuan_V_Delegate_QH:)]) {
            [self.delegate QieHuan_V_Delegate_QH:NO];
        }
    }
}


+ (CGFloat)get_H:(id)data{
    return 40;
}
@end
