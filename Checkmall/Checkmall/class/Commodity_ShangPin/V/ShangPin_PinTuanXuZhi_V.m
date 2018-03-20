//
//  ShangPin_PinTuanXuZhi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_PinTuanXuZhi_V.h"

@interface ShangPin_PinTuanXuZhi_V(){
    UILabel             *lbl_title;
    UIButton            *btn_XQ;//详情按钮
    UIImageView         *iamge_LC;//商品流程
    
    UIView              *view_FGXX;//分割线细
    UIView              *view_FGXC;//分割线粗
}
@end

@implementation ShangPin_PinTuanXuZhi_V

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
    
    lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, ScreenWidth - 15* 2 - 90, 44)];
    lbl_title.font = font15;
    lbl_title.text = @"拼团须知";
    [self addSubview:lbl_title];
    
    btn_XQ = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 90, 0, 90, 44)];
    [btn_XQ setImage:[UIImage imageNamed:@"ChaKanXiangQing"] forState:UIControlStateNormal];
    [btn_XQ addTarget:self action:@selector(btn_XQ_Aciton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_XQ];
    
    view_FGXX = [[UIView alloc]initWithFrame:CGRectMake(0, btn_XQ.bottom , ScreenWidth, .5)];
    view_FGXX.backgroundColor = UIColorFromHex(0xeeeeee);
    [self addSubview:view_FGXX];
    
    UIButton *btn_LC = [[UIButton alloc]initWithFrame:CGRectMake(0, view_FGXX.bottom, ScreenWidth, 80)];
    [btn_LC setImage:[UIImage imageNamed:@"JieTuanLiuChen"] forState:UIControlStateNormal];
    [self addSubview:btn_LC];
    
    view_FGXC = [[UIView alloc]initWithFrame:CGRectMake(0, btn_LC.bottom, ScreenWidth, 21)];
    view_FGXC.backgroundColor = UIColorFromHex(0xeeeeee);
    [self addSubview:view_FGXC];
    
    
    
}

#pragma mark- 拼团须知
-(void)btn_XQ_Aciton{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShangPin_PinTuanXuZhi_V_Delegate_PTXZ)]) {
        [self.delegate ShangPin_PinTuanXuZhi_V_Delegate_PTXZ];
    }
}

+(CGFloat)get_H:(id)data{
    return 125 + 21;
}









@end
