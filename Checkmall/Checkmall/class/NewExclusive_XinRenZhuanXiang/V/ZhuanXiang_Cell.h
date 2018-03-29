//
//  ZhuanXiang_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/7.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品分类

#import "BaseTableViewCell.h"
#import "FenLeiLieBiao_Model_Data.h"

@interface ZhuanXiang_Cell : BaseTableViewCell

@property (nonatomic,strong)FenLeiLieBiao_Model_Data    *model;

- (void)iF_Select:(BOOL)select;//判断选中

@end
