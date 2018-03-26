//
//  KBY_View.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/26.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "KBY_View.h"

@implementation KBY_View


- (IBAction)btn_Action:(id)sender {
    NSLog(@"按钮");
    if (self.delegate && [self.delegate respondsToSelector:@selector(KBY_View_Delegate_Action)]) {
        [self.delegate KBY_View_Delegate_Action];
    }
}

@end
