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



-(void)set_title:(NSString *)str_Title{
    self.lbl_DZ.text = str_Title;
    self.lbl_DZ.height = [MyHelper getSpaceLabelHeight:str_Title withFont:font13 withWidth:ScreenWidth - 75- 15 Spacing:5];
    [MyHelper setLabelSpace:self.lbl_DZ withValue:self.lbl_DZ.text withFont:self.lbl_DZ.font Spacing:5];
}

+ (CGFloat)get_H:(NSString*)str{
    CGFloat ffff= [MyHelper getSpaceLabelHeight:str withFont:font13 withWidth:ScreenWidth - 75- 15 Spacing:5];
    return 90 + ffff;
}


@end
