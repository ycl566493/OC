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
    
//    self.imageV_TP.image = [MyHelper Image_Hui:[UIImage imageNamed:@"JiDan"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setModel:(YouHuiJuan_Model_Data *)model{
    _model = model;
    self.lbl_Name.text = model.name;
    self.lbl_YXQ.text = model.endtime;
    
//    __weak YouHuiJuanCell *weak_Self = self;
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.path view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        if (weak_Self.model.) {
//            <#statements#>
//        }
//        weak_Self.imageV_TP.
    }];
}

-(void)setZT:(NSInteger)tag{
    if (tag == 1) {
       [self.btn_DH setEnabled:YES];
        self.lbl_Name.textColor = UIColorFromHex(0xff7800);
        self.imageV_BJ.image = [UIImage imageNamed:@"WeiDuiHuan"];
    }
    if (tag == 2) {
        [self.btn_DH setEnabled:NO];
        self.lbl_Name.textColor = UIColorFromHex(0xd9d9d9);
//        self.imageV_TP.image = [MyHelper Image_Hui:self.imageV_TP.image];
        self.imageV_BJ.image = [UIImage imageNamed:@"YiDuiHuan"];
        
    }
    if (tag == 3) {

        [self.btn_DH setEnabled:NO];
        self.lbl_Name.textColor = UIColorFromHex(0xd9d9d9);
//        self.imageV_TP.image = [MyHelper Image_Hui:self.imageV_TP.image];
        self.imageV_BJ.image = [UIImage imageNamed:@"YiGuoQi"];

    }
}

#pragma mark- 兑换
- (IBAction)btn_Action:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(YouHuiJuanCell_Delegate_LJDH:)]) {
        [self.delegate YouHuiJuanCell_Delegate_LJDH:self.tag];
    }
}

+(CGFloat)get_H{
    return 99;
}

@end
