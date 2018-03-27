//
//  DiZhiLieBiao_VC.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//  地址列表

#import "BaseTableViewController.h"
#import "DiZhiLieBiao_Model_Data.h"

@protocol DiZhiLieBiao_VC_Delegate <NSObject>

@optional
//fs快递方式 0 自提 1 快递
-(void)DiZhiLieBiao_VC_Delegate_DZ:(DiZhiLieBiao_Model_Data*)model isFS:(BOOL)fs;//确定回调


@end

@interface DiZhiLieBiao_VC : BaseTableViewController

@property (nonatomic,assign)id<DiZhiLieBiao_VC_Delegate>    delegate;

@property (nonatomic,assign)BOOL                            bool_SH;//是否可以送货 取反 yes不支持

@end
