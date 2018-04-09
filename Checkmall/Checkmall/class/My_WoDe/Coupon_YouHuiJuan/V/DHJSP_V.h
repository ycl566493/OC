//
//  DHJSP_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//  兑换卷商品信息

#import "MyUIView.h"

@interface DHJSP_V : MyUIView

@property (weak, nonatomic) IBOutlet UIImageView *imageV;//图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//姓名

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//价格

@property (weak, nonatomic) IBOutlet UILabel *lbl_RQ;//日期

@property (weak, nonatomic) IBOutlet UIButton *btn_FX;//分享按钮

@property (weak, nonatomic) IBOutlet UIView *view_FGX;//分割线




@end
