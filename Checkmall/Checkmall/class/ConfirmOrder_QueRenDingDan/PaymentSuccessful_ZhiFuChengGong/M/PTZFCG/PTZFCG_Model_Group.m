//
//	PTZFCG_Model_Group.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PTZFCG_Model_Group.h"

NSString *const kPTZFCG_Model_GroupCreated = @"created";
NSString *const kPTZFCG_Model_GroupPath = @"path";
NSString *const kPTZFCG_Model_GroupRanking = @"ranking";
NSString *const kPTZFCG_Model_GroupTel = @"tel";
NSString *const kPTZFCG_Model_GroupUsername = @"username";

@interface PTZFCG_Model_Group ()
@end
@implementation PTZFCG_Model_Group




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPTZFCG_Model_GroupCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kPTZFCG_Model_GroupCreated] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_GroupPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kPTZFCG_Model_GroupPath];
	}	
	if(![dictionary[kPTZFCG_Model_GroupRanking] isKindOfClass:[NSNull class]]){
		self.ranking = [dictionary[kPTZFCG_Model_GroupRanking] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_GroupTel] isKindOfClass:[NSNull class]]){
		self.tel = [dictionary[kPTZFCG_Model_GroupTel] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_GroupUsername] isKindOfClass:[NSNull class]]){
		self.username = dictionary[kPTZFCG_Model_GroupUsername];
	}

	return self;
}
@end
