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
-(void)DiZhiLieBiao_VC_Delegate_DZ:(DiZhiLieBiao_Model_Data*)model;//确定回调


@end

@interface DiZhiLieBiao_VC : BaseTableViewController

@property (nonatomic,assign)id<DiZhiLieBiao_VC_Delegate>    delegate;

@end
