//
//  PingJia_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "PingJia_Cell.h"
#define TW (ScreenWidth - 30 - 21) / 4

@implementation PingJia_Cell

- (void)awakeFromNib {
    [super awakeFromNib];

    

}


-(void)set_W:(NSInteger)row{
    self.imageV_PF.clipsToBounds = YES;
    self.imageV_PF_W.constant = 70 / 5 * 3;
    
    self.lbl_NR.text = @"啊哈哈啊哈哈哈哈哈哈哈";
    self.lbl_NR.height = [MyHelper strHeight:self.lbl_NR.text andFont:[UIFont systemFontOfSize:14] andWidth:ScreenWidth - 30];
    
    if (row %4 == 0) {
        self.view_TP.hidden = YES;
        self.view_TP_H.constant = -10;
    }else{
        self.view_TP.hidden = NO;
        self.view_TP_H.constant = TW;
        
        for (UIView *vvvv in self.view_TP.subviews) {
            [vvvv removeFromSuperview];
        }
        
        for (NSInteger i = 0; i < row % 4; i ++) {
            UIImageView *image_V = [[UIImageView alloc]initWithFrame:CGRectMake((TW + 7) * i, 0, TW, TW)];
            image_V.backgroundColor = [UIColor redColor];
            [self.view_TP addSubview:image_V];
        }
    }
    
}

+ (CGFloat)get_H:(NSString *)str_NR row:(NSInteger)row{
    CGFloat fff = 15 + 31 + 10 + 10;
    
    fff += [MyHelper strHeight:str_NR andFont:[UIFont systemFontOfSize:14] andWidth:ScreenWidth - 30];
    if (row > 0) {
        fff += 10;
        fff += TW;
    }
    return fff;
}

+ (instancetype)init_Xib {
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    
    
    //        id vc = [[NSBundle mainBundle] loadNibNamed:
    //                 className owner:nil options:nil ].lastObject;
    //    return vc;
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
    

}


@end
