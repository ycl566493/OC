//
//  TC_KDDZ.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//  快递地址

#import "MyUIView.h"

@interface TC_KDDZ : MyUIView

@property (weak, nonatomic) IBOutlet UITextField *txtF_XM;//姓名

@property (weak, nonatomic) IBOutlet UITextField *txtF_SJH;//手机号

@property (weak, nonatomic) IBOutlet UIButton *btn_BC;//保存

@property (weak, nonatomic) IBOutlet UITextField *txtV_DZ;//详细地址
@property (weak, nonatomic) IBOutlet UILabel *lbl_SSQ;//省市区

@end
