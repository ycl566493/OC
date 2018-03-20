//
//  YouHuiJuanCell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YouHuiJuanCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIButton *btn_DH;//兑换

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//标题

@property (weak, nonatomic) IBOutlet UILabel *lbl_YXQ;//有效期

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TP;//图片



+(CGFloat)get_H;

@end
