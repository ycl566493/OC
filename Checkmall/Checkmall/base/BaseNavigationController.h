//
//  BaseNavigationController.h
//  黄轩博客 blog.libuqing.com
//
//  Created by 黄轩 on 16/5/26.
//  Copyright © 2016年 YISS. All rights reserved.
//  自定义nav

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

@property (nonatomic,strong) UIView *view_FGX;//分割线

@property (nonatomic,strong) NSMutableArray *rootVcAry;

@end
