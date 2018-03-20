//
//  WoDe_DD_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  我的订单信息

#import "MyUIView.h"

@protocol WoDe_DD_V_Delegate <NSObject>

@optional
- (void)WoDe_DD_V_Delegate_Acion:(NSInteger)tag;//0全部 1代付款 2代发货 3待收货

@end

@interface WoDe_DD_V : MyUIView

@property (nonatomic,assign)id<WoDe_DD_V_Delegate>  delegate;

@end
