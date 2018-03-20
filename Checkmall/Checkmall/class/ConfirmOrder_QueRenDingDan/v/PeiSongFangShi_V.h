//
//  PeiSongFangShi_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//  配送方式

#import "MyUIView.h"

@interface PeiSongFangShi_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_PSFS;//配送方式

@property (nonatomic,assign)BOOL        bool_PS;//配送方式 0 用户自提 1 送货上门

@end
