//
//  DiQuMenDian_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DiQuMenDian_Cell.h"

@implementation DiQuMenDian_Cell

-(void)setModel:(MenDian_Model_Data *)model{
    _model = model;
    self.lbl_Name.text = model.name;
    self.lbl_NR.text = model.address;
    
    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.imageV.clipsToBounds = YES;
    [self.imageV sd_setImageWithURL:[MyHelper imaeg_URL:model.url view:self.imageV] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
}

+(CGFloat)get_H{
    return 85;
}

@end
