//
//  ShangPinJiaJian_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品数量

#import "MyUIView.h"

@protocol ShangPinJiaJian_V_Delegate <NSObject>

@optional
-(void)ShangPinJiaJian_V_Delegate_SL:(NSString*)SL;

@end

@interface ShangPinJiaJian_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_SL;//购买数量

@property (weak, nonatomic) IBOutlet UIButton *btn_Jian;//减

@property (weak, nonatomic) IBOutlet UIButton *btn_Jia;//加

-(void)set_str_SL:(NSString *)str;//商品数量

@property (nonatomic,assign) id<ShangPinJiaJian_V_Delegate>     delegate;

+(CGFloat)get_H;

@end
