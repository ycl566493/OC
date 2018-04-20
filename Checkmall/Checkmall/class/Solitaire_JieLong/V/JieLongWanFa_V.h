//
//  JieLongWanFa_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"
#import "JLXQ_Model_RootClass.h"//接龙详情

@interface JieLongWanFa_V : MyUIView


@property (weak, nonatomic) IBOutlet UIScrollView *scrV;


@property (nonatomic , strong) JLXQ_Model_RootClass *model;

@end
