//
//	JLXQ_Model_Buyuser.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLXQ_Model_Buyuser.h"

NSString *const kJLXQ_Model_BuyuserCreated = @"created";
NSString *const kJLXQ_Model_BuyuserHeadimgurl = @"headimgurl";
NSString *const kJLXQ_Model_BuyuserNickname = @"nickname";
NSString *const kJLXQ_Model_BuyuserSort = @"sort";

@interface JLXQ_Model_Buyuser ()
@end
@implementation JLXQ_Model_Buyuser




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLXQ_Model_BuyuserCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kJLXQ_Model_BuyuserCreated] integerValue];
	}

	if(![dictionary[kJLXQ_Model_BuyuserHeadimgurl] isKindOfClass:[NSNull class]]){
		self.headimgurl = dictionary[kJLXQ_Model_BuyuserHeadimgurl];
	}	
	if(![dictionary[kJLXQ_Model_BuyuserNickname] isKindOfClass:[NSNull class]]){
		self.nickname = dictionary[kJLXQ_Model_BuyuserNickname];
	}	
	if(![dictionary[kJLXQ_Model_BuyuserSort] isKindOfClass:[NSNull class]]){
		self.sort = [dictionary[kJLXQ_Model_BuyuserSort] integerValue];
	}

	return self;
}
@end
