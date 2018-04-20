//
//  PeiSongFangShi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "PeiSongFangShi_V.h"

@implementation PeiSongFangShi_V

-(void)setBool_PS:(BOOL)bool_PS{
    _bool_PS = bool_PS;
    if (bool_PS == NO) {
        self.lbl_PSFS.text = @"用户自提";
    }else{
        self.lbl_PSFS.text = @"送货上门";
    }
}

+(CGFloat)get_H:(id)data{
    return 53 - 5;
}

@end
