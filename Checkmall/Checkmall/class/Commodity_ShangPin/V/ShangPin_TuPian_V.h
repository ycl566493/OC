//
//  ShangPin_TuPian_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/10.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品图片

#import "MyUIView.h"
#import "ShangPin_Model_RootClass.h"
#import "JLXQ_Model_RootClass.h"//接龙详情

@protocol ShangPin_TuPian_V_Delegate <NSObject>

@optional
- (void)ShangPin_TuPian_V_Delegate_PF;//播放

@end

@interface ShangPin_TuPian_V : MyUIView

@property (nonatomic,assign)BOOL        bool_SP;//是否包含视频

@property (nonatomic,strong) ShangPin_Model_RootClass    *model;

@property (nonatomic,strong) JLXQ_Model_RootClass       *model_JL;

@property (nonatomic,assign)id<ShangPin_TuPian_V_Delegate>  delegate;

@end
