//
//  ShouYe_Cell.h
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//  首页商品cell

#import "BaseCollectionViewCell.h"
#import "ShouYe_Model_Data.h"//model

@protocol ShouYe_Cell_Delegate_GWC <NSObject>

@optional
-(void)ShouYe_Cell_Delegate_GWC:(NSInteger)tag;//购物车

@end

@interface ShouYe_Cell : BaseCollectionViewCell

@property (nonatomic,assign)id<ShouYe_Cell_Delegate_GWC>    delegate;

@property (nonatomic,strong)ShouYe_Model_Data   *ShouYe_Model;

@end
