//
//  WoDe_ELeMa_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  饿了吗

#import "MyUIView.h"
@protocol WoDe_ELeMa_V_Delegate <NSObject>

@optional
- (void)WoDe_ELeMa_V_Delegate_Action;//广告点击

@end

@interface WoDe_ELeMa_V : MyUIView

@property (nonatomic,assign)id<WoDe_ELeMa_V_Delegate>           delegate;

@property (nonatomic,strong)NSString    *str_imageTP;//图片


@end
