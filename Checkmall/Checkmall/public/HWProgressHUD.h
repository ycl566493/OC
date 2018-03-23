//
//  HWProgressHUD.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/23.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWProgressHUD : UIView

//显示转圈加载
+ (void)show;

//空页面显示加载动画
+ (void)showWhilePushing;

//加载动画，传YES显示空页面显示加载动画，传NO显示转圈加载动画
+ (void)showWhilePushing:(BOOL)pushing;

//显示文字，默认两秒
+ (void)showMessage:(NSString *)message;

//显示文字，设置时长
+ (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration;

//隐藏
+ (void)dismiss;

@end
