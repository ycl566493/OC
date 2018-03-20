//
//  ShouYe_H_PTTJ_V.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_H_PTTJ_V.h"

@implementation ShouYe_H_PTTJ_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    
    self.backgroundColor = [UIColor whiteColor];
    UIButton    *btn_PT =[[UIButton alloc]initWithFrame:CGRectMake(15, 0, (ScreenWidth - 15*2 - 8) / 2, 75)];
    [btn_PT setImage:[UIImage imageNamed:@"PinTuan"] forState:UIControlStateNormal];
    [btn_PT addTarget:self action:@selector(btn_PT_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_PT];
    
    UIButton    *btn_TJ =[[UIButton alloc]initWithFrame:CGRectMake(btn_PT.right + 8, 0, (ScreenWidth - 15*2 - 8) / 2, 75)];
    [btn_TJ setImage:[UIImage imageNamed:@"TuanGou"] forState:UIControlStateNormal];
    [btn_TJ addTarget:self action:@selector(btn_TJ_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_TJ];
    
    UIView  *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 85, ScreenWidth, 5)];
    view_FGX.backgroundColor = UIColorFromHex(0xf2f2f2);
    [self addSubview:view_FGX];
    
    
}

#pragma mark- 拼团
- (void)btn_PT_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShouYe_H_PTTJ_V_delegate_Action:)]) {
        [self.delegate ShouYe_H_PTTJ_V_delegate_Action:1];
    }
}

#pragma mark- 特价
- (void)btn_TJ_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShouYe_H_PTTJ_V_delegate_Action:)]) {
        [self.delegate ShouYe_H_PTTJ_V_delegate_Action:2];
    }
}

+ (CGFloat)get_H:(id)data{
    return 90;
}

@end
