//
//  MyUITextView.h
//  同文同书
//
//  Created by 信码互通 on 2017/6/28.
//  Copyright © 2017年 XC. All rights reserved.
//  简单封装的带默认文字的uitextview

#import <UIKit/UIKit.h>

@interface MyUITextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;

/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
