//
//  TC_DHJ_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//  弹出兑换券

#import "MyUIView.h"

@protocol TC_DHJ_V_Delegate <NSObject>

@optional
-(void)TC_DHJ_V_Delegate_Action;//立即兑换

@end

@interface TC_DHJ_V : MyUIView


@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//标题

@property (weak, nonatomic) IBOutlet UIButton *btn_GB;//关闭按钮


@property (weak, nonatomic) IBOutlet UILabel *lbl_LBMC;//礼品名称

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TP;//商品图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_SJ;//礼品时间

@property (nonatomic,assign)id<TC_DHJ_V_Delegate>   delegate;









@end
