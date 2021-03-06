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
    [self.btn_CZ addTarget:self action:@selector(btn_CZ_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.btn_CZ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.btn_QX.layer.masksToBounds = YES;
    self.btn_QX.layer.cornerRadius = 5;
    self.btn_QX.layer.borderWidth = .5;
    self.btn_QX.layer.borderColor= UIColorFromHex(0x9d9d9d).CGColor;
    self.btn_QX.backgroundColor  = [UIColor whiteColor];
    [self.btn_QX setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.btn_QX addTarget:self action:@selector(btn_QX_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.btn_QX setTitleColor:UIColorFromHex(0x9d9d9d) forState:UIControlStateNormal];
    

}

#pragma mark- 操作按钮1
-(void)btn_CZ_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(DingDan_Cell_Delegate_Action1:)]) {
        [self.delegate DingDan_Cell_Delegate_Action1:self.tag];
    }
}

#pragma mark- 操作按钮2
-(void)btn_QX_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(DingDan_Cell_Delegate_Action2:)]) {
        [self.delegate DingDan_Cell_Delegate_Action2:self.tag];
    }
}


-(void)setModel:(DingDanLieBiao_Model_Data *)model{
    _model = model;
    self.lbl_BH.text = [NSString stringWithFormat:@"订单编号:%@",model.orderSn];
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.path view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    self.lbl_Name.text = model.goodsName;
    self.lbl_DH.text = [NSString stringWithFormat:@"%@到货",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model.arrivalTime]]];
    self.lbl_SL.text = [NSString stringWithFormat:@"x%li",model.number];
    self.lbl_XD.text = [NSString stringWithFormat:@"%@下单",model.created];
    self.lbl_SFK.text = [NSString stringWithFormat:@"实付款：￥%@",model.paidAmount];
    
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",model.price,model.mprice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     self.lbl_JG.text];
    NSRange range = NSMakeRange(model.price.length+1, model.mprice.length+1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    
    self.lbl_JG.attributedText = attributedStr;
    
    
    self.btn_QX.hidden = YES;
    self.btn_CZ.hidden = YES;
    //    order_status   订单状态 1 待付款 2 代发货 3待收货 4 已退款 5 交易成功 6 已取消',
    if (model.og_status == 1) {
        self.lbl_ZT.text = @"待付款";
        self.btn_QX.hidden = NO;
        self.btn_CZ.hidden = NO;
        [self.btn_CZ setTitle:@"立即付款" forState:UIControlStateNormal];
        [self.btn_QX setTitle:@"取消订单" forState:UIControlStateNormal];
        
    }else if (model.og_status == 2) {
        self.lbl_ZT.text = @"待发货";
    }else if (model.og_status == 3) {
        self.lbl_ZT.text = @"待收货";
        self.btn_CZ.hidden = NO;
        [self.btn_CZ setTitle:@"立即收货" forState:UIControlStateNormal];
    }else if (model.og_status == 4) {
        self.lbl_ZT.text = @"已退款";
    }else if (model.og_status == 5) {
        self.lbl_ZT.text = @"交易成功";
    }else if (model.og_status == 6) {
        self.lbl_ZT.text = @"已取消";
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)get_H:(BOOL)Y_N{
    if (Y_N) {
        return 214- 40 - 5;
    }
    return 214 - 5;
}

@end
