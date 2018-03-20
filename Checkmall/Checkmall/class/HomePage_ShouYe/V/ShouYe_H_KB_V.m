//
//  ShouYe_H_KB_V.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_H_KB_V.h"


@interface ShouYe_H_KB_V(){
    UIImageView *imageV_JRTJ;//今日推荐
    UIButton    *btn_GD;//更多
    UILabel     *lbl_Title;//标题
}
@end

@implementation ShouYe_H_KB_V

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
    
    imageV_JRTJ = [[UIImageView alloc]initWithFrame:CGRectMake(14, 13, 54, 16)];
    imageV_JRTJ.image = [UIImage imageNamed:@"JinRiKuaiBao"];
    [self addSubview:imageV_JRTJ];
    
    btn_GD = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 34 - 15, 0, 34,42)];
    [btn_GD setImage:[UIImage imageNamed:@"GengDuo"] forState:UIControlStateNormal];
    [self addSubview:btn_GD];
    
    lbl_Title = [[UILabel alloc]initWithFrame:CGRectMake(imageV_JRTJ.right + 14, 0, btn_GD.left - 15, 42)];
    lbl_Title.textColor = UIColorFromHex(0x333333);
    lbl_Title.font = font13;
    lbl_Title.text = @"鲜辣滚烫火锅季";
    [self addSubview:lbl_Title];
    
    
}

+ (CGFloat)get_H:(id)data{
    return 42;
}

@end
