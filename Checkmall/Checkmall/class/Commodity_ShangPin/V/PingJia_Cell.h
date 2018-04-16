//
//  PingJia_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLLB_Model_Data.h"//
#import "ShangPin_Model_Com_Info.h"//详情model


@interface PingJia_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV_PF;//评分

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageV_PF_W;//评分宽度

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TX;//头像

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//姓名

@property (weak, nonatomic) IBOutlet UILabel *lbl_SJ;//时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_NR;//内容
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_NR_W;//内容高度

@property (weak, nonatomic) IBOutlet UIView *view_TP;//图片
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view_TP_H;//图片高度

@property (nonatomic, strong) PLLB_Model_Data   *model;

@property (nonatomic, strong) ShangPin_Model_Com_Info   *model_XQ;

+ (instancetype)init_Xib;

+ (CGFloat)get_H:(NSString*)str_NR row:(NSInteger)row;


@end
