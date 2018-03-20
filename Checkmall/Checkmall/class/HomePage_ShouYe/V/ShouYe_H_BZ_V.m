//
//  ShouYe_H_BZ_V.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_H_BZ_V.h"

@implementation ShouYe_H_BZ_V


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

#pragma mark- 初始化
- (void)init_UI{
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton     *btn_1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth / 3, 31.5)];
    [btn_1 setImage:[UIImage imageNamed:@"YouXuan"] forState:UIControlStateNormal];
    [self addSubview:btn_1];
    
    UIButton     *btn_2 = [[UIButton alloc]initWithFrame:CGRectMake(btn_1.right, 0,ScreenWidth / 3, 31.5)];
    [btn_2 setImage:[UIImage imageNamed:@"AnXinJianCe"] forState:UIControlStateNormal];
    [self addSubview:btn_2];
    
    UIButton     *btn_3 = [[UIButton alloc]initWithFrame:CGRectMake(btn_2.right, 0,ScreenWidth / 3, 31.5)];
    [btn_3 setImage:[UIImage imageNamed:@"PeiFuBaoZhang"] forState:UIControlStateNormal];
    [self addSubview:btn_3];
    
    UIView  *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 31.5, ScreenWidth, .5)];
    view_FGX.backgroundColor = RGBA(234, 234, 234, 1);
    [self addSubview:view_FGX];
    
    
}

+ (CGFloat)get_H:(id)data{
    return 32;
}

@end
