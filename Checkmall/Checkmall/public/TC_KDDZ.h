//
//  TC_KDDZ.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//  快递地址

#import "MyUIView.h"
#import "DiZhiLieBiao_Model_Data.h"

@protocol TC_KDDZ_Delegate <NSObject>

@optional
- (void)TC_KDDZ_Delegate_CG;

@end

@interface TC_KDDZ : MyUIView

@property (weak, nonatomic) IBOutlet UITextField *txtF_XM;//姓名

@property (weak, nonatomic) IBOutlet UITextField *txtF_SJH;//手机号

@property (weak, nonatomic) IBOutlet UIButton *btn_BC;//保存

@property (weak, nonatomic) IBOutlet UITextField *txtV_DZ;//详细地址
@property (weak, nonatomic) IBOutlet UILabel *lbl_SSQ;//省市区

@property (nonatomic,assign)id<TC_KDDZ_Delegate>    delegate;

@property (nonatomic,strong)DiZhiLieBiao_Model_Data         *model;


@end
