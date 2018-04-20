
//
//  GouWuChe_DiBu_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "GouWuChe_DiBu_V.h"

@interface GouWuChe_DiBu_V(){
    UIButton    *btn_GM;//购买按钮
    UILabel     *lbl_HJ;//合计
    UILabel     *lbl_YH;//优惠
    UIButton    *btn_QX;//全选
}
@end

@implementation GouWuChe_DiBu_V

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

-(void)init_UI{
    UIView  *view_FGX= [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth , .5)];
    view_FGX.backgroundColor = UIColorFromHex(0xf2f2f2);
    [self addSubview:view_FGX];

    self.backgroundColor = [UIColor whiteColor];
    
    btn_GM = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 100,  0, 100, 54)];
    [btn_GM setTitle:@"结算(0)" forState:UIControlStateNormal];
    btn_GM.titleLabel.font = font15;
    btn_GM.backgroundColor = RGBA(253, 98, 6, 1);
    [btn_GM addTarget:self action:@selector(btn_GM_Action) forControlEvents:UIControlEventTouchUpInside];
    [btn_GM setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:btn_GM];
    
    btn_QX = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 54)];
    [btn_QX setImage:[UIImage imageNamed:@"WeiXuanZhong"] forState:UIControlStateNormal];
    [btn_QX setImage:[UIImage imageNamed:@"XuanZhong"] forState:UIControlStateSelected];
    [btn_QX setTitle:@"  全选" forState:UIControlStateNormal];
    [btn_QX setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn_QX.titleLabel.font = font13;
    [btn_QX addTarget:self action:@selector(btn_QX_Action:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_QX];
    
    
    lbl_HJ = [[UILabel alloc]initWithFrame:CGRectMake(btn_QX.right + 10, 10, btn_GM.left- btn_QX.right - 10 * 2, 17)];
    lbl_HJ.font = font12;
    lbl_HJ.textAlignment = 2;
    lbl_HJ.textColor = [UIColor blackColor];
    lbl_HJ.text = @"合计：￥0.00";
    [self addSubview:lbl_HJ];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_HJ.text];
    NSRange range = NSMakeRange(3, 5);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:RGBA(253, 98, 6, 1) range:range];
    // 设置字体大小
//    range = NSMakeRange(4, 6);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range];
    lbl_HJ.attributedText = attributedStr;
    
    //优惠
    lbl_YH = [[UILabel alloc]initWithFrame:CGRectMake(lbl_HJ.left , lbl_HJ.bottom, lbl_HJ.width, 13)];
    lbl_YH.font = [UIFont systemFontOfSize:10];
    lbl_YH.textAlignment = 2;
    lbl_YH.textColor = RGBA(83, 83, 83, 1);
    lbl_YH.text = @"已优惠：￥0.00";
    [self addSubview:lbl_YH];
    
}

-(void)set_JG:(CGFloat)jg YH:(CGFloat)yh SL:(NSInteger)sl{
    lbl_HJ.text = [NSString stringWithFormat:@"合计：￥%.2f",jg];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_HJ.text];
    NSRange range = NSMakeRange(3, lbl_HJ.text.length - 3);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:RGBA(253, 98, 6, 1) range:range];
    // 设置字体大小
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range];
    lbl_HJ.attributedText = attributedStr;
    
    lbl_YH.text = [NSString stringWithFormat:@"已优惠：￥%.2f",yh];
    [btn_GM setTitle:[NSString stringWithFormat:@"结算(%li)",sl] forState:UIControlStateNormal];

}
- (void)set_Btn_Selected:(BOOL)selected{
    btn_QX.selected = selected;
}

-(void)btn_GM_Action{
    if (self.delegate && [self.delegate respondsToSelector:@selector(GouWuChe_DiBu_V_Delegate_Action)]) {
        [self.delegate GouWuChe_DiBu_V_Delegate_Action];
    }
}

-(void)btn_QX_Action:(UIButton*)btn{
    btn.selected = !btn.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(GouWuChe_DiBu_V_Delegate_QX:)]) {
        [self.delegate GouWuChe_DiBu_V_Delegate_QX:btn.selected];
    }
}


+ (CGFloat)get_H:(id)data{
    return 54;
}

@end
