//
//  ShangPinXinXi_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPinXinXi_Cell.h"

@implementation ShangPinXinXi_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)self_Action:(id)sender {
    NSLog(@"点击点击");
}


+ (instancetype)init_Xib {
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

-(void)setModel:(QueRenDingDan_Model_Arr *)Model{
    _Model = Model;
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:Model.url view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    self.lbl_Name.text = Model.goodsName;
    self.lbl_DDSJ.text = [NSString stringWithFormat:@"%@到达",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",(long)Model.arrival_time]]];
    self.lbl_SPSL.text = [NSString stringWithFormat:@"x%@",Model.number];
    self.lbl_JTSJ.text = [NSString stringWithFormat:@"截团时间：%@",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",(long)Model.endTime]]];
    
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",Model.price,Model.mprice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     self.lbl_JG.text];
    NSRange range = NSMakeRange(Model.price.length+1, Model.mprice.length+1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    
    self.lbl_JG.attributedText = attributedStr;
}

-(void)setModel_PT:(QueRenDingDan_Model_Arr *)Model_PT{
    _Model_PT = Model_PT;
    [self.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:Model_PT.url view:self.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    self.lbl_Name.text = Model_PT.goodsName;
    self.lbl_DDSJ.text = [NSString stringWithFormat:@"%@到达",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",(long)Model_PT.arrival_time]]];
    self.lbl_SPSL.text = [NSString stringWithFormat:@"x%@",Model_PT.number];
    self.lbl_JTSJ.text = [NSString stringWithFormat:@"截团时间：%@",[MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",(long)Model_PT.endTime]]];
    
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",Model_PT.g_price,Model_PT.mprice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     self.lbl_JG.text];
    NSRange range = NSMakeRange(Model_PT.g_price.length+1, Model_PT.mprice.length+1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    
    self.lbl_JG.attributedText = attributedStr;

}

+(CGFloat)get_H{
    return 106;
}

@end
