//
//  NK_Base64.h
//  NewKnowledge
//
//  Created by vct on 15/8/1.
//  Copyright (c) 2015年 vct. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<CommonCrypto/CommonCryptor.h>

@interface Base64codeFunc : NSObject
+ (NSString *)base64StringFromText:(NSString *)text;
+ (NSString *)textFromBase64String:(NSString *)base64;
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

@end
