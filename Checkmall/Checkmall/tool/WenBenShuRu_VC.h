//
//  WenBenShuRu_VC.h
//  同文同书
//
//  Created by 信码互通 on 2017/7/21.
//  Copyright © 2017年 XC. All rights reserved.
//  用来编辑文本信息

#import "BaseViewController.h"

@protocol WenBenShuRu_VC_delegate <NSObject>

@optional
-(void)WenBenShuRu_VC_delegate_XX:(NSString*)xx tag:(NSInteger)tag; //文本编辑回调 tag 区分界面

@end

@interface WenBenShuRu_VC : BaseViewController

@property(nonatomic,assign)id<WenBenShuRu_VC_delegate>      delegate;

@property (nonatomic,copy)NSString                  *str_title;//标题

@property (nonatomic,copy)NSString                  *str_NR;//内容

@end
