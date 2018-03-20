//
//  TC_DHJ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_DHJ_V.h"

@implementation TC_DHJ_V


-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
    
}

-(void)init_UI{
    
   
    
}

#pragma mark- 关闭按钮
- (IBAction)btn_GB_Action:(UIButton *)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}



@end
