//
//  TC_JL_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//  弹出接龙

#import "MyUIView.h"

@protocol TC_JL_V_Delegate <NSObject>

@optional
-(void)TC_JL_V_Delegate_TJ;//提交订单



@end

@interface TC_JL_V : MyUIView

@property (weak, nonatomic) IBOutlet UIButton *btn_TJ;//选好了 提交

@property (weak, nonatomic) IBOutlet UITableView *tableV;//列表

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_Title;//标题

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//订单价格

@property (weak, nonatomic) IBOutlet UIView *view_BJ;//透明背景

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *View_BJ_Y;//头部高度

@property (nonatomic, assign) id<TC_JL_V_Delegate>          delegate;

@end
