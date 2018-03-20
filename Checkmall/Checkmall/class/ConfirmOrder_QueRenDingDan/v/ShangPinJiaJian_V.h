//
//  ShangPinJiaJian_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品数量

#import "MyUIView.h"

@interface ShangPinJiaJian_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_SL;//购买数量

@property (weak, nonatomic) IBOutlet UIButton *btn_Jia;//加

@property (weak, nonatomic) IBOutlet UIButton *btn_Jian;//减

+(CGFloat)get_H;

@end
