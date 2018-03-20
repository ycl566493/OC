//
//  DiZhiXinXi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DiZhiXinXi_V.h"

@implementation DiZhiXinXi_V


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        [super awakeFromNib];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
//        [self addSubview:self.view];
    }
    return self;
}

- (void)creatView{
//
//    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
//    [self addSubview:self.view];
    }

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.view.frame = self.bounds;
}

- (IBAction)DZ_Action:(UITapGestureRecognizer *)sender {
    NSLog(@"地址点击");
}

//配送方式
-(void)setBool_FS:(BOOL)bool_FS{
    _bool_FS = bool_FS;
    self.lbl_ZTD.hidden = bool_FS;
}

//赋值详细地址
-(void)setStr_DZ:(NSString *)str_DZ{
    _str_DZ = str_DZ;
    self.lbl_DZXX.text = str_DZ;
    [MyHelper setLabelSpace:self.lbl_DZXX withValue:self.lbl_DZXX.text withFont:self.lbl_DZXX.font Spacing:3];
}

//是否是首次进入
-(void)setBool_SC:(BOOL)bool_SC{
    _bool_SC = bool_SC;
    if (bool_SC) {
        self.lbl_Name.hidden = YES;
        self.lbl_ZTD.hidden = YES;
        self.lbl_DZXX.hidden = YES;
        self.height = 80;
        self.lbl_MR.hidden = NO;
    }else{
        self.lbl_Name.hidden = 0;
        self.lbl_ZTD.hidden = 0;
        self.lbl_DZXX.hidden = 0;
        self.lbl_MR.hidden = 1;
    }   
}

+(CGFloat)FS:(BOOL)fs str_NR:(NSString*)str_nr{
    CGFloat ffff= 60;
    if (!fs) {
        ffff += 25;
    }
    ffff += [MyHelper getSpaceLabelHeight:str_nr withFont:[UIFont systemFontOfSize:13] withWidth:ScreenWidth - 47 - 50 Spacing:3] > 18*2?18*2:[MyHelper getSpaceLabelHeight:str_nr withFont:[UIFont systemFontOfSize:13] withWidth:ScreenWidth - 47 - 50 Spacing:3];
    return ffff;
}



@end
