//
//  MyUIView.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/5.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "MyUIView.h"

@implementation MyUIView


+(CGFloat)get_H:(id)data{
    
    return 0;
}

-(void)init_UI{
    
}

+ (instancetype)init_Xib {
    NSString *className = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    
    
//        id vc = [[NSBundle mainBundle] loadNibNamed:
//                 className owner:nil options:nil ].lastObject;
//    return vc;
    return [nib instantiateWithOwner:nil options:nil].firstObject;
}

@end
