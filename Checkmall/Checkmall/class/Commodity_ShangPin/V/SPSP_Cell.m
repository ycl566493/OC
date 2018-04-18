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


}

-(void)setModel:(ShiPinLieBiao_Model_Data *)model{
    _model=  model;
    self.lbl_Title.text = model.name;


}


#pragma mark- 操作
- (IBAction)btn_CZ:(id)sender {
    
    
}


+ (CGFloat)get_H{
    return 45;
}


@end
