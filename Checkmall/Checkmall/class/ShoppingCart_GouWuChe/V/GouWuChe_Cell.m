
//
//  GouWuChe_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "GouWuChe_Cell.h"

@interface GouWuChe_Cell()<UITextFieldDelegate>{
    UIButton    *btn_XZ;//选中按钮
    UIView      *view_FGX;//分割线
    UIImageView *imageV_TP;//商品图片
    UILabel     *lbl_Name;//商品名称
    UILabel     *lbl_SJ;//到达时间
    
    UILabel     *lbl_JG;//价格
    UITextField     *txt_SL;//数量
    UIButton    *btn_Jia;//加
    UIButton    *btn_Jian;//减
    
    
}
@end

@implementation GouWuChe_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    btn_XZ = [[UIButton alloc]initWithFrame:CGRectMake(0, (110 - 45)  / 2, 45, 45)];
    [btn_XZ setImage:[UIImage imageNamed:@"WeiXuanZhong"] forState:UIControlStateNormal];
    [btn_XZ setImage:[UIImage imageNamed:@"XuanZhong"] forState:UIControlStateSelected];
    [btn_XZ addTarget:self action:@selector(btn_XZ_Action:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_XZ];
    
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 109.5, ScreenWidth, .5)];
    view_FGX.backgroundColor = RGBA(219, 215, 215, 1);
    [self addSubview:view_FGX];
    
    imageV_TP = [[UIImageView alloc]initWithFrame:CGRectMake(btn_XZ.right + 5, (110 - 85) / 2, 85, 85)];
    imageV_TP.contentMode = UIViewContentModeScaleAspectFill;
    imageV_TP.clipsToBounds = YES;
    [self addSubview:imageV_TP];
    
    lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 10, ScreenWidth - imageV_TP.right - 30, 20)];
    lbl_Name.font = font14;
    lbl_Name.textColor = UIColorFromHex(0x333333);
    lbl_Name.text = @"";
    [self addSubview:lbl_Name];
    
    lbl_SJ = [[UILabel alloc]initWithFrame:CGRectMake(lbl_Name.left , lbl_Name.bottom, lbl_Name.width  , 15)];
    lbl_SJ.font = font12;
    lbl_SJ.textColor = UIColorFromHex(0x999999);
    lbl_SJ.text = @"10月10日到达";
    [self addSubview:lbl_SJ];
    
    btn_Jia = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 24 - 15, 110 - 24 - 15, 24, 24)];
    [btn_Jia setBackgroundImage:[UIImage imageNamed:@"Jia"] forState:UIControlStateNormal];
    [btn_Jia addTarget:self action:@selector(btn_Jia_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_Jia];
    
    txt_SL = [[UITextField alloc]initWithFrame:CGRectMake(btn_Jia.left - 33, btn_Jia.top, 33, btn_Jia.height)];
    txt_SL.font = [UIFont systemFontOfSize:10];
    txt_SL.textAlignment = 1;
    txt_SL.text = @"99";
    txt_SL.delegate = self;
    txt_SL.keyboardType = UIKeyboardTypeNumberPad;
    txt_SL.textColor = UIColorFromHex(0x333333);
    [self addSubview:txt_SL];
    
    btn_Jian = [[UIButton alloc]initWithFrame:CGRectMake(txt_SL.left - btn_Jia.width, txt_SL.top, btn_Jia.width, btn_Jia.height)];
    [btn_Jian setBackgroundImage:[UIImage imageNamed:@"Jian"] forState:UIControlStateNormal];
    [btn_Jian addTarget:self action:@selector(btn_Jian_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_Jian];
    
    lbl_JG = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, btn_Jia.top, btn_Jian.left - imageV_TP.right - 15 - 5, btn_Jia.height)];
    lbl_JG.font= [UIFont systemFontOfSize:19];
    lbl_JG.textColor = UIColorFromHex(0xf46c18);
    lbl_JG.text = @"";
    [self addSubview:lbl_JG];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(0, 0);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
//    range = NSMakeRange(4, 6);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    
    lbl_JG.attributedText = attributedStr;
    
    

}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    //返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出第一响应者
    if ([txt_SL.text integerValue] == 0) {
        [MyHelper showMessage:@"商品数量不可为0件"];
        return NO;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(GouWuChe_Cell_Delegate_SR: str_Num:)]) {
        [self.delegate GouWuChe_Cell_Delegate_SR:self.tag str_Num:txt_SL.text];
    }
    return YES;
}

-(void)setModel:(GouWuChe_Model_Data *)model{
    _model = model;
    [imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.image view:imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    lbl_Name.text = model.title;
    lbl_SJ.text = [NSString stringWithFormat:@"%@到达",model.arrivalTime];

    lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",model.price,model.mprice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(model.price.length+1, model.mprice.length+1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    
    lbl_JG.attributedText = attributedStr;
    
    txt_SL.text = [NSString stringWithFormat:@"%li",model.num];

    btn_XZ.selected = model.is_XZ;

}

#pragma mark- 加
- (void)btn_Jia_Action{
    self.model.num ++;
    if (self.delegate && [self.delegate respondsToSelector:@selector(GouWuChe_Cell_Delegate_Jia:)]) {
        [self.delegate GouWuChe_Cell_Delegate_Jia:self.tag];
    }
    [self if_Btn];
}

#pragma mark- 减
- (void)btn_Jian_Action{
    self.model.num --;
    if (self.delegate && [self.delegate respondsToSelector:@selector(GouWuChe_Cell_Delegate_Jian:)]) {
        [self.delegate GouWuChe_Cell_Delegate_Jian:self.tag];
    }
    
    [self if_Btn];
}

#pragma mark- 判断减号或者数量是否显示
- (void)if_Btn{
    if (self.model.num > 1 ) {
        btn_Jian.hidden = NO;
        txt_SL.hidden = NO;
    }else{
        btn_Jian.hidden = YES;
//        lbl_SL.hidden = YES;
        
    }
    txt_SL.text = [NSString stringWithFormat:@"%li",self.model.num];

}

-(void)btn_XZ_Action:(UIButton*)btn{
    btn.selected = !btn.selected;
    self.model.is_XZ = btn.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(GouWuChe_Cell_Delegate_XZ:)]) {
        [self.delegate GouWuChe_Cell_Delegate_XZ:self.tag];
    }
}

+ (CGFloat)get_H:(id)data{
    return 110;
}

@end
