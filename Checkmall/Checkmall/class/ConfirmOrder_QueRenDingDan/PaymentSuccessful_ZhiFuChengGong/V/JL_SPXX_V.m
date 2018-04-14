//
//  JL_SPXX_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JL_SPXX_V.h"

@implementation JL_SPXX_V


-(void)setModel:(JLCG_Model_RootClass *)model{
    _model = model;
    [self.imaegV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.data.goods.imgpath view:self.imaegV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];//商品图片
    
    self.lbl_Name.text = model.data.goods.title;//商品名称
    
    self.lbl_SJ.text = model.data.goods.endTime;//时间
    
    self.lbl_MS.text = model.data.goods.desc;
    
}


+(CGFloat)get_H:(id)data{
    return 75 + 15 * 2 + .5;
}

@end
