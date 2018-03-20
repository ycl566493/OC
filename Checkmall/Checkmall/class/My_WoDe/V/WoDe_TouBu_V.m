//
//  WoDe_TouBu_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "WoDe_TouBu_V.h"


@interface WoDe_TouBu_V(){
    UIImageView     *imageV_TX;//头像
    UILabel         *lbl_Name;//名字
    UILabel         *lbl_JE;//金额
    UILabel         *lbl_JF;//积分
    UILabel         *lbl_YHJ;//优惠劵
    
    
}
@end

@implementation WoDe_TouBu_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 284)];
    imageV.image = [UIImage imageNamed:@"WoDeBeiJing"];
    [self addSubview:imageV];
    
    imageV_TX = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth - 68) / 2, 39, 68, 68)];
    imageV_TX.contentMode = UIViewContentModeScaleAspectFill;
    imageV_TX.clipsToBounds = YES;
    imageV_TX.backgroundColor = [UIColor redColor];
    imageV_TX.layer.masksToBounds = YES;
    imageV_TX.layer.borderColor = [UIColor whiteColor].CGColor;
    imageV_TX.layer.borderWidth =  .5;
    imageV_TX.layer.cornerRadius = imageV_TX.width / 2;
    [self addSubview:imageV_TX];
    
    lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(0, imageV_TX.bottom, ScreenWidth, 45)];
    lbl_Name.font = font15;
    lbl_Name.textColor = UIColorFromHex(0xffffff);
    lbl_Name.text = @"杨先生";//
    lbl_Name.textAlignment = 1;
    [self addSubview:lbl_Name];
    
    UIView *view_BJ = [[UIView alloc]initWithFrame:CGRectMake(15, lbl_Name.bottom, ScreenWidth - 15* 2, 122)];
    view_BJ.backgroundColor = [UIColor whiteColor];
    view_BJ.layer.cornerRadius = 2.5;
    view_BJ.layer.masksToBounds =YES;
    [self addSubview:view_BJ];
    
    UIImageView *imageV_CZBJ  = [[UIImageView alloc]initWithFrame:CGRectMake(0, view_BJ.height- 50, view_BJ.width, 50)];
    imageV_CZBJ.image = [UIImage imageNamed:@"JinEBeiJing"];
    imageV_CZBJ.userInteractionEnabled = YES;
    [view_BJ addSubview:imageV_CZBJ];
    
    //充值
    UIButton    *btn_CZ = [[UIButton alloc]initWithFrame:CGRectMake(imageV_CZBJ.width - 90, 7, 90, 43)];
    [btn_CZ setImage:[UIImage imageNamed:@"MaShangChongZhi"] forState:UIControlStateNormal];
    [btn_CZ addTarget:self action:@selector(btn_CZ_Action) forControlEvents:UIControlEventTouchUpInside];
    [imageV_CZBJ addSubview:btn_CZ];
    
    UIImageView *image_$ = [[UIImageView alloc]initWithFrame:CGRectMake(10, 21, 16, 16)];
    image_$.image = [UIImage imageNamed:@"$"];
    [imageV_CZBJ addSubview:image_$];
    
    for (NSInteger i = 1; i < 3; i ++) {
        UIView  *view_FGX =[[UIImageView alloc]initWithFrame:CGRectMake(view_BJ.width / 3* i, 15, 1, 50)];
        view_FGX.backgroundColor = RGBA(205, 203, 203, 1);
        [view_BJ addSubview:view_FGX];
    }
    
    //金额
    lbl_JE = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, view_BJ.width / 3, 30)];
    lbl_JE.textAlignment = 1;
    lbl_JE.font = [UIFont systemFontOfSize:25];
    lbl_JE.textColor = UIColorFromHex(0x333333);
    lbl_JE.text = @"999.99";
    [view_BJ addSubview:lbl_JE];
    //金额提示
    UILabel *lbl_JETS = [[UILabel alloc]initWithFrame:CGRectMake(0, lbl_JE.bottom , lbl_JE.width, 20)];
    lbl_JETS.font = font13;
    lbl_JETS.textColor = UIColorFromHex(0x999999);
    lbl_JETS.textAlignment =1;
    lbl_JETS.text = @"账号金额";
    [view_BJ addSubview:lbl_JETS];
    
    //积分
    lbl_JF = [[UILabel alloc]initWithFrame:CGRectMake(lbl_JE.right, 15, view_BJ.width / 3, 30)];
    lbl_JF.textAlignment = 1;
    lbl_JF.font = [UIFont systemFontOfSize:25];
    lbl_JF.textColor = UIColorFromHex(0x333333);
    lbl_JF.text = @"999";
    [view_BJ addSubview:lbl_JF];
    //积分提示
    UILabel *lbl_JFTS = [[UILabel alloc]initWithFrame:CGRectMake(lbl_JF.left, lbl_JF.bottom , lbl_JF.width, 20)];
    lbl_JFTS.font = font13;
    lbl_JFTS.textColor = UIColorFromHex(0x999999);
    lbl_JFTS.textAlignment =1;
    lbl_JFTS.text = @"积分";
    [view_BJ addSubview:lbl_JFTS];
    
    //优惠劵
    lbl_YHJ = [[UILabel alloc]initWithFrame:CGRectMake(lbl_JF.right, 15, view_BJ.width / 3, 30)];
    lbl_YHJ.textAlignment = 1;
    lbl_YHJ.font = [UIFont systemFontOfSize:25];
    lbl_YHJ.textColor = UIColorFromHex(0x333333);
    lbl_YHJ.text = @"99";
    lbl_YHJ.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    [lbl_YHJ addGestureRecognizer:singleTap];
    [view_BJ addSubview:lbl_YHJ];
    //优惠劵提示
    UILabel *lbl_YHJTS = [[UILabel alloc]initWithFrame:CGRectMake(lbl_YHJ.left, lbl_YHJ.bottom , lbl_YHJ.width, 20)];
    lbl_YHJTS.font = font13;
    lbl_YHJTS.textColor = UIColorFromHex(0x999999);
    lbl_YHJTS.textAlignment =1;
    lbl_YHJTS.text = @"优惠劵";
    lbl_YHJTS.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    [lbl_YHJ addGestureRecognizer:singleTap1];
    [view_BJ addSubview:lbl_YHJTS];
    
    
}

-(void)handleSingleTap{
    if (self.delegate && [self.delegate respondsToSelector:@selector(WoDe_TouBu_V_Delegate_YHJ)]) {
        [self.delegate WoDe_TouBu_V_Delegate_YHJ];
    }
}

#pragma mark- 充值
-(void)btn_CZ_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(WoDe_TouBu_V_Delegate_CZ)]) {
        [self.delegate WoDe_TouBu_V_Delegate_CZ];
    }
}


+ (CGFloat)get_H:(id)data{
    return 284;
}

@end
