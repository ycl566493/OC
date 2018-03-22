//
//	DiQu_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DiQu_Model_Data : NSObject

@property (nonatomic, assign) NSInteger geoId;
@property (nonatomic, strong) NSString * geoName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
