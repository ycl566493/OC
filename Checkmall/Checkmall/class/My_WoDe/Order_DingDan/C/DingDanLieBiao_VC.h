//
//  DingDanLieBiao_VC.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "BaseViewController.h"

@interface DingDanLieBiao_VC : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableV;//列表
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableV_H;//列表高度

@property (nonatomic, assign) NSInteger          int_Tag;//0全部 1代付款 2代发货 3待收货

@end
