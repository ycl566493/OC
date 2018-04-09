//
//  DiQuMenDian_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//  优惠间门店列表

#import <UIKit/UIKit.h>
#import "MenDian_Model_Data.h"

@interface DiQuMenDian_Cell : UITableViewCell

@property (nonatomic,strong)    MenDian_Model_Data  *model;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;//图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//标题

@property (weak, nonatomic) IBOutlet UILabel *lbl_NR;//内容



+(CGFloat)get_H;

@end
