//
//	QueRenDingDan_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QueRenDingDan_Model_RootClass.h"

NSString *const kQueRenDingDan_Model_RootClassCode = @"code";
NSString *const kQueRenDingDan_Model_RootClassData = @"data";
NSString *const kQueRenDingDan_Model_RootClassMsg = @"msg";

@interface QueRenDingDan_Model_RootClass ()
@end
@implementation QueRenDingDan_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kQueRenDingDan_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kQueRenDingDan_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[QueRenDingDan_Model_Data alloc] initWithDictionary:dictionary[kQueRenDingDan_Model_RootClassData]];
	}

	if(![dictionary[kQueRenDingDan_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kQueRenDingDan_Model_RootClassMsg];
	}	
	return self;
}
@end
