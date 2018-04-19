//
//  SPPJ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SPPJ_V.h"
#import "PingJia_Cell.h"

@interface SPPJ_V(){
    
}
@property (nonatomic,weak)PingJia_Cell *PJ;

@end

@implementation SPPJ_V

- (IBAction)btn_Action:(id)sender {
    //更多
    if (self.delegate && [self.delegate respondsToSelector:@selector(SPPJ_V_Delegate_GD)]) {
        [self.delegate SPPJ_V_Delegate_GD];
    }
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self addSubview:self.PJ];
    
}

-(void)setModel:(ShangPin_Model_Comment *)model{
    _model = model;
    self.PJ.height = [PingJia_Cell get_H:model.comInfo.content row:0];
    self.PJ.model_XQ = model.comInfo;
    
    self.lbl_SL.text = [NSString stringWithFormat:@"商品评价（%@）",model.rate > 1000 ? @"999+" : [NSString stringWithFormat:@"%li",model.rate]];
}

-(void)setModel_JL:(JLXQ_Model_RootClass *)model_JL{
    _model_JL = model_JL;
    self.PJ.height = [PingJia_Cell get_H:model_JL.data.comment.comInfo.content row:0];
    self.PJ.model_XQ = model_JL.data.comment.comInfo;
    
    self.lbl_SL.text = [NSString stringWithFormat:@"商品评价（%@）",model_JL.data.comment.rate > 1000 ? @"999+" : [NSString stringWithFormat:@"%li",model_JL.data.comment.rate]];
}

- (PingJia_Cell *)PJ{
    if (!_PJ) {
        PingJia_Cell *pj = [PingJia_Cell init_Xib];
        _PJ = pj;
        _PJ.frame = CGRectMake(0, 44.5, ScreenWidth, [PingJia_Cell get_H:@"哈哈哈哈" row:2]);
    }
    return _PJ;
}

+ (CGFloat)get_H:(id)data{
    ShangPin_Model_Com_Info    *mmm =data;
    if (!mmm) {
        return 45;
    }
    return 45 + [PingJia_Cell get_H:mmm.content row:0];
}

@end
