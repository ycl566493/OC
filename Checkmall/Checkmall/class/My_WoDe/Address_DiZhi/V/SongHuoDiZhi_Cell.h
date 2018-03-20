//
//  SongHuoDiZhi_Cell.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongHuoDiZhi_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbl_Name;//姓名

@property (weak, nonatomic) IBOutlet UILabel *lbl_DZ;//地址信息

@property (weak, nonatomic) IBOutlet UIButton *btn_XZ;//选中

@property (weak, nonatomic) IBOutlet UIButton *btn_MZ;//默认

@property (weak, nonatomic) IBOutlet UIButton *btn_BJ;//编辑按钮

@property (weak, nonatomic) IBOutlet UIButton *btn_SC;//删除


-(void)set_title:(NSString*)str_Title;


+(CGFloat)get_H:(NSString*)str;

@end
