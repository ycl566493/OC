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

- (PingJia_Cell *)PJ{
    if (!_PJ) {
        PingJia_Cell *pj = [PingJia_Cell init_Xib];
        _PJ = pj;
        _PJ.frame = CGRectMake(0, 44.5, ScreenWidth, [PingJia_Cell get_H:@"哈哈哈哈" row:2]);
        [_PJ set_W:2];
    }
    return _PJ;
}

+ (CGFloat)get_H:(id)data{
    return 45 + [PingJia_Cell get_H:@"哈哈哈哈" row:2];

}

@end
