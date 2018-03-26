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

-(void)setModel:(DingDanLieBiao_Model_Data *)model{
    _model = model;
    self.lbl_BH.text = [NSString stringWithFormat:@"订单编号%@",model.orderSn];
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.url view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    self.lbl_Name.text = model.goodsName;
    self.lbl_DH.text = [NSString stringWithFormat:@"%ld到货",(long)model.arrivalTime];
    self.lbl_SL.text = [NSString stringWithFormat:@"%li",model.number];
    self.lbl_XD.text = [NSString stringWithFormat:@"%@",model.created];

    //    order_status   订单状态 1 待付款 2 代发货 3待收货 4 已退款 5 交易成功 6 已取消',
    if ([model.orderStatus integerValue] == 1) {
        self.lbl_ZT.text = @"待付款";
    }else if ([model.orderStatus integerValue] == 2) {
        self.lbl_ZT.text = @"代发货";
    }else if ([model.orderStatus integerValue] == 3) {
        self.lbl_ZT.text = @"待收货";
    }else if ([model.orderStatus integerValue] == 4) {
        self.lbl_ZT.text = @"已退款";
    }else if ([model.orderStatus integerValue] == 5) {
        self.lbl_ZT.text = @"交易成功";
    }else if ([model.orderStatus integerValue] == 6) {
        self.lbl_ZT.text = @"已取消";
    }
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)get_H{
    return 218;
}

@end
