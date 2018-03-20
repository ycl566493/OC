//
//  MYUILabel.h
//  同文同书
//
//  Created by 信码互通 on 2017/6/27.
//  Copyright © 2017年 XC. All rights reserved.
// 扩展lbl属性

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface MYUILabel : UILabel
{
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment; //上对其 下对其 居中

@end
