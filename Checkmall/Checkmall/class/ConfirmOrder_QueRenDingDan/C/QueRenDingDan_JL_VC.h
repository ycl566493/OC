//
//  QueRenDingDan_JL_VC.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "BaseViewController.h"

@interface QueRenDingDan_JL_VC : BaseViewController

@property (weak, nonatomic) IBOutlet UIButton *btn_DR;//确认提交

@property (weak, nonatomic) IBOutlet UILabel *lbl_JE;//订单金额

@property (weak, nonatomic) IBOutlet UILabel *lbl_YF;//运费

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_JE_H;//高度问题

@end
