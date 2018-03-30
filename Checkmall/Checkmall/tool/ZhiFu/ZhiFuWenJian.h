//
//  ZhiFuWenJian.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/23.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhiFuWenJian : NSObject

- (NSString *)generateTradeNO;

+(void)WeiXinZhiFu_partnerId:(NSString *)partnerId prepayId:(NSString *)prepayId nonceStr:(NSString *)nonceStr timeStamp:(UInt32)timeStamp package:(NSString *)package sign:(NSString *)sign;
@end
