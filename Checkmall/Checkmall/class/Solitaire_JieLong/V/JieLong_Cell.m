//
//  JieLong_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JieLong_Cell.h"

@implementation JieLong_Cell

-(void)layoutSubviews{
    [super layoutSubviews];
    [self init_UI];

}

-(void)init_UI{
    self.btn_JL.layer.masksToBounds = YES;
    self.btn_JL.layer.cornerRadius = 3;
    self.btn_JL.layer.borderWidth = .5;
    self.btn_JL.layer.borderColor = self.btn_JL.titleLabel.textColor.CGColor;
    
    
    
}

-(void)setModel:(JLLB_Model_Data *)model{
    _model = model;
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.imgpath view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    self.lbl_Title.text = model.title;
    self.lbl_NR.text = model.desc;
    NSString *str_SJ = [NSString stringWithFormat:@" %@到货 ",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model.endtime]]];
    self.lbl_SJ.text = str_SJ;
    self.lbl_TJ.text = [NSString stringWithFormat:@"满%li件接龙成功",model.sendnumber];

}

#pragma mark- 参团按钮
- (IBAction)btn_CT:(id)sender {
    NSLog(@"参团");
}


+(CGFloat)get_H{
    return 110 + 5 ;
}


@end
