//
//  ShangPin_XinXi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_XinXi_V.h"

@interface ShangPin_XinXi_V(){
    UILabel         *lbl_JG;//价格
    UILabel         *lbl_TGSL;//团购数量
    UIButton        *btn_FX;//分享按钮
    UILabel         *lbL_Title;//标题
    UILabel         *lbl_RQ;//日期
    
//    UILabel         *lbl_SL;//数量
//    UIButton        *btn_Jia;//加
//    UIButton        *btn_Jian;//减
    
    NSInteger     integet_SL;//数量
    UIView          *view_FGX;//分割线
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
    
    ///价格
    lbl_JG = [[UILabel alloc]initWithFrame:CGRectMake(15, 10 ,200, 30)];
    lbl_JG.font= [UIFont systemFontOfSize:20];
    lbl_JG.textColor = UIColorFromHex(0xf46c18);
    lbl_JG.text = @"￥0.00￥0.00";
    [self addSubview:lbl_JG];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(0, 0);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    //    range = NSMakeRange(4, 6);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range];
    
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    lbl_JG.attributedText = attributedStr;
    
    //团购数量
    lbl_TGSL = [[UILabel alloc]initWithFrame:CGRectMake(15, lbl_JG.bottom, 200, 20)];
    lbl_TGSL.font = font12;
    lbl_TGSL.textColor = UIColorFromHex(0xacacac);
    lbl_TGSL.text = @"已团0份";
    [self addSubview:lbl_TGSL];
    
    //分享按钮
    btn_FX = [[UIButton alloc]initWithFrame:CGRectMake(self.width - 50, 10, 50, 50)];
    [btn_FX setImage:[UIImage imageNamed:@"FenXiang"] forState:UIControlStateNormal];
    [self addSubview:btn_FX];
    
    lbL_Title = [[UILabel alloc]initWithFrame:CGRectMake(15, btn_FX.bottom + 10, ScreenWidth - 30, 40)];
    lbL_Title.font = [UIFont systemFontOfSize:16];
    lbL_Title.text = @"";
    lbL_Title.height = [MyHelper getSpaceLabelHeight:lbL_Title.text withFont:lbL_Title.font withWidth:lbL_Title.width Spacing:4];
    [MyHelper setLabelSpace:lbL_Title withValue:lbL_Title.text withFont:lbL_Title.font Spacing:4];
    lbL_Title.numberOfLines = 0;
    [self addSubview:lbL_Title];
    
    //加减数量
//    btn_Jia = [[UIButton alloc]initWithFrame:CGRectMake(self.width - 24 - 15, lbL_Title.bottom , 24, 24)];
//    [btn_Jia setBackgroundImage:[UIImage imageNamed:@"Jia"] forState:UIControlStateNormal];
//    [btn_Jia addTarget:self action:@selector(btn_Jia_Action) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btn_Jia];
//
//    lbl_SL = [[UILabel alloc]initWithFrame:CGRectMake(btn_Jia.left - 33, btn_Jia.top, 33, btn_Jia.height)];
//    lbl_SL.font = [UIFont systemFontOfSize:10];
//    lbl_SL.textAlignment = 1;
//    lbl_SL.text = @"99";
//    lbl_SL.textColor = UIColorFromHex(0x333333);
//    [self addSubview:lbl_SL];
//
//    btn_Jian = [[UIButton alloc]initWithFrame:CGRectMake(lbl_SL.left - btn_Jia.width, lbl_SL.top, btn_Jia.width, btn_Jia.height)];
//    [btn_Jian setBackgroundImage:[UIImage imageNamed:@"Jian"] forState:UIControlStateNormal];
//    [btn_Jian addTarget:self action:@selector(btn_Jian_Action) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:btn_Jian];
    
    //到达时间
    lbl_RQ = [[UILabel alloc]initWithFrame:CGRectMake(15, lbL_Title.bottom, ScreenWidth - 30, 24)];
    lbl_RQ.font = font13;
    lbl_RQ.textColor = UIColorFromHex(0x8c8c8c);
    [self addSubview:lbl_RQ];
    
    
    //分割线
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, 10, self.width, .5)];
    view_FGX.backgroundColor = UIColorFromHex(0xececec);
    [self addSubview:view_FGX];
    
//    [self if_Btn];
}

-(void)setModel:(ShangPin_Model_RootClass *)model{
    _model =  model;
    lbl_JG.text = [NSString stringWithFormat:@"￥%@￥%@",model.data.productSprice,model.data.productMarketPrice];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JG.text];
    NSRange range = NSMakeRange(model.data.productSprice.length + 1, model.data.productMarketPrice.length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0x999999) range:range];
    // 设置字体大小
    //    range = NSMakeRange(4, 6);
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range];
    //删除线
    [attributedStr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:range];
    [attributedStr addAttribute:NSStrikethroughColorAttributeName value:UIColorFromHex(0x999999) range:range];
    lbl_JG.attributedText = attributedStr;
    
    lbl_TGSL.text = [NSString stringWithFormat:@"已团%li份",model.data.groupSum];

    
    lbL_Title.text = model.data.productName;
    lbL_Title.height = [MyHelper getSpaceLabelHeight:lbL_Title.text withFont:lbL_Title.font withWidth:lbL_Title.width Spacing:4];
    [MyHelper setLabelSpace:lbL_Title withValue:lbL_Title.text withFont:lbL_Title.font Spacing:4];
    
    //到达时间
    lbl_RQ.top = lbL_Title.bottom + 10;
    //分割线
    view_FGX.top = lbl_RQ.bottom + 7;
    
    lbl_RQ.text = [NSString stringWithFormat:@"%@到", model.data.productArrivalTime];
}

//#pragma mark- 加
//- (void)btn_Jia_Action{
//
//    integet_SL ++;
//
//    [self if_Btn];
//}
//
//#pragma mark- 减
//- (void)btn_Jian_Action{
//    if (integet_SL>0) {
//        integet_SL --;
//    }
//    [self if_Btn];
//}

#pragma mark- 判断减号或者数量是否显示
//- (void)if_Btn{
//    if (integet_SL > 0 ) {
//        btn_Jian.hidden = NO;
//        lbl_SL.hidden = NO;
//        lbl_SL.text = [NSString stringWithFormat:@"%li",integet_SL];
//    }else{
//        btn_Jian.hidden = YES;
//        lbl_SL.hidden = YES;
//    }
//}


+ (CGFloat)get_H:(id)data{
    CGFloat fff = 30 + 20 +10 +24 + 7 + .5 +20;
    NSString *str_T = data;
    
    return fff + [MyHelper getSpaceLabelHeight:str_T withFont:[UIFont systemFontOfSize:16] withWidth:ScreenWidth - 30 Spacing:4];
}

@end
