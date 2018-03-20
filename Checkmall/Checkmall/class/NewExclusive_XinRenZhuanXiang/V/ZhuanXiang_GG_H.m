//
//  ZhuanXiang_GG_H.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/7.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhuanXiang_GG_H.h"

@interface ZhuanXiang_GG_H(){
    UIImageView *image_V;//分类广告图
}
@end

@implementation ZhuanXiang_GG_H

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

- (void)init_UI{
    image_V = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, self.width - 20, 98 - 10)];
    image_V.backgroundColor = [UIColor redColor];
    image_V.layer.masksToBounds = YES;
    image_V.layer.cornerRadius = 5;
    [self addSubview:image_V];
    
}

+ (CGFloat)get_H:(id)data{
    return 98;
}

@end
