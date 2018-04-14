//
//  ShangPin_JL_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_JL_Cell.h"

@implementation ShangPin_JL_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)self_Action:(id)sender {
    NSLog(@"点击点击");
}


+ (instancetype)init_Xib {
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

- (void)setModel:(QueRenDingDan_Model_Arr *)Model{
    _Model = Model;
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:Model.url view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    self.lbl_Name.text = Model.goodsName;
    self.lbl_DDSJ.text = [NSString stringWithFormat:@"%@到达",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",(long)Model.arrival_time]]];
    self.lbl_SPSL.text = [NSString stringWithFormat:@"x%@",Model.number];
    self.lbl_JTSJ.text = [NSString stringWithFormat:@"截团时间：%@",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",(long)Model.endTime]]];
    
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@",Model.price];
}

+(CGFloat)get_H{
    return 106;
}

@end
