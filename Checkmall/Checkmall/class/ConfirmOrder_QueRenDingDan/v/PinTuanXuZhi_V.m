//
//  PinTuanXuZhi_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "PinTuanXuZhi_V.h"

@implementation PinTuanXuZhi_V


#pragma mark- 查看详情
- (IBAction)btn_XX:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector: @selector(PinTuanXuZhi_V_Delegate_Action)]) {
        [self.delegate PinTuanXuZhi_V_Delegate_Action];
    }
}



+(CGFloat)get_H:(id)data{
    return 130;
}

@end
