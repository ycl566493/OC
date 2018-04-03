//
//  FenLei_ShangPin_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  分类商品数据

#import "BaseTableViewCell.h"
#import "FenLeiShangPin_Model_Data.h"

@protocol FenLei_ShangPin_Cell_Delegate <NSObject>

@optional
- (void)FenLei_ShangPin_Cell_Delegate_GWC:(NSInteger)tag;//购物车

@end

@interface FenLei_ShangPin_Cell : BaseTableViewCell

@property (nonatomic,strong)FenLeiShangPin_Model_Data   *model;

@property (nonatomic,assign)id<FenLei_ShangPin_Cell_Delegate>   delegate;

@end
