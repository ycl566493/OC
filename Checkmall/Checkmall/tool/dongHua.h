//
//  dongHua.h
//  动画
//
//  Created by 信码互通 on 16/3/3.
//  Copyright © 2016年 信码互通. All rights reserved.
//  自定义加载动画

#import <UIKit/UIKit.h>


@interface dongHua : UIView

+ (instancetype)addDongHua;//第一次加载

- (void)xianShi:(UIView*)view;//显示加载
- (void)yinChang;//隐藏加载


@end
