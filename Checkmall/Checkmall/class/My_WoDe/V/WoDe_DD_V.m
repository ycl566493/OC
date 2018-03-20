
//
//  WoDe_DD_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "WoDe_DD_V.h"

@interface WoDe_DD_V(){
    
}
@end

@implementation WoDe_DD_V

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
    
    NSArray *arr = @[@"DaiFuKuan",@"DaiFaHuo",@"DaiShouHuo",@"QuanBuDingDan"];
    for (NSInteger i = 0; i < 4; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth / 4 * i, 0, ScreenWidth / 4, 90)];
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn_Action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i == 2) {
            UIView *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(btn.width - 1, 19, 1, 50)];
            view_FGX.backgroundColor = RGBA(205, 203, 203, 1);
            [btn addSubview:view_FGX];
        }
    }
    
    UIView *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 90, ScreenWidth , 10)];
    view_FGX.backgroundColor = RGBA(239, 239, 239, 1);
    [self addSubview:view_FGX];
}

- (void)btn_Action:(UIButton*)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(WoDe_DD_V_Delegate_Acion:)]) {
        NSInteger iiiii = 0;
        if (btn.tag == 0) {
            iiiii = 1;
        }
        if (btn.tag == 1) {
            iiiii = 2;
        }
        if (btn.tag == 2) {
            iiiii = 3;
        }
        if (btn.tag == 3) {
            iiiii = 0;
        }
        [self.delegate WoDe_DD_V_Delegate_Acion:iiiii];
    }
}

+ (CGFloat)get_H:(id)data{
    return 100;
}

@end
