//
//  ZhuanXiang_DiBu_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/7.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhuanXiang_DiBu_V.h"

@interface ZhuanXiang_DiBu_V(){
    UIButton        *btn_SY;//返回
    UIButton        *btn_OK;//选好了
    UILabel         *lbl_DDJE;//订单金额
    UILabel         *lbl_SDRQ;//送达日期
    
}

@end

@implementation ZhuanXiang_DiBu_V

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
    
    UIView  *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth , .5)];
    view_FGX.backgroundColor = RGBA(208, 208, 208, 1);
    [self addSubview:view_FGX];
    
    btn_SY = [[UIButton alloc]initWithFrame:CGRectMake(0, .5, 50, 48.5)];
    [btn_SY setImage:[UIImage imageNamed:@"ShouYe2"] forState:UIControlStateNormal];
    [btn_SY addTarget:self action:@selector(btn_SY_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_SY];
    
    UIView  *view_FGX2 = [[UIView alloc]initWithFrame:CGRectMake(btn_SY.right, 7, .5, 49 - 7*2)];
    view_FGX2.backgroundColor = RGBA(208, 208, 208, 1);
    [self addSubview:view_FGX2];
    
    btn_OK = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 105, 0, 105, 49)];
    btn_OK.backgroundColor = RGBA(251, 100, 9, 1);
    [btn_OK setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_OK setTitle:@"选好了(3)" forState:UIControlStateNormal];
    btn_OK.titleLabel.font = font15;
    [btn_OK addTarget:self action:@selector(btn_OK_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_OK];
    
    lbl_DDJE = [[UILabel alloc]initWithFrame:CGRectMake(view_FGX2.right + 15, 8, btn_OK.left - view_FGX2.right - 15 * 2, 18)];
    lbl_DDJE.font = [UIFont systemFontOfSize:14];
    lbl_DDJE.textColor = UIColorFromHex(0x333333);
    lbl_DDJE.text = @"订单金额：￥3333.33";
    [self addSubview:lbl_DDJE];
    
    lbl_SDRQ = [[UILabel alloc]initWithFrame:CGRectMake(lbl_DDJE.left, lbl_DDJE.bottom +  5, lbl_DDJE.width, 12)];
    lbl_SDRQ.font = [UIFont systemFontOfSize:11];
    lbl_SDRQ.text = @"提货时间：2019-08-08";
    lbl_SDRQ.textColor = UIColorFromHex(0x666666);
    [self addSubview:lbl_SDRQ];
    
    
    
}

-(void)btn_SY_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZhuanXiang_DiBu_V_Delegate_FH)]) {
        [self.delegate ZhuanXiang_DiBu_V_Delegate_FH];
    }
}

- (void)btn_OK_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZhuanXiang_DiBu_V_Delegate_QD)]) {
        [self.delegate ZhuanXiang_DiBu_V_Delegate_QD];
    }
}

+ (CGFloat)get_H:(id)data{
    
    return 49;
}

@end
