//
//  JieLongWanFa_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JieLongWanFa_V.h"

@implementation JieLongWanFa_V


-(void)setModel:(JLXQ_Model_RootClass *)model{
    _model = model;
    
    for (UIView *vvvvv in self.scrV.subviews) {
        [vvvvv removeFromSuperview];
    }
    UIView *view_BJ = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    [self.scrV addSubview:view_BJ];
    for (NSInteger i = 0; i < model.data.rule.count; i ++) {
        
        JLXQ_Model_Rule *MMM = model.data.rule[i];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(15+ 90 * i, 0, 80, 80)];
//        view.backgroundColor = [UIColor redColor];
        [view_BJ addSubview:view];
        
        UIImageView *image_Y = [[UIImageView alloc]initWithFrame:CGRectMake(25, 15, 30, 30)];
//        image_Y.backgroundColor = [UIColor yellowColor];
        image_Y.image = [UIImage imageNamed:@"JLXZ"];
        [view addSubview:image_Y];
        
        UILabel *lbl_SL = [[UILabel alloc]initWithFrame:image_Y.bounds];
        lbl_SL.text = [NSString stringWithFormat:@"%li",i+1];
        lbl_SL.textColor = [UIColor whiteColor];
        lbl_SL.textAlignment = 1;
        lbl_SL.font = [UIFont systemFontOfSize:13];
        [image_Y addSubview:lbl_SL];
        
        UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(0, image_Y.bottom + 5, view.width, 30)];
        lbl_title.text = [NSString stringWithFormat:@" 满%li件返￥%@     ",MMM.neednumber,MMM.jianprice];
        lbl_title.numberOfLines = 2;
        lbl_title.textAlignment = 1;
        lbl_title.font = [UIFont systemFontOfSize:10];
        lbl_title.textColor = UIColorFromHex(0x999999);
        [view addSubview:lbl_title];
        
        UIImageView *image_JT = [[UIImageView alloc]initWithFrame:CGRectMake(view.right, 20, 10, 25)];
        image_JT.image = [UIImage imageNamed:@"JLJTXZ"];
        image_JT.contentMode = UIViewContentModeCenter;
        [view_BJ addSubview:image_JT];

        view_BJ.width = image_JT.right + 15;

        if (i+ 1 == model.data.rule.count) {
            [image_JT removeFromSuperview];
            view_BJ.width = view.right + 15;

        }
        
        if (view_BJ.width < self.scrV.width) {
            view_BJ.mj_x = (ScreenWidth - view_BJ.width) / 2;
        }else{
            view_BJ.mj_x = 0;
        }
        
        if (MMM.status == 1) {
            image_Y.image = [UIImage imageNamed:@"JLXZ"];
            image_JT.image = [UIImage imageNamed:@"JLJTXZ"];
            lbl_title.textColor = UIColorFromHex(0xff7800);

        }else{
            image_Y.image = [UIImage imageNamed:@"JLWXZ"];
            image_JT.image = [UIImage imageNamed:@"JLJTWXZ"];
            lbl_title.textColor = UIColorFromHex(0x999999);
        }
        
        self.scrV.contentSize = CGSizeMake(view_BJ.width , 0);
        
    }
}


+(CGFloat)get_H:(id)data{
    return 45+.5 + 80 +16;
}

@end
