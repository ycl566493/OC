//
//  FenLei_ShangPin_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "FenLei_ShangPin_Cell.h"

#define self_W ScreenWidth - 90

@interface FenLei_ShangPin_Cell(){
    UIView      *view_FGX;//分割线
    UIImageView *imageV_TP;//商品图片
    UILabel     *lbl_Name;//商品名称
    UILabel     *lbl_SJ;//到达时间
    
    UILabel     *lbl_JG;//价格
    UIButton    *btn_GWC;//购物车
}
@end

@implementation FenLei_ShangPin_Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    imageV_TP = [[UIImageView alloc]initWithFrame:CGRectMake(15, (97 - 60) / 2, 60, 60)];
    [self addSubview:imageV_TP];
    
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 97, self_W - imageV_TP.right - 15, .5)];
    view_FGX.backgroundColor = RGBA(234, 234, 234, 1);
    [self addSubview:view_FGX];
    
    lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 10, self_W - imageV_TP.right - 30, 20)];
    lbl_Name.font = font14;
    lbl_Name.textColor = UIColorFromHex(0x333333);
    lbl_Name.text = @"";
    [self addSubview:lbl_Name];
    
    lbl_SJ = [[UILabel alloc]initWithFrame:CGRectMake(lbl_Name.left , lbl_Name.bottom, lbl_Name.width  , 15)];
    lbl_SJ.font = [UIFont systemFontOfSize:11];
    lbl_SJ.textColor = UIColorFromHex(0x999999);
//    lbl_SJ.text = @"10月10日到达";
    [self addSubview:lbl_SJ];
    
    btn_GWC = [[UIButton alloc]initWithFrame:CGRectMake(self_W - 30 - 15, 97 - 30 - 10, 30, 30)];
    [btn_GWC setImage:[UIImage imageNamed:@"GouWuCheHong"] forState:UIControlStateNormal];
    [btn_GWC addTarget:self action:@selector(btn_GWC_Action:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_GWC];
    
    lbl_JG = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 97 - 20 - 10, btn_GWC.left - imageV_TP.right - 15 - 5, 20)];
    lbl_JG.font= [UIFont systemFontOfSize:15];
    lbl_JG.textColor = UIColorFromHex(0xf46c18);
    lbl_JG.text = @"￥00.00￥00.00";
    [self addSubview:lbl_JG];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(6, 6);
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

-(void)btn_GWC_Action:(UIButton*)btn{
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    CGRect rect=[btn convertRect: btn.bounds toView:window];
    [MyHelper addToShoppingCartWithGoodsImage:btn.imageView.image startPoint:CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2) endPoint:CGPointMake([[kUserDefaults objectForKey:GWC_X] floatValue], [[kUserDefaults objectForKey:GWC_Y] floatValue]) completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GouWuCheShuLiang" object:nil];
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(FenLei_ShangPin_Cell_Delegate_GWC:)]) {
        [self.delegate FenLei_ShangPin_Cell_Delegate_GWC:self.tag];
    }
}


-(void)setModel:(FenLeiShangPin_Model_Data *)model{
    _model = model;
    [imageV_TP sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_%.0f",model.image,imageV_TP.width*2]] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    lbl_Name.text = model.name;
//    lbl_SJ.text = model.name;
    
    lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",model.groupPrice,model.marketPrice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(model.groupPrice.length+1, model.marketPrice.length +1);
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

+ (CGFloat)get_H:(id)data{
    return 97.5;
}

@end
