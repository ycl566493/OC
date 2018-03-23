//
//  TC_TJDZ_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//  添加地址

#import "MyUIView.h"
#import "DiZhiLieBiao_Model_Data.h"//地址model

@protocol TC_TJDZ_V_Delegate <NSObject>

@optional
-(void)TC_TJDZ_V_Delegate_CG;//添加成功

@end

@interface TC_TJDZ_V : MyUIView

@property (weak, nonatomic) IBOutlet UITextField *txtF_XM;//姓名

@property (weak, nonatomic) IBOutlet UITextField *txtF_SJH;//手机号

@property (weak, nonatomic) IBOutlet UIButton *btn_BC;//保存

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view_H;//试图高


@property (weak, nonatomic) IBOutlet UILabel *lbl_DZ;//地区

@property (weak, nonatomic) IBOutlet UILabel *lbl_MD;//门店

@property (weak, nonatomic) IBOutlet UILabel *lbl_MDDZ;//门店地址

@property (nonatomic,assign)id<TC_TJDZ_V_Delegate>          delegate;


@property (nonatomic,strong)DiZhiLieBiao_Model_Data         *model;

@end
