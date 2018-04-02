//
//	DingDanZhuangTai_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DingDanZhuangTai_Model_RootClass.h"

NSString *const kDingDanZhuangTai_Model_RootClassCode = @"code";
NSString *const kDingDanZhuangTai_Model_RootClassData = @"data";
NSString *const kDingDanZhuangTai_Model_RootClassMsg = @"msg";

@interface DingDanZhuangTai_Model_RootClass ()
@end
@implementation DingDanZhuangTai_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDingDanZhuangTai_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kDingDanZhuangTai_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kDingDanZhuangTai_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[DingDanZhuangTai_Model_Data alloc] initWithDictionary:dictionary[kDingDanZhuangTai_Model_RootClassData]];
	}

	if(![dictionary[kDingDanZhuangTai_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kDingDanZhuangTai_Model_RootClassMsg];
	}	
	return self;
}
@end
