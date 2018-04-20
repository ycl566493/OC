//
//  DanPin_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//  单品view

#import "MyUIView.h"

@protocol DanPin_V_Delegate <NSObject>

@optional
- (void)DanPin_V_Delegate_Action_FH;//返回
- (void)DanPin_V_Delegate_Action_DD;//订单
- (void)DanPin_V_Delegate_Action_FX;//分享

@end

@interface DanPin_V : MyUIView


@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//价格

@property (weak, nonatomic) IBOutlet UILabel *lbl_TS;//提示


@property (nonatomic,assign)id<DanPin_V_Delegate>   delegate;


@end
