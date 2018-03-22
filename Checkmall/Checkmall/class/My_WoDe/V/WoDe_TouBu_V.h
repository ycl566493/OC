//
//  WoDe_TouBu_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  我的信息头部

#import "MyUIView.h"
#import "WoDe_Model_RootClass.h"

@protocol WoDe_TouBu_V_Delegate <NSObject>

@optional
- (void)WoDe_TouBu_V_Delegate_CZ;//充值按钮

- (void)WoDe_TouBu_V_Delegate_YHJ;//优惠劵

@end

@interface WoDe_TouBu_V : MyUIView

@property(nonatomic,assign)id<WoDe_TouBu_V_Delegate>    delegate;

@property (nonatomic,strong) WoDe_Model_RootClass   *model;

@end
