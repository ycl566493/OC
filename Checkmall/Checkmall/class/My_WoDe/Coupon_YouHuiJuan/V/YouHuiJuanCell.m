//
//  YouHuiJuanCell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "YouHuiJuanCell.h"

@implementation YouHuiJuanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    
    self.imageV_TP.image = [MyHelper Image_Hui:[UIImage imageNamed:@"JiDan"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];



}

#pragma mark- 兑换
- (IBAction)btn_Action:(UIButton *)sender {
}

+(CGFloat)get_H{
    return 99;
}

@end
