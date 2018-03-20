//
//  GouWuChe_DiBu_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@protocol GouWuChe_DiBu_V_Delegate <NSObject>

@optional
-(void)GouWuChe_DiBu_V_Delegate_Action;//结算

@end

@interface GouWuChe_DiBu_V : MyUIView

@property (nonatomic,assign)id<GouWuChe_DiBu_V_Delegate>    delegate;

@end
