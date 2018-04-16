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

-(void)setModel:(PLLB_Model_Data *)model{
    _model = model;
    
    self.imageV_PF.clipsToBounds = YES;
    CGFloat SL = model.descrank > 5 ? 5 : model.descrank;
    self.imageV_PF_W.constant = 70 / 5 * SL;
    
    self.imageV_TX.layer.masksToBounds = YES;
    self.imageV_TX.layer.cornerRadius = self.imageV_TX.width / 2;
    self.imageV_TX.layer.borderColor = UIColorFromHex(0xd1d1d1).CGColor;
    self.imageV_TX.layer.borderWidth = .5;
    [self.imageV_TX sd_setImageWithURL:[MyHelper imaeg_URL:model.path view:self.imageV_TX] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    self.lbl_Name.text = model.nickname;
    self.lbl_SJ.text = [MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model.created]];
    self.lbl_NR.text = model.content;
    self.lbl_NR.height = [MyHelper strHeight:self.lbl_NR.text andFont:[UIFont systemFontOfSize:14] andWidth:ScreenWidth - 30];
    
    if (model.piclist.count == 0) {
        self.view_TP.hidden = YES;
        self.view_TP_H.constant = -10;
    }else{
        self.view_TP.hidden = NO;
        self.view_TP_H.constant = TW;
        
        for (UIView *vvvv in self.view_TP.subviews) {
            [vvvv removeFromSuperview];
        }
        
        for (NSInteger i = 0; i < (model.piclist.count > 4 ? 4 : model.piclist.count ); i ++) {
            UIImageView *image_V = [[UIImageView alloc]initWithFrame:CGRectMake((TW + 7) * i, 0, TW, TW)];
            NSString *URL = model.piclist[i];
            [image_V sd_setImageWithURL:[MyHelper imaeg_URL:URL view:image_V] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
            
            [self.view_TP addSubview:image_V];
        }
    }
    
}

- (void)setModel_XQ:(ShangPin_Model_Com_Info *)model_XQ{
    _model_XQ = model_XQ;
    self.imageV_PF.clipsToBounds = YES;
    CGFloat SL = model_XQ.descrank > 5 ? 5 : model_XQ.descrank;
    self.imageV_PF_W.constant = 70 / 5 * SL;
    
    self.imageV_TX.layer.masksToBounds = YES;
    self.imageV_TX.layer.cornerRadius = self.imageV_TX.width / 2;
    self.imageV_TX.layer.borderColor = UIColorFromHex(0xd1d1d1).CGColor;
    self.imageV_TX.layer.borderWidth = .5;
    [self.imageV_TX sd_setImageWithURL:[MyHelper imaeg_URL:model_XQ.headimgurl view:self.imageV_TX] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    self.lbl_Name.text = model_XQ.nickname;
    self.lbl_SJ.text = [MyHelper dateChangeToTime:[NSString stringWithFormat:@"%li",model_XQ.created]];
    self.lbl_NR.text = model_XQ.content;
    self.lbl_NR.height = [MyHelper strHeight:self.lbl_NR.text andFont:[UIFont systemFontOfSize:14] andWidth:ScreenWidth - 30];
    
    self.view_TP.hidden = YES;
    self.view_TP_H.constant = -10;
   
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
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
    

}


@end
