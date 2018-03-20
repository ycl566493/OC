//
//  CollectionReusableView_H.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "CollectionReusableView_H.h"

#ifdef __IPHONE_11_0
@interface CustomLayer : CALayer

@end
#endif

#ifdef __IPHONE_11_0
@implementation CustomLayer

- (CGFloat) zPosition {
    return 0;
}

@end
#endif

@implementation CollectionReusableView_H

- (void)layoutSubviews {
    [super layoutSubviews];
}


#ifdef __IPHONE_11_0
+ (Class)layerClass {
    return [CustomLayer class];
}
#endif


@end
