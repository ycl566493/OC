//
//  ShangPinLieBiao_JL_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//  接龙的商品列表

#import "MyUIView.h"

@interface ShangPinLieBiao_JL_V : MyUIView

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableV_H;

@property (nonatomic, assign) NSInteger      index_Row;

@end
