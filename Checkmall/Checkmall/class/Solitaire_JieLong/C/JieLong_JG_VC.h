//
//  JieLong_JG_VC.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/11.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "BaseViewController.h"

@interface JieLong_JG_VC : BaseViewController

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//价格

@property (nonatomic, strong) NSString  *str_ID;//商品id 


@end
