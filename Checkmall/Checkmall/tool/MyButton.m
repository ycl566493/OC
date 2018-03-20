//
//  MyButton.m
//  同文同书
//
//  Created by 杨成龙MAC on 2017/7/2.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

-(void)set_LX:(NSInteger)tpye JG:(CGFloat)JG{
 
    if (tpye == 1) {
//        self.titleLabel.backgroundColor = [UIColor greenColor];
        CGSize imageSize = self.imageView.frame.size;
        CGSize titleSize = self.titleLabel.frame.size;
        CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
        CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
        if (titleSize.width + 0.5 < frameSize.width) {
            titleSize.width = frameSize.width;
        }
        CGFloat totalHeight = (imageSize.height + titleSize.height );
        self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height) , 0.0, 0.0, - titleSize.width);
        self.titleEdgeInsets = UIEdgeInsetsMake(JG, - imageSize.width, - (totalHeight - titleSize.height), 0);
    }else if (tpye == 2){
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.size.width, 0, self.imageView.size.width)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width, 0, -self.titleLabel.bounds.size.width)];
    }
    
}

@end
