//
//  ShouYe_H_FL_V.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_H_FL_V.h"

@implementation ShouYe_H_FL_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

#pragma mark- 初始化
-(void)init_UI{
    self.backgroundColor = [UIColor whiteColor];
    CGFloat w = ScreenWidth / 5;
    CGFloat h = 75;
    NSArray *arr_Image= @[@"ShuCai",@"ShuiGuo",@"ShuiChan",@"RouDan",@"LiangYou",@"RuPin",@"JiuYin",@"LingShi",@"ShuShi",@"SuShi"];
    
    for (NSInteger i = 0; i < 10; i ++) {
        UIButton    *btn = [[UIButton alloc]initWithFrame:CGRectMake(i%5 * w, i / 5 * h, w, h)];
  
        [btn setImage:[UIImage imageNamed:arr_Image[i]] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btn_Action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
    }
    
    UIView *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 150, ScreenWidth, 5)];
    view_FGX.backgroundColor = RGBA(239, 239, 239, 1);
    [self addSubview:view_FGX];
}

- (void)btn_Action:(UIButton*)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShouYe_H_FL_V_Delegate_Selegate:)]) {
        [self.delegate ShouYe_H_FL_V_Delegate_Selegate:btn.tag];
    }
}

+ (CGFloat)get_H:(id)data{
    return 155;
}

@end
