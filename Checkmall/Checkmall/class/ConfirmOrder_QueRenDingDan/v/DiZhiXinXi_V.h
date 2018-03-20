//
//  DiZhiXinXi_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  确认订单 地址

#import <UIKit/UIKit.h>

@interface DiZhiXinXi_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//姓名

@property (weak, nonatomic) IBOutlet UILabel *lbl_ZTD;//自提点

@property (weak, nonatomic) IBOutlet UILabel *lbl_DZXX;//地址信息

@property (weak, nonatomic) IBOutlet UILabel *lbl_MR;//没有地址的时候默认文字


@property (strong, nonatomic) IBOutlet DiZhiXinXi_V *view;

@property (nonatomic, assign) BOOL bool_FS;//快递方式

@property (nonatomic, strong)NSString *str_DZ;//地址信息

@property (nonatomic, assign) BOOL bool_SC;//首次没有地址的清空

+(CGFloat)FS:(BOOL)fs str_NR:(NSString*)str_nr;//获取高度


@end
