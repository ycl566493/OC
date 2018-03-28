//
//  ShouYe_H_FL_V.h
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//  首页分类模块

#import "MyUIView.h"
@protocol ShouYe_H_FL_V_Delegate <NSObject>

@optional
-(void)ShouYe_H_FL_V_Delegate_Selegate:(NSInteger)tag;

@end

@interface ShouYe_H_FL_V : MyUIView

@property (nonatomic,assign)id<ShouYe_H_FL_V_Delegate>      delegate;

@end
