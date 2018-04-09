//
//	MenDian_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface MenDian_Model_Data : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
