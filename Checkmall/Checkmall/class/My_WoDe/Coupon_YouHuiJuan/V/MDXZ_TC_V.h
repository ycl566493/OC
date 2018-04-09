//
//  MDXZ_TC_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/9.
//  Copyright © 2018年 CKJY. All rights reserved.
//  门店选中弹窗

#import "MyUIView.h"

@protocol MDXZ_TC_V_Delegate <NSObject>

@optional//回掉 姓名 手机号
- (void)MDXZ_TC_V_Delegate_XM:(NSString*)str_XM DH:(NSString*)str_DH;

@end

@interface MDXZ_TC_V : MyUIView


@property (weak, nonatomic) IBOutlet UILabel *lbl_MD;//门店

@property (weak, nonatomic) IBOutlet UILabel *lbl_MDDZ;//门店地址

@property (weak, nonatomic) IBOutlet UITextField *txt_XM;//姓名

@property (weak, nonatomic) IBOutlet UITextField *txt_SJ;//手机号

@property (nonatomic,assign)id<MDXZ_TC_V_Delegate>      delegate;

@end
