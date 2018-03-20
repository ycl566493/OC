//
//  MyUIView.h
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//  基类view

#import <UIKit/UIKit.h>

@interface MyUIView : UIView

+(CGFloat)get_H:(id)data;//获取高度 //数据

-(void)init_UI;

+(instancetype)init_Xib;

@end
