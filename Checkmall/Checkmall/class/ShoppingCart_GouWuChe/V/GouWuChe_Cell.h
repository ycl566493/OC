//
//  GouWuChe_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//  购物车cell

#import "BaseTableViewCell.h"
#import "GouWuChe_Model_Data.h"

@protocol GouWuChe_Cell_Delegate <NSObject>

@optional
- (void)GouWuChe_Cell_Delegate_Jia:(NSInteger)tag;//加
- (void)GouWuChe_Cell_Delegate_Jian:(NSInteger)tag;//减
- (void)GouWuChe_Cell_Delegate_SR:(NSInteger)tag str_Num:(NSString*)num;//输入
- (void)GouWuChe_Cell_Delegate_XZ:(NSInteger)tag;//选中

@end

@interface GouWuChe_Cell : BaseTableViewCell

@property (nonatomic,strong)GouWuChe_Model_Data *model;

@property (nonatomic,assign)id <GouWuChe_Cell_Delegate> delegate;

@end
