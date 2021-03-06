//
//  YouHuiJuanCell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//  优惠间信息

#import <UIKit/UIKit.h>
#import "YouHuiJuan_Model_Data.h"

@protocol YouHuiJuanCell_Delegate <NSObject>

@optional
- (void)YouHuiJuanCell_Delegate_LJDH:(NSInteger)tag;//立即兑换

@end

@interface YouHuiJuanCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIButton *btn_DH;//兑换

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//标题

@property (weak, nonatomic) IBOutlet UILabel *lbl_YXQ;//有效期

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TP;//图片

@property (weak, nonatomic) IBOutlet UIImageView *imageV_BJ;//图片背景


@property (nonatomic,strong) YouHuiJuan_Model_Data   *model;

@property (nonatomic,assign)id<YouHuiJuanCell_Delegate>     delegate;

- (void)setZT:(NSInteger)tag;//1未使用 2、已使用 3 已过期

+(CGFloat)get_H;

@end
