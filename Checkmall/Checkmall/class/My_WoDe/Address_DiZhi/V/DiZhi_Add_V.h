//
//  DiZhi_Add_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  增加地址按钮

#import "MyUIView.h"

@protocol DiZhi_Add_V_Delegate <NSObject>

@optional
- (void)DiZhi_Add_V_Delegate_ADD;//添加地址

@end

@interface DiZhi_Add_V : MyUIView

@property (nonatomic,assign)id<DiZhi_Add_V_Delegate>    delegate;

@end
