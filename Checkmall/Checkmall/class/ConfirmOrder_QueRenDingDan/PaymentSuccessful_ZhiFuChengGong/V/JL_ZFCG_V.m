//
//  JL_ZFCG_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JL_ZFCG_V.h"

@implementation JL_ZFCG_V


-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
}

#pragma mark- 初始化
-(void)init_UI{
    for (NSInteger i = 0 ; i<6; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(9 + (9 + 45)*i, 5, 45, 45)];
        imageV.backgroundColor = [UIColor yellowColor];
        imageV.layer.masksToBounds = YES;
        imageV.layer.cornerRadius = imageV.width / 2;
        imageV.layer.borderColor = UIColorFromHex(0xc2c2c2).CGColor;
        imageV.layer.borderWidth = .5;
        [self.View_TX addSubview:imageV];
        self.View_TX_W.constant = imageV.right +9;
        
        //        GengDuoTouXiang.png
        
        if (i == 0) {
            UILabel *lbL_TZ = [[UILabel alloc]initWithFrame:CGRectMake(imageV.left, imageV.top, 25, 12)];
            lbL_TZ.text = @"团长";
            lbL_TZ.textAlignment =1;
            lbL_TZ.font = [UIFont systemFontOfSize:8];
            lbL_TZ.backgroundColor = UIColorFromHex(0xff7800);
            lbL_TZ.textColor = [UIColor whiteColor];
            lbL_TZ.layer.borderWidth = .5;
            lbL_TZ.layer.borderColor = [UIColor whiteColor].CGColor;
            lbL_TZ.layer.masksToBounds = YES;
            lbL_TZ.layer.cornerRadius = lbL_TZ.height / 2;
            [self.View_TX addSubview:lbL_TZ];
        }
        
    }
}

+(CGFloat)get_H:(id)data{

    return 240;
}

@end
