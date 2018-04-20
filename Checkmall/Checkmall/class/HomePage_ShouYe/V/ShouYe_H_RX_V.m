//
//  ShouYe_H_RX_V.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_H_RX_V.h"

@implementation ShouYe_H_RX_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

-(void)init_UI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn_RX = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    [btn_RX setImage:[UIImage imageNamed:@"ReXiao"] forState:UIControlStateNormal];
    [self addSubview:btn_RX];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, ScreenWidth, .5)];
    view.backgroundColor =UIColorFromHex(0xf2f2f2);
    [self addSubview:view];
}

+ (CGFloat)get_H:(id)data{
    return 40;
}

@end
