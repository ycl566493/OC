//
//  TC_JL_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//  弹出接龙

#import <UIKit/UIKit.h>
#import "JLLPSP_Model_Data.h"//接龙列表

@protocol TC_JL_Cell_Delegate <NSObject>

@optional
- (void)TC_JL_Cell_Delegate_SLUP;//数量后刷新

@end

@interface TC_JL_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image_V;//图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//标题

@property (weak, nonatomic) IBOutlet UILabel *lbl_DQ;//当前状态
@property (weak, nonatomic) IBOutlet UIImageView *image_DQ;//图片
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_DQ_W;//lbl_W

@property (weak, nonatomic) IBOutlet UILabel *lbl_MB;//下一状态
@property (weak, nonatomic) IBOutlet UIImageView *image_MB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_MB_W;

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//价格

@property (weak, nonatomic) IBOutlet UILabel *lbl_SY;//剩余数量

@property (weak, nonatomic) IBOutlet UITextField *txt_SL;//购买数量

@property (weak, nonatomic) IBOutlet UILabel *lbl_YJL;//已接龙



@property (nonatomic, assign) id<TC_JL_Cell_Delegate>   delegate;

@property (nonatomic, strong)JLLPSP_Model_Data  *model;

+(CGFloat)get_H;

@end
