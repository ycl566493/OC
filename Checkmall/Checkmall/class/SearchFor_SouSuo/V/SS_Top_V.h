//
//  SS_Top_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//  搜索头部

#import "MyUIView.h"


@protocol SS_Top_V_Delegate <NSObject>

@optional
-(void)SS_Top_V_Delegate_QX;//取消按钮

-(void)SS_Top_V_Delegate_SS:(NSString*)str;//搜索按钮

@end

@interface SS_Top_V : MyUIView

@property (weak, nonatomic) IBOutlet UIButton *btn_QX;//取消按钮

@property (weak, nonatomic) IBOutlet UITextField *txtF;//输入框

@property (weak, nonatomic) IBOutlet UIView *View_BJ;//滑动背景

@property (nonatomic, assign )id<SS_Top_V_Delegate>         delegate;

@end
