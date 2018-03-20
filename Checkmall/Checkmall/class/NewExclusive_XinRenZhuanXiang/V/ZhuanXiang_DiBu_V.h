//
//  ZhuanXiang_DiBu_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/7.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@protocol ZhuanXiang_DiBu_V_Delegate <NSObject>

@optional
- (void)ZhuanXiang_DiBu_V_Delegate_FH;//返回

- (void)ZhuanXiang_DiBu_V_Delegate_QD;//确认订单


@end

@interface ZhuanXiang_DiBu_V : MyUIView

@property (nonatomic,assign)id<ZhuanXiang_DiBu_V_Delegate>  delegate;

@end
