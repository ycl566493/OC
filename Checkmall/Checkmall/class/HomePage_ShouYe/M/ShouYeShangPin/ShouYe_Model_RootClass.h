//
//	ShouYe_Model_RootClass.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "ShouYe_Model_Data.h"

@interface ShouYe_Model_RootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) NSString * message;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
