//
//	JLCG_Model_Group.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLCG_Model_Group.h"

NSString *const kJLCG_Model_GroupCreated = @"created";
NSString *const kJLCG_Model_GroupNum = @"num";
NSString *const kJLCG_Model_GroupPath = @"path";
NSString *const kJLCG_Model_GroupRanking = @"ranking";
NSString *const kJLCG_Model_GroupTel = @"tel";
NSString *const kJLCG_Model_GroupUsername = @"username";

@interface JLCG_Model_Group ()
@end
@implementation JLCG_Model_Group




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLCG_Model_GroupCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kJLCG_Model_GroupCreated] integerValue];
	}

	if(![dictionary[kJLCG_Model_GroupNum] isKindOfClass:[NSNull class]]){
		self.num = [dictionary[kJLCG_Model_GroupNum] integerValue];
	}

	if(![dictionary[kJLCG_Model_GroupPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kJLCG_Model_GroupPath];
	}	
	if(![dictionary[kJLCG_Model_GroupRanking] isKindOfClass:[NSNull class]]){
		self.ranking = [dictionary[kJLCG_Model_GroupRanking] integerValue];
	}

	if(![dictionary[kJLCG_Model_GroupTel] isKindOfClass:[NSNull class]]){
		self.tel = [dictionary[kJLCG_Model_GroupTel] integerValue];
	}

	if(![dictionary[kJLCG_Model_GroupUsername] isKindOfClass:[NSNull class]]){
		self.username = dictionary[kJLCG_Model_GroupUsername];
	}	
	return self;
}
@end
