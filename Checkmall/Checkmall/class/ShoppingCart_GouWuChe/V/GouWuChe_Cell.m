
//
//  GouWuChe_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "GouWuChe_Cell.h"

@interface GouWuChe_Cell(){
    UIButton    *btn_XZ;//选中按钮
    UIView      *view_FGX;//分割线
    UIImageView *imageV_TP;//商品图片
    UILabel     *lbl_Name;//商品名称
    UILabel     *lbl_SJ;//到达时间
    
    UILabel     *lbl_JG;//价格
    UILabel     *lbl_SL;//数量
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
    imageV_TP.backgroundColor = [UIColor redColor];
    [self addSubview:imageV_TP];
    
    lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 10, ScreenWidth - imageV_TP.right - 30, 20)];
    lbl_Name.font = font14;
    lbl_Name.textColor = UIColorFromHex(0x333333);
    lbl_Name.text = @"火龙果火龙果火龙果火龙果火龙果火龙果";
    [self addSubview:lbl_Name];
    
    lbl_SJ = [[UILabel alloc]initWithFrame:CGRectMake(lbl_Name.left , lbl_Name.bottom, lbl_Name.width  , 15)];
    lbl_SJ.font = font12;
    lbl_SJ.textColor = UIColorFromHex(0x999999);
    lbl_SJ.text = @"10月10日到达";
    [self addSubview:lbl_SJ];
    
    btn_Jia = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 24 - 15, 110 - 24 - 15, 24, 24)];
    [btn_Jia setBackgroundImage:[UIImage imageNamed:@"Jia"] forState:UIControlStateNormal];
    [self addSubview:btn_Jia];
    
    lbl_SL = [[UILabel alloc]initWithFrame:CGRectMake(btn_Jia.left - 33, btn_Jia.top, 33, btn_Jia.height)];
    lbl_SL.font = [UIFont systemFontOfSize:10];
    lbl_SL.textAlignment = 1;
    lbl_SL.text = @"99";
    lbl_SL.textColor = UIColorFromHex(0x333333);
    [self addSubview:lbl_SL];
    
    btn_Jian = [[UIButton alloc]initWithFrame:CGRectMake(lbl_SL.left - btn_Jia.width, lbl_SL.top, btn_Jia.width, btn_Jia.height)];
    [btn_Jian setBackgroundImage:[UIImage imageNamed:@"Jian"] forState:UIControlStateNormal];
    [self addSubview:btn_Jian];
    
    lbl_JG = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, btn_Jia.top, btn_Jian.left - imageV_TP.right - 15 - 5, btn_Jia.height)];
    lbl_JG.font= [UIFont systemFontOfSize:19];
    lbl_JG.textColor = UIColorFromHex(0xf46c18);
    lbl_JG.text = @"￥99.00￥22.00";
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

-(void)btn_XZ_Action:(UIButton*)btn{
    btn.selected = !btn.selected;
}

+ (CGFloat)get_H:(id)data{
    return 110;
}

@end
