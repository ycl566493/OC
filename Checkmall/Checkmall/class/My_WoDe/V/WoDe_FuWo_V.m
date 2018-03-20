//
//  WoDe_FuWo_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "WoDe_FuWo_V.h"

@implementation WoDe_FuWo_V

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
    
    NSArray *arr = @[@"WoDeTuanGou",@"DiZhi",@"BangZhu",@"KeFu"];
    for (NSInteger i = 0; i < 4; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth / 4 * i, 0, ScreenWidth / 4, 81)];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn_Action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    UIView *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 81, ScreenWidth , 10)];
    view_FGX.backgroundColor = RGBA(239, 239, 239, 1);
    [self addSubview:view_FGX];
}

- (void)btn_Action:(UIButton*)btn{
    if (btn.tag == 1) {
        //收货地址
        if (self.delegate && [self.delegate respondsToSelector:@selector(WoDe_FuWo_V_Delegate_DZ)]) {
            [self.delegate WoDe_FuWo_V_Delegate_DZ];
        }
    }
}

+ (CGFloat)get_H:(id)data{
    return 91;
}

@end
