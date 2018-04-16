//
//  ShangPin_XinXi_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品信息

#import "MyUIView.h"
#import "ShangPin_Model_RootClass.h"
#import "JLXQ_Model_RootClass.h"//接龙model

@interface ShangPin_XinXi_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;//商品名称

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_Title_H;//商品名称高度

@property (weak, nonatomic) IBOutlet UIButton *btn_FX;//分享按钮

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//商品价格

@property (weak, nonatomic) IBOutlet UILabel *lbl_DP;//单品剩余数量

@property (weak, nonatomic) IBOutlet UILabel *lbl_TG;//团购剩余数量

@property (weak, nonatomic) IBOutlet UILabel *lbl_PS;//配送方式

@property (weak, nonatomic) IBOutlet UILabel *lbl_SJ;//到货时间







@property (nonatomic,copy)NSString  *str_Title;

@property (nonatomic,strong)ShangPin_Model_RootClass    *model;
@property (nonatomic,strong)JLXQ_Model_RootClass    *model_JL;



@end
