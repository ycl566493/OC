//
//  ShouYe_H_PTTJ_V.h
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//  首页拼团特价

#import "MyUIView.h"

@protocol ShouYe_H_PTTJ_V_delegate <NSObject>

@optional
- (void)ShouYe_H_PTTJ_V_delegate_Action:(NSInteger)tag;//1、团购 2、特价

@end

@interface ShouYe_H_PTTJ_V : MyUIView

@property (nonatomic,assign)id<ShouYe_H_PTTJ_V_delegate>    delegate;

@end

