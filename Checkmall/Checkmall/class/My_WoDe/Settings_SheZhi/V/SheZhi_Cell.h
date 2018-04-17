//
//  SheZhi_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheZhi_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;//标题

@property (weak, nonatomic) IBOutlet UILabel *lbl_NR;//内容

@property (weak, nonatomic) IBOutlet UIImageView *imageVT;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageV_W;//图片宽

- (void)SetTitle:(NSString*)title NR:(NSString *)NR ImageV:(BOOL)imagev;


+ (CGFloat)get_H;

@end
