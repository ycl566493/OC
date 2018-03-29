//
//  FenLei_H_GG_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  分类广告view

#import "MyUIView.h"

@protocol FenLei_H_GG_V_Delegate <NSObject>

@optional
- (void)FenLei_H_GG_V_Delegate_Action;//广告点

@end

@interface FenLei_H_GG_V : MyUIView

@property (nonatomic,assign)id<FenLei_H_GG_V_Delegate>      delegate;

@property (nonatomic,strong)NSString        *image_TP;

@end
