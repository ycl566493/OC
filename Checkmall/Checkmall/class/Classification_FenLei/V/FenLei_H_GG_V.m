//
//  FenLei_H_GG_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "FenLei_H_GG_V.h"

@interface FenLei_H_GG_V(){
    UIImageView *image_V;//分类广告图
}
@end

@implementation FenLei_H_GG_V

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
