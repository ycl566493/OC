//
//  ShangPin_JL_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueRenDingDan_Model_Arr.h"

@interface ShangPin_JL_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TP;//商品图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//商品名称

@property (weak, nonatomic) IBOutlet UILabel *lbl_DDSJ;//到达时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//价格

@property (weak, nonatomic) IBOutlet UILabel *lbl_JTSJ;//截团时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_SPSL;//商品数量


@property (nonatomic, strong)QueRenDingDan_Model_Arr            *Model;//接龙model

+(CGFloat)get_H;

+ (instancetype)init_Xib;//调用方式

@end
