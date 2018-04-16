//
//	ShangPin_Model_Com_Info.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShangPin_Model_Com_Info.h"

NSString *const kShangPin_Model_Com_InfoContent = @"content";
NSString *const kShangPin_Model_Com_InfoCreated = @"created";
NSString *const kShangPin_Model_Com_InfoDescrank = @"descrank";
NSString *const kShangPin_Model_Com_InfoHeadimgurl = @"headimgurl";
NSString *const kShangPin_Model_Com_InfoNickname = @"nickname";
NSString *const kShangPin_Model_Com_InfoSlidshow = @"slidshow";

@interface ShangPin_Model_Com_Info ()
@end
@implementation ShangPin_Model_Com_Info




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShangPin_Model_Com_InfoContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kShangPin_Model_Com_InfoContent];
	}	
	if(![dictionary[kShangPin_Model_Com_InfoCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kShangPin_Model_Com_InfoCreated] integerValue];
	}

	if(![dictionary[kShangPin_Model_Com_InfoDescrank] isKindOfClass:[NSNull class]]){
		self.descrank = [dictionary[kShangPin_Model_Com_InfoDescrank] integerValue];
	}

	if(![dictionary[kShangPin_Model_Com_InfoHeadimgurl] isKindOfClass:[NSNull class]]){
		self.headimgurl = dictionary[kShangPin_Model_Com_InfoHeadimgurl];
	}	
	if(![dictionary[kShangPin_Model_Com_InfoNickname] isKindOfClass:[NSNull class]]){
		self.nickname = dictionary[kShangPin_Model_Com_InfoNickname];
	}	
	if(![dictionary[kShangPin_Model_Com_InfoSlidshow] isKindOfClass:[NSNull class]]){
		self.slidshow = dictionary[kShangPin_Model_Com_InfoSlidshow];
	}	
	return self;
}
@end
