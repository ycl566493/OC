//
//  SongHuoDiZhi_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SongHuoDiZhi_Cell.h"

@implementation SongHuoDiZhi_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//删除
- (IBAction)btn_SC:(id)sender {
    if (self.delegete && [self.delegete respondsToSelector:@selector(SongHuoDiZhi_Cell_Delegate_SC:)]) {
        [self.delegete SongHuoDiZhi_Cell_Delegate_SC:self.tag];
    }
}

//编辑
- (IBAction)btn_BJ:(id)sender {
    if (self.delegete && [self.delegete respondsToSelector:@selector(SongHuoDiZhi_Cell_Delegate_BJ:)]) {
        [self.delegete SongHuoDiZhi_Cell_Delegate_BJ:self.tag];
    }
}

//默认
- (IBAction)btn_MR:(id)sender {
    if (self.delegete && [self.delegete respondsToSelector:@selector(SongHuoDiZhi_Cell_Delegate_MR:)]) {
        [self.delegete SongHuoDiZhi_Cell_Delegate_MR:self.tag];
    }
}


-(void)setModel:(DiZhiLieBiao_Model_Data *)model{
    _model = model;
    //详细地址
    self.lbl_DZ.text = [NSString stringWithFormat:@"%@ %@",model.addressto,model.address];
    self.lbl_DZ.height = [MyHelper getSpaceLabelHeight:self.lbl_DZ.text withFont:font13 withWidth:ScreenWidth - 75- 15 Spacing:5];
    [MyHelper setLabelSpace:self.lbl_DZ withValue:self.lbl_DZ.text withFont:self.lbl_DZ.font Spacing:5];
    
    self.lbl_Name.text = [NSString stringWithFormat:@"%@，%@",model.username,model.phone];
    
    if (model.isfirst) {
        self.btn_MZ.selected = YES;
    }else{
        self.btn_MZ.selected = NO;
    }
    
}

+ (CGFloat)get_H:(NSString*)str{
    CGFloat ffff= [MyHelper getSpaceLabelHeight:str withFont:font13 withWidth:ScreenWidth - 75- 15 Spacing:5];
    return 90 + ffff;
}


@end
