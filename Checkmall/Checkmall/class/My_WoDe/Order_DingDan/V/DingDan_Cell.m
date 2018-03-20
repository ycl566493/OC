//
//  DingDan_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DingDan_Cell.h"

@implementation DingDan_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.btn_CZ.layer.masksToBounds = YES;
    self.btn_CZ.layer.cornerRadius = 5;
    self.btn_CZ.backgroundColor  = UIColorFromHex(0xff7800);
    [self.btn_CZ setTitle:@"立即付款" forState:UIControlStateNormal];
    [self.btn_CZ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.btn_QX.layer.masksToBounds = YES;
    self.btn_QX.layer.cornerRadius = 5;
    self.btn_QX.layer.borderWidth = .5;
    self.btn_QX.layer.borderColor= UIColorFromHex(0x9d9d9d).CGColor;
    self.btn_QX.backgroundColor  = [UIColor whiteColor];
    [self.btn_QX setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.btn_QX setTitleColor:UIColorFromHex(0x9d9d9d) forState:UIControlStateNormal];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)get_H{
    return 218;
}

@end
