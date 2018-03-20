//
//  FenLei_H_Title_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "FenLei_H_Title_V.h"

@interface FenLei_H_Title_V(){
    UILabel         *lbl_Title;
    UIView          *view_FGX;//分割线
}
@end

@implementation FenLei_H_Title_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    lbl_Title = [[UILabel alloc]initWithFrame:CGRectMake(10, 8, self.width - 20, 17)];
    lbl_Title.font = [UIFont systemFontOfSize:15];
    lbl_Title.textColor = UIColorFromHex(0x333333);
    lbl_Title.text = @"热门推荐";
    [self addSubview:lbl_Title];
    lbl_Title.width = [MyHelper strWidth:lbl_Title.text andFont:lbl_Title.font andHeight:lbl_Title.height];
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(lbl_Title.right + 10, lbl_Title.top + 2, 1, 12)];
    view_FGX.backgroundColor = RGBA(78, 175, 64, 1);
    [self addSubview:view_FGX];
}

+ (CGFloat)get_H:(id)data{
    return 25;
}

@end
