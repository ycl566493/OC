//
//  SPSP_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品视频

#import <UIKit/UIKit.h>
#import "ShiPinLieBiao_Model_Data.h"

@interface SPSP_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;

@property (weak, nonatomic) IBOutlet UIButton *btn_CZ;//操作按钮

@property (nonatomic, strong) ShiPinLieBiao_Model_Data  *model;


+(CGFloat)get_H;
@end
