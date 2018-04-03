//
//	ZFJG_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZFJG_Model_RootClass.h"

NSString *const kZFJG_Model_RootClassCode = @"code";
NSString *const kZFJG_Model_RootClassData = @"data";
NSString *const kZFJG_Model_RootClassMsg = @"msg";

@interface ZFJG_Model_RootClass ()
@end
@implementation ZFJG_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZFJG_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kZFJG_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kZFJG_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[ZFJG_Model_Data alloc] initWithDictionary:dictionary[kZFJG_Model_RootClassData]];
	}

	if(![dictionary[kZFJG_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kZFJG_Model_RootClassMsg];
	}	
	return self;
}
@end
