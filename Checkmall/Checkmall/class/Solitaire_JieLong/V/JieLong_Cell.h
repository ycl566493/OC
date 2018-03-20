//
//  JieLong_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JieLong_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btn_JL;//接龙

@property (weak, nonatomic) IBOutlet UILabel *lbl_SJ;//时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_NR;//内容

@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;//标题

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TP;//图片



//返回高度
+(CGFloat)get_H;

@end
