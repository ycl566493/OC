//
//  ShangPin_MS_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_MS_V.h"

@interface ShangPin_MS_V(){
    UILabel     *lbl_MSXX;//描述信息
    UIView      *view_FGX;//分割线
}
@end

@implementation ShangPin_MS_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    
    UILabel * lbl_MS = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, ScreenWidth - 15 * 2, 44)];
    lbl_MS.text = @"商品描述";
    lbl_MS.font = font15;
    lbl_MS.textColor = UIColorFromHex(0x333333);
    [self addSubview:lbl_MS];
    
    UIView  *view_FFF = [[UIView alloc]initWithFrame:CGRectMake(0, 44, ScreenWidth, .5)];
    view_FFF.backgroundColor = UIColorFromHex(0xeeeeee);
    [self addSubview:view_FFF];
    
    lbl_MSXX = [[UILabel alloc]initWithFrame:CGRectMake(15, view_FFF.bottom + 15, ScreenWidth - 15 * 2, 19)];
    lbl_MSXX.numberOfLines = 0;
    lbl_MSXX.font = font13;
    lbl_MSXX.textColor = UIColorFromHex(0x666666);
    [self addSubview:lbl_MSXX];
    
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, lbl_MSXX.bottom + 15, ScreenWidth, .5)];
    view_FGX.backgroundColor = UIColorFromHex(0xeeeeee);
    [self addSubview:view_FGX];
    
}

-(void)setModel:(ShangPin_Model_RootClass *)model{
    _model = model;
    lbl_MSXX.text = model.data.productDesc;
    lbl_MSXX.height = [MyHelper getSpaceLabelHeight:lbl_MSXX.text withFont:lbl_MSXX.font withWidth:lbl_MSXX.width Spacing:5];
    [MyHelper setLabelSpace:lbl_MSXX withValue:lbl_MSXX.text withFont:lbl_MSXX.font Spacing:4];
    view_FGX.top = lbl_MSXX.bottom + 15;
}

-(void)setModel_JL:(JLXQ_Model_RootClass *)model_JL{
    _model_JL = model_JL;
    lbl_MSXX.text = model_JL.data.promotion;
    lbl_MSXX.height = [MyHelper getSpaceLabelHeight:lbl_MSXX.text withFont:lbl_MSXX.font withWidth:lbl_MSXX.width Spacing:5];
    [MyHelper setLabelSpace:lbl_MSXX withValue:lbl_MSXX.text withFont:lbl_MSXX.font Spacing:4];
    view_FGX.top = lbl_MSXX.bottom + 14.5;
}

+(CGFloat)get_H:(id)data{
    
    CGFloat fff = 45 + 15*2;
    NSString *str_T = data;
    
    return fff + [MyHelper getSpaceLabelHeight:str_T withFont:font13 withWidth:ScreenWidth - 30 Spacing:5];
}

@end
