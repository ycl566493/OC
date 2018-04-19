//
//	Share.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport
//分享模块

#import <UIKit/UIKit.h>

@interface Share : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
