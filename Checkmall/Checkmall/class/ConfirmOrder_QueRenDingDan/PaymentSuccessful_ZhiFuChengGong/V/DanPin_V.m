//
//  DanPin_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DanPin_V.h"

@implementation DanPin_V

-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
}

-(void)init_UI{
    
}
- (IBAction)btn_FX:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(DanPin_V_Delegate_Action_FX)]) {
        [self.delegate DanPin_V_Delegate_Action_FX];
    }
}

#pragma mark- //查看订单
- (IBAction)btn_DD_Action:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(DanPin_V_Delegate_Action_DD)]) {
        [self.delegate DanPin_V_Delegate_Action_DD];
    }
}

#pragma mark- 返回首页
- (IBAction)btn_FHSY_Action:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(DanPin_V_Delegate_Action_FH)]) {
        [self.delegate DanPin_V_Delegate_Action_FH];
    }
}


+(CGFloat)get_H:(id)data{
    return 247;
}

@end
