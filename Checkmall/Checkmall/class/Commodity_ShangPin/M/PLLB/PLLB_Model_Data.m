//
//	PLLB_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PLLB_Model_Data.h"

NSString *const kPLLB_Model_DataContent = @"content";
NSString *const kPLLB_Model_DataCreated = @"created";
NSString *const kPLLB_Model_DataDescrank = @"descrank";
NSString *const kPLLB_Model_DataNickname = @"nickname";
NSString *const kPLLB_Model_DataPath = @"path";
NSString *const kPLLB_Model_DataPiclist = @"piclist";
NSString *const kPLLB_Model_DataSlidshow = @"slidshow";

@interface PLLB_Model_Data ()
@end
@implementation PLLB_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPLLB_Model_DataContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kPLLB_Model_DataContent];
	}	
	if(![dictionary[kPLLB_Model_DataCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kPLLB_Model_DataCreated] integerValue];
	}

	if(![dictionary[kPLLB_Model_DataDescrank] isKindOfClass:[NSNull class]]){
		self.descrank = [dictionary[kPLLB_Model_DataDescrank] integerValue];
	}

	if(![dictionary[kPLLB_Model_DataNickname] isKindOfClass:[NSNull class]]){
		self.nickname = dictionary[kPLLB_Model_DataNickname];
	}	
	if(![dictionary[kPLLB_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kPLLB_Model_DataPath];
	}	
	if(![dictionary[kPLLB_Model_DataPiclist] isKindOfClass:[NSNull class]]){
		self.piclist = dictionary[kPLLB_Model_DataPiclist];
	}	
	if(![dictionary[kPLLB_Model_DataSlidshow] isKindOfClass:[NSNull class]]){
		self.slidshow = dictionary[kPLLB_Model_DataSlidshow];
	}	
	return self;
}
@end
