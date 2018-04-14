//
//  SPSP_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SPSP_Cell.h"

@implementation SPSP_Cell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.lbl_Title.text = @"第一节 哈哈哈哈哈哈哈哈哈哈哈哈";
    [self.btn_CZ setTitle:@"付款" forState:UIControlStateNormal];
    [self.btn_CZ setTitleColor:UIColorFromHex(0xff7800) forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark- 操作
- (IBAction)btn_CZ:(id)sender {
    
    
}


+ (CGFloat)get_H{
    return 45;
}


@end
