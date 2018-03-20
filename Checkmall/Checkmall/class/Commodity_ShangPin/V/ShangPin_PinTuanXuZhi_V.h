//
//  ShangPin_PinTuanXuZhi_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//  拼团须知

#import "MyUIView.h"

@protocol ShangPin_PinTuanXuZhi_V_Delegate <NSObject>

@optional
-(void)ShangPin_PinTuanXuZhi_V_Delegate_PTXZ;//拼团须知

@end

@interface ShangPin_PinTuanXuZhi_V : MyUIView

@property (nonatomic,assign)id<ShangPin_PinTuanXuZhi_V_Delegate> delegate;

@end
