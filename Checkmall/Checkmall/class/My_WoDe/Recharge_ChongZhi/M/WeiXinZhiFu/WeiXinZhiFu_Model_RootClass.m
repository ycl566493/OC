//
//	WeiXinZhiFu_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeiXinZhiFu_Model_RootClass.h"

NSString *const kWeiXinZhiFu_Model_RootClassCode = @"code";
NSString *const kWeiXinZhiFu_Model_RootClassData = @"data";
NSString *const kWeiXinZhiFu_Model_RootClassMsg = @"msg";

@interface WeiXinZhiFu_Model_RootClass ()
@end
@implementation WeiXinZhiFu_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWeiXinZhiFu_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kWeiXinZhiFu_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kWeiXinZhiFu_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[WeiXinZhiFu_Model_Data alloc] initWithDictionary:dictionary[kWeiXinZhiFu_Model_RootClassData]];
	}

	if(![dictionary[kWeiXinZhiFu_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kWeiXinZhiFu_Model_RootClassMsg];
	}	
	return self;
}
@end
