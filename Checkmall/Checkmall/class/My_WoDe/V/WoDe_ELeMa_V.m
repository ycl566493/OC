//
//  WoDe_ELeMa_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "WoDe_ELeMa_V.h"

@interface WoDe_ELeMa_V(){
    UIImageView *image_ELM;
}
@end

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
    image_ELM = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height)];
//    image_ELM.image = [UIImage imageNamed:@""];
//    image_ELM.backgroundColor = [UIColor redColor];
    image_ELM.contentMode = UIViewContentModeScaleAspectFill;
    image_ELM.clipsToBounds = YES;
    image_ELM.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [image_ELM addGestureRecognizer:singleTap];
    [self addSubview:image_ELM];
}

-(void)setStr_imageTP:(NSString *)str_imageTP{
    _str_imageTP = str_imageTP;
    [image_ELM sd_setImageWithURL:[MyHelper imaeg_URL:str_imageTP view:image_ELM] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
}

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(WoDe_ELeMa_V_Delegate_Action)]) {
        [self.delegate WoDe_ELeMa_V_Delegate_Action];
    }
    
}

+ (CGFloat)get_H:(id)data{
    return 140;
}

@end
