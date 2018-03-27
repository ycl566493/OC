//
//	YouHuiJuan_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "YouHuiJuan_Model_Data.h"

NSString *const kYouHuiJuan_Model_DataEndtime = @"endtime";
NSString *const kYouHuiJuan_Model_DataIdField = @"id";
NSString *const kYouHuiJuan_Model_DataName = @"name";
NSString *const kYouHuiJuan_Model_DataNeedprice = @"needprice";
NSString *const kYouHuiJuan_Model_DataPath = @"path";

@interface YouHuiJuan_Model_Data ()
@end
@implementation YouHuiJuan_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kYouHuiJuan_Model_DataEndtime] isKindOfClass:[NSNull class]]){
		self.endtime = dictionary[kYouHuiJuan_Model_DataEndtime];
	}	
	if(![dictionary[kYouHuiJuan_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kYouHuiJuan_Model_DataIdField] integerValue];
	}

	if(![dictionary[kYouHuiJuan_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kYouHuiJuan_Model_DataName];
	}	
	if(![dictionary[kYouHuiJuan_Model_DataNeedprice] isKindOfClass:[NSNull class]]){
		self.needprice = [dictionary[kYouHuiJuan_Model_DataNeedprice] integerValue];
	}

	if(![dictionary[kYouHuiJuan_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kYouHuiJuan_Model_DataPath];
	}	
	return self;
}
@end
