//
//  KBY_View.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/26.
//  Copyright © 2018年 CKJY. All rights reserved.
//  空白页

#import "MyUIView.h"

@protocol KBY_View_Delegate <NSObject>

@optional
-(void)KBY_View_Delegate_Action;

@end

@interface KBY_View : MyUIView


@property (weak, nonatomic) IBOutlet UIImageView *image_V;


@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;


@property (weak, nonatomic) IBOutlet UIButton *btn_AN;


@property (nonatomic,assign)id<KBY_View_Delegate>   delegate;

@end
