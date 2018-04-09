//
//  DiQuMenDian_VC.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//  地区门店

#import "BaseViewController.h"

@protocol DiQuMenDian_VC_Delegate <NSObject>

@optional//回调信息 姓名 手机号 id 门店姓名 门店地址
- (void)DiQuMenDian_VC_Delegate_XM:(NSString *)str_XM SJ:(NSString*)str_SJ str_ID:(NSString*)str_Id MD:(NSString*)MD MDDZ:(NSString*)MDDZ;

@end

@interface DiQuMenDian_VC : BaseViewController


@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (nonatomic,assign)id<DiQuMenDian_VC_Delegate> delegate;

@end
