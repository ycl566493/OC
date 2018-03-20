//
//  WoDe_ELeMa_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "WoDe_ELeMa_V.h"

@implementation WoDe_ELeMa_V

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
    UIImageView *image_ELM = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
//    image_ELM.image = [UIImage imageNamed:@""];
    image_ELM.backgroundColor = [UIColor redColor];
    [self addSubview:image_ELM];
}

+ (CGFloat)get_H:(id)data{
    return 100;
}

@end
