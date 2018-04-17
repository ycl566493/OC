//
//  SheZhi_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SheZhi_Cell.h"

@implementation SheZhi_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageV_W.constant = self.imageVT.height;
    
}

-(void)SetTitle:(NSString *)title NR:(NSString *)NR ImageV:(BOOL)imagev{
    self.lbl_Title.text = title;
    self.lbl_NR.text = NR;
    
    self.imageV_W.constant = 20;

    if (imagev) {
        self.imageVT.hidden = imagev;
        self.imageV_W.constant = 0;

    }else{
        self.imageVT.hidden = imagev;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];



}
+ (CGFloat)get_H{
    return 45;
}

@end
