//
//  JL_SPXX_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//  接龙商品信息

#import "MyUIView.h"
#import "JLCG_Model_RootClass.h"

@interface JL_SPXX_V : MyUIView

@property (weak, nonatomic) IBOutlet UIImageView *imaegV_TP;//商品图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//商品名称

@property (weak, nonatomic) IBOutlet UILabel *lbl_SJ;//时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_MS;//价格

@property (nonatomic,strong)JLCG_Model_RootClass    *model;

@end
