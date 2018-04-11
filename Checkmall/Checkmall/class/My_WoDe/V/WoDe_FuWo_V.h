//
//  WoDe_FuWo_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  我的服务

#import "MyUIView.h"

@protocol WoDe_FuWo_V_Delegate <NSObject>

@optional

- (void)WoDe_FuWo_V_Delegate_TG;//我的团购

- (void)WoDe_FuWo_V_Delegate_DZ;//地址按钮

- (void)WoDe_FuWo_V_Delegate_BZ;//帮助按钮

- (void)WoDe_FuWo_V_Delegate_KF;//客服按钮

@end

@interface WoDe_FuWo_V : MyUIView

@property (nonatomic,assign)id<WoDe_FuWo_V_Delegate>    delegate;

@end
