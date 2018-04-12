//
//	PTZFCG_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PTZFCG_Model_RootClass.h"

NSString *const kPTZFCG_Model_RootClassCode = @"code";
NSString *const kPTZFCG_Model_RootClassData = @"data";
NSString *const kPTZFCG_Model_RootClassMsg = @"msg";

@interface PTZFCG_Model_RootClass ()
@end
@implementation PTZFCG_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPTZFCG_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kPTZFCG_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[PTZFCG_Model_Data alloc] initWithDictionary:dictionary[kPTZFCG_Model_RootClassData]];
	}

	if(![dictionary[kPTZFCG_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kPTZFCG_Model_RootClassMsg];
	}	
	return self;
}
@end
