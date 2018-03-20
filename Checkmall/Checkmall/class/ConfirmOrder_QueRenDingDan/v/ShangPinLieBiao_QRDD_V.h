//
//  ShangPinLieBiao_QRDD_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@interface ShangPinLieBiao_QRDD_V : MyUIView

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableV_H;

@property (nonatomic, assign) NSInteger      index_Row;

@end

