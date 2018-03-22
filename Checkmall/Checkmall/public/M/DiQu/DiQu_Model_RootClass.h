//
//	DiQu_Model_RootClass.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DiQu_Model_Data.h"

@interface DiQu_Model_RootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) NSString * msg;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
