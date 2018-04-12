//
//  ShangPin_XiaDan_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//  商品下单cell

#import "BaseTableViewCell.h"
#import "ShangPin_Model_GroupUserInfo.h"
#import "PTZFCG_Model_Group.h"//拼团下单model

@interface ShangPin_XiaDan_Cell : BaseTableViewCell

@property (nonatomic,strong)ShangPin_Model_GroupUserInfo    *model;

@property (nonatomic,strong) PTZFCG_Model_Group         *model_PT;

@end
