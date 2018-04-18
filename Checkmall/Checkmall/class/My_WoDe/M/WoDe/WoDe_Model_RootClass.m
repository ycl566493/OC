//
//	WoDe_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WoDe_Model_RootClass.h"

NSString *const kWoDe_Model_RootClassCode = @"code";
NSString *const kWoDe_Model_RootClassData = @"data";
NSString *const kWoDe_Model_RootClassMessage = @"msg";

@interface WoDe_Model_RootClass ()
@end
@implementation WoDe_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWoDe_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kWoDe_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kWoDe_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[WoDe_Model_Data alloc] initWithDictionary:dictionary[kWoDe_Model_RootClassData]];
	}

	if(![dictionary[kWoDe_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kWoDe_Model_RootClassMessage];
	}	
	return self;
}
@end
