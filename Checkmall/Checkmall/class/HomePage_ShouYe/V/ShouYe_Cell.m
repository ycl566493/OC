//
//  ShouYe_Cell.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_Cell.h"

@interface ShouYe_Cell(){
    UIImageView *imageV_DT;//商品大图
    UILabel     *lbl_Title;//商品名
    UILabel     *lbl_NR;//内容
    UILabel     *lbl_JG;//价格
    UIButton    *btn_GWC;//购物车
    
}
@end

@implementation ShouYe_Cell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

- (void)init_UI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    imageV_DT = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.width)];
    imageV_DT.contentMode = UIViewContentModeScaleAspectFill;
    imageV_DT.clipsToBounds = YES;
    [self addSubview:imageV_DT];
    
    lbl_Title = [[UILabel alloc]initWithFrame:CGRectMake(10, imageV_DT.bottom +10 , self.width- 10*2, 20)];
    lbl_Title.font = font14;
    lbl_Title.textColor = UIColorFromHex(0x333333);
    lbl_Title.text = @"";
    [self addSubview:lbl_Title];
    
    lbl_NR = [[UILabel alloc]initWithFrame:CGRectMake(lbl_Title.left, lbl_Title.bottom , lbl_Title.width, 15)];
    lbl_NR.font = font12;
    lbl_NR.textColor = UIColorFromHex(0x666666);
    lbl_NR.text = @"";
    [self addSubview:lbl_NR];
    
    btn_GWC = [[UIButton alloc]initWithFrame:CGRectMake(self.width - 30 - 10, self.height - 30 - 10, 30, 30)];
    [btn_GWC setImage:[UIImage imageNamed:@"GouWuCheHong"] forState:UIControlStateNormal];
    [btn_GWC addTarget:self action:@selector(btn_GWC_Action:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_GWC];
    
    lbl_JG = [[UILabel alloc]initWithFrame:CGRectMake(10, btn_GWC.top + 10, btn_GWC.left - 10 -10, 20)];
    lbl_JG.font = font17;
    lbl_JG.textColor = UIColorFromHex(0xff7800);
    lbl_JG.text = @"￥99.0￥188.0";
    
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(5, 6);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    lbl_JG.attributedText = attributedStr;

    
    [self addSubview:lbl_JG];
    
}

-(void)setShouYe_Model:(ShouYe_Model_Data *)ShouYe_Model{
    _ShouYe_Model = ShouYe_Model;
    lbl_Title.text = ShouYe_Model.productName;
    [imageV_DT sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_%.0f",ShouYe_Model.productImage,imageV_DT.width]] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    lbl_NR.text = ShouYe_Model.productDesc;
    
    lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",ShouYe_Model.productPrice,ShouYe_Model.productMarketPrice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(ShouYe_Model.productPrice.length+1, ShouYe_Model.productMarketPrice.length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    lbl_JG.attributedText = attributedStr;
    
}

-(void)setModel_FL:(FenLeiShangPin_Model_Data *)model_FL{
    _model_FL = model_FL;
    lbl_Title.text = model_FL.name;
    [imageV_DT sd_setImageWithURL:[MyHelper imaeg_URL:model_FL.image view:imageV_DT] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",model_FL.groupPrice,model_FL.marketPrice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(model_FL.groupPrice.length+1, model_FL.marketPrice.length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:range];
    lbl_JG.attributedText = attributedStr;
    
}

+(CGFloat)get_H:(id)data{
    return 80 + (ScreenWidth - 3) /2;
}   

-(void)btn_GWC_Action:(UIButton*)btn{
    if (self.is_DH) {
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[btn convertRect: btn.bounds toView:window];
        [MyHelper addToShoppingCartWithGoodsImage:btn.imageView.image startPoint:CGPointMake(rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2) endPoint:CGPointMake([[kUserDefaults objectForKey:GWC_X] floatValue], [[kUserDefaults objectForKey:GWC_Y] floatValue]) completion:^(BOOL finished) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GouWuCheShuLiang" object:nil];
        }];
    }

    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShouYe_Cell_Delegate_GWC:)]) {
        [self.delegate ShouYe_Cell_Delegate_GWC:self.tag];
    }

}



@end
