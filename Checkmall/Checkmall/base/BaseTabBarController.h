//
//  BaseTabBarController.h
//  同文同书
//
//  Created by 信码互通 on 2017/12/12.
//  Copyright © 2017年 XC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController<UITabBarControllerDelegate>

- (void)showOrHiddenTabBar:(BOOL)visible;

@end
