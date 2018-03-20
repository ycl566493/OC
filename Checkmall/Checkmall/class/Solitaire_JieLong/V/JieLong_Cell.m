//
//  JieLong_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JieLong_Cell.h"

@implementation JieLong_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self init_UI];

}

-(void)init_UI{
    self.btn_JL.layer.masksToBounds = YES;
    self.btn_JL.layer.cornerRadius = 3;
    self.btn_JL.layer.borderWidth = .5;
    self.btn_JL.layer.borderColor = self.btn_JL.titleLabel.textColor.CGColor;
    
    self.lbl_SJ.text = @"  2018-19-19 19:00到货  ";
    
    
}

#pragma mark- 参团按钮
- (IBAction)btn_CT:(id)sender {
    NSLog(@"参团");
}

#pragma mark- 视频播放
- (IBAction)btn_SP:(id)sender {
    NSLog(@"视频播放");
}


+(CGFloat)get_H{
    return 110 + 5 ;
}


@end
