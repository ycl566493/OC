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

    image_V.layer.masksToBounds = YES;
    image_V.layer.cornerRadius = 5;
    image_V.userInteractionEnabled = YES;
    image_V.contentMode = UIViewContentModeScaleAspectFill;
    image_V.clipsToBounds = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [image_V addGestureRecognizer:singleTap];
    
    [self addSubview:image_V];
    
}

#pragma mark- 广告点击
- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    if (self.delegate && [self.delegate respondsToSelector:@selector(FenLei_H_GG_V_Delegate_Action)]) {
        [self.delegate FenLei_H_GG_V_Delegate_Action];
    }

}

-(void)setImage_TP:(NSString *)image_TP{
    _image_TP = image_TP;
    [image_V sd_setImageWithURL:[MyHelper imaeg_URL:image_TP view:image_V] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
}

+ (CGFloat)get_H:(id)data{
    return 98;
}

@end
