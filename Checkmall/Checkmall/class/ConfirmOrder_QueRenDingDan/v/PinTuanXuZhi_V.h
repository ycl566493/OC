//
//  PinTuanXuZhi_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//  拼团须知

#import "MyUIView.h"

@protocol PinTuanXuZhi_V_Delegate <NSObject>

@optional
-(void)PinTuanXuZhi_V_Delegate_Action;

@end

@interface PinTuanXuZhi_V : MyUIView


@property (weak, nonatomic) IBOutlet UIButton *btn_PT;//拼团须知

@property (weak, nonatomic) IBOutlet UIButton *btn_CKXQ;//查看详情

@property (nonatomic,assign) id<PinTuanXuZhi_V_Delegate>        delegate;


@end
