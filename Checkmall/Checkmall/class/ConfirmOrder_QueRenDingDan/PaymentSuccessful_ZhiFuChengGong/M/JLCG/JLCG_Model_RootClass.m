//
//	JLCG_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLCG_Model_RootClass.h"

NSString *const kJLCG_Model_RootClassCode = @"code";
NSString *const kJLCG_Model_RootClassData = @"data";
NSString *const kJLCG_Model_RootClassMsg = @"msg";

@interface JLCG_Model_RootClass ()
@end
@implementation JLCG_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLCG_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kJLCG_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kJLCG_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[JLCG_Model_Data alloc] initWithDictionary:dictionary[kJLCG_Model_RootClassData]];
	}

	if(![dictionary[kJLCG_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kJLCG_Model_RootClassMsg];
	}	
	return self;
}
@end
