//
//  DingDan_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//  我的订单详情

#import <UIKit/UIKit.h>
#import "DingDanLieBiao_Model_Data.h"//model

@protocol DingDan_Cell_Delegate <NSObject>

@optional
- (void)DingDan_Cell_Delegate_Action1:(NSInteger)tag;//操作按钮1
- (void)DingDan_Cell_Delegate_Action2:(NSInteger)tag;//操作按钮2


@end

@interface DingDan_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV_TP;//商品图片

@property (weak, nonatomic) IBOutlet UILabel *lbl_ZT;//订单状态

@property (weak, nonatomic) IBOutlet UILabel *lbl_BH;//商品编号

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//商品名称

@property (weak, nonatomic) IBOutlet UILabel *lbl_DH;//到货时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_JG;//价格

@property (weak, nonatomic) IBOutlet UILabel *lbl_SL;//商品数量

@property (weak, nonatomic) IBOutlet UILabel *lbl_XD;//下单时间

@property (weak, nonatomic) IBOutlet UILabel *lbl_SFK;//实付款

@property (weak, nonatomic) IBOutlet UIButton *btn_CZ;//操作按钮1

@property (weak, nonatomic) IBOutlet UIButton *btn_QX;//操作按钮2

@property (nonatomic,strong)DingDanLieBiao_Model_Data   *model;

@property (nonatomic,assign)id<DingDan_Cell_Delegate>   delegate;


+(CGFloat)get_H:(BOOL)Y_N;



@end
