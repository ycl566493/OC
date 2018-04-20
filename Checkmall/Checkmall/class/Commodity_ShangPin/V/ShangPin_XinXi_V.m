//
//  ShangPin_XinXi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_XinXi_V.h"

@interface ShangPin_XinXi_V(){

}
@end

@implementation ShangPin_XinXi_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

#pragma mark- 初始化
-(void)init_UI{
 
    
//    [self if_Btn];
}

-(void)setModel:(ShangPin_Model_RootClass *)model{
    _model =  model;
    
    self.lbl_Title.text = model.data.productName;
    self.lbl_Title.numberOfLines = 0;
    
    self.lbl_Title_H.constant = [MyHelper strHeight:self.lbl_Title.text andFont:self.lbl_Title.font andWidth:self.lbl_Title.width];
    self.lbl_Title.height = self.lbl_Title_H.constant;
//    [MyHelper getSpaceLabelHeight:self.lbl_Title.text withFont:self.lbl_Title.font withWidth:self.lbl_Title.width Spacing:4];
//    [MyHelper setLabelSpace:self.lbl_Title withValue:self.lbl_Title.text withFont:self.lbl_Title.font Spacing:4];
    
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@ ￥%@",model.data.productSprice,model.data.productMarketPrice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     self.lbl_JG.text];
    NSRange range = NSMakeRange(model.data.productSprice.length + 2, model.data.productMarketPrice.length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    //    range = NSMakeRange(4, 6);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range];
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    self.lbl_JG.attributedText = attributedStr;
    
    self.lbl_DP.text = [NSString stringWithFormat:@"%li",model.data.stock];
    self.lbl_TG.text = [NSString stringWithFormat:@"%li",model.data.amount];
    self.lbl_PS.text = [model.data.taketype integerValue] == 0 ? @"门店自提" : @"门店自提 + 物流配送";
    self.lbl_SJ.text = [NSString stringWithFormat:@"%@到", model.data.productArrivalTime];
}


-(void)setModel_JL:(JLXQ_Model_RootClass *)model_JL{
    _model_JL = model_JL;
    self.lbl_Title.text = model_JL.data.name;
    self.lbl_Title.numberOfLines = 0;
    self.lbl_Title_H.constant = [MyHelper strHeight:self.lbl_Title.text andFont:self.lbl_Title.font andWidth:self.lbl_Title.width];
    
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@ ￥%@",model_JL.data.price,model_JL.data.mprice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     self.lbl_JG.text];
    NSRange range = NSMakeRange(model_JL.data.price.length + 2, model_JL.data.mprice.length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    //    range = NSMakeRange(4, 6);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range];
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    self.lbl_JG.attributedText = attributedStr;
    
    self.lbl_DP.text = [NSString stringWithFormat:@"%li",model_JL.data.stock];
    self.lbl_DPTS.text = @"接龙剩余";
    self.lbl_TGTS.hidden = YES;
    self.lbl_TG.hidden = YES;
    self.lbl_PS.text = model_JL.data.taketype  == 0 ? @"门店自提" : @"门店自提 + 物流配送";
    self.lbl_SJ.text = [NSString stringWithFormat:@"%@到", [MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model_JL.data.arrivaltime]]];
}

#pragma mark- 分享
- (IBAction)btn_FX:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ShangPin_XinXi_V_Delegate_FX)]) {
        [self.delegate ShangPin_XinXi_V_Delegate_FX];
    }
}


+ (CGFloat)get_H:(id)data{
    CGFloat fff = 15 + 15 + 25 + 10 + 20 + 10 + 45;
    NSString *str_T = data;
    
    return fff + [MyHelper strHeight:str_T andFont:[UIFont systemFontOfSize:16] andWidth:ScreenWidth - 50 - 30];
}

@end
