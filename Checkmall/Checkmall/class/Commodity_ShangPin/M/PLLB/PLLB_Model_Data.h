//
//	PLLB_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PLLB_Model_Data : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, assign) NSInteger descrank;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSArray * piclist;
@property (nonatomic, strong) NSString * slidshow;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
