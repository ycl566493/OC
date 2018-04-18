//
//	ShangPin_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShangPin_Model_RootClass.h"

NSString *const kShangPin_Model_RootClassCode = @"code";
NSString *const kShangPin_Model_RootClassData = @"data";
NSString *const kShangPin_Model_RootClassMessage = @"msg";

@interface ShangPin_Model_RootClass ()
@end
@implementation ShangPin_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShangPin_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kShangPin_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kShangPin_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[ShangPin_Model_Data alloc] initWithDictionary:dictionary[kShangPin_Model_RootClassData]];
	}

	if(![dictionary[kShangPin_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kShangPin_Model_RootClassMessage];
	}	
	return self;
}
@end
