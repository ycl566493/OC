//
//  DiZhi_Add_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DiZhi_Add_V.h"

@interface DiZhi_Add_V(){
    UIButton    *btn_TJ;//添加地址
}
@end

@implementation DiZhi_Add_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    btn_TJ = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - 150)/2, 50, 150, 35)];
    [btn_TJ setImage:[UIImage imageNamed:@"TianJiiaDiZhi"]  forState:UIControlStateNormal];
    [btn_TJ addTarget:self action:@selector(btn_TJ_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_TJ];
}

- (void)btn_TJ_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(DiZhi_Add_V_Delegate_ADD)]) {
        [self.delegate DiZhi_Add_V_Delegate_ADD];
    }
}

+(CGFloat)get_H:(id)data{
    return 100;
}

@end
