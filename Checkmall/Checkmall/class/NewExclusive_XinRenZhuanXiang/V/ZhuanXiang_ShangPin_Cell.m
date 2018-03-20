//
//  ZhuanXiang_ShangPin_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/7.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhuanXiang_ShangPin_Cell.h"

#define self_W ScreenWidth - 90

@interface ZhuanXiang_ShangPin_Cell(){
    UIView      *view_FGX;//分割线
    UIImageView *imageV_TP;//商品图片
    UILabel     *lbl_Name;//商品名称
    UILabel     *lbl_SJ;//到达时间
    
    UILabel     *lbl_JG;//价格
    UILabel     *lbl_JZ;//截止时间
    UILabel     *lbl_SL;//数量
    UIButton    *btn_Jia;//加
    UIButton    *btn_Jian;//减
    
    NSInteger   integet_SL;//数量
    
}
@end

@implementation ZhuanXiang_ShangPin_Cell



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
    imageV_TP.backgroundColor = [UIColor redColor];
    [self addSubview:imageV_TP];
    
    view_FGX = [[UIView alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 97, self_W - imageV_TP.right - 15, .5)];
    view_FGX.backgroundColor = RGBA(234, 234, 234, 1);
    [self addSubview:view_FGX];
    
    lbl_Name = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, 10, self_W - imageV_TP.right - 30, 20)];
    lbl_Name.font = font14;
    lbl_Name.textColor = UIColorFromHex(0x333333);
    lbl_Name.text = @"火龙果火龙果火龙果火龙果火火龙果";
    [self addSubview:lbl_Name];
    
    lbl_SJ = [[UILabel alloc]initWithFrame:CGRectMake(lbl_Name.left , lbl_Name.bottom, lbl_Name.width  , 15)];
    lbl_SJ.font = [UIFont systemFontOfSize:11];
    lbl_SJ.textColor = UIColorFromHex(0x999999);
    lbl_SJ.text = @"10月10日到达";
    [self addSubview:lbl_SJ];

    
    btn_Jia = [[UIButton alloc]initWithFrame:CGRectMake(self_W - 24 - 15, lbl_SJ.bottom , 24, 24)];
    [btn_Jia setBackgroundImage:[UIImage imageNamed:@"Jia"] forState:UIControlStateNormal];
    [btn_Jia addTarget:self action:@selector(btn_Jia_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_Jia];
    
    lbl_SL = [[UILabel alloc]initWithFrame:CGRectMake(btn_Jia.left - 33, btn_Jia.top, 33, btn_Jia.height)];
    lbl_SL.font = [UIFont systemFontOfSize:10];
    lbl_SL.textAlignment = 1;
    lbl_SL.text = @"99";
    lbl_SL.textColor = UIColorFromHex(0x333333);
    [self addSubview:lbl_SL];
    
    btn_Jian = [[UIButton alloc]initWithFrame:CGRectMake(lbl_SL.left - btn_Jia.width, lbl_SL.top, btn_Jia.width, btn_Jia.height)];
    [btn_Jian setBackgroundImage:[UIImage imageNamed:@"Jian"] forState:UIControlStateNormal];
    [btn_Jian addTarget:self action:@selector(btn_Jian_Action) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_Jian];
    
    lbl_JG = [[UILabel alloc]initWithFrame:CGRectMake(imageV_TP.right + 15, lbl_SJ.bottom + 10, btn_Jian.left - imageV_TP.right - 15 - 5, 20)];
    lbl_JG.font= [UIFont systemFontOfSize:15];
    lbl_JG.textColor = UIColorFromHex(0xf46c18);
    lbl_JG.text = @"￥99.00";
    [self addSubview:lbl_JG];
    
    lbl_JZ  = [[UILabel alloc]initWithFrame:CGRectMake(lbl_JG.left, lbl_JG.bottom , self_W - imageV_TP.right - 15 * 2, 15)];
    lbl_JZ.font = [UIFont systemFontOfSize:11];
    lbl_JZ.textColor = UIColorFromHex(0x666666);
    lbl_JZ.text = @"截团时间：2018.02.23 12:00";
    [self addSubview:lbl_JZ];

    [self if_Btn];
}

#pragma mark- 加
- (void)btn_Jia_Action{
  
    integet_SL ++;
    
    [self if_Btn];
}

#pragma mark- 减
- (void)btn_Jian_Action{
    if (integet_SL>0) {
        integet_SL --;
    }
    [self if_Btn];
}

#pragma mark- 判断减号或者数量是否显示
- (void)if_Btn{
    if (integet_SL > 0 ) {
        btn_Jian.hidden = NO;
        lbl_SL.hidden = NO;
        lbl_SL.text = [NSString stringWithFormat:@"%li",integet_SL];
    }else{
        btn_Jian.hidden = YES;
        lbl_SL.hidden = YES;
    }
}

+ (CGFloat)get_H:(id)data{
    return 97.5;
}


@end
