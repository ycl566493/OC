//
//  DiZhi_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiZhiLieBiao_Model_Data.h"

@protocol DiZhi_Cell_Delegate <NSObject>

@optional
- (void)DiZhi_Cell_Delegate_BJ:(NSInteger)tag;//编辑
- (void)DiZhi_Cell_Delegate_SC:(NSInteger)tag;//删除
- (void)DiZhi_Cell_Delegate_MR:(NSInteger)tag;//默认

@end

@interface DiZhi_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//姓名

@property (weak, nonatomic) IBOutlet UILabel *lbl_FW;//服务网点

@property (weak, nonatomic) IBOutlet UILabel *lbl_DZ;//地址信息

@property (weak, nonatomic) IBOutlet UIButton *btn_MZ;//默认

@property (weak, nonatomic) IBOutlet UIButton *btn_BJ;//编辑按钮

@property (weak, nonatomic) IBOutlet UIButton *btn_SC;//删除

@property (nonatomic,assign) id<DiZhi_Cell_Delegate>    delegete;

@property (nonatomic, strong)DiZhiLieBiao_Model_Data    *model;

+(CGFloat)get_H:(NSString*)str;

@end
