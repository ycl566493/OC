//
//	JLCG_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLCG_Model_Data.h"

NSString *const kJLCG_Model_DataAgotime = @"agotime";
NSString *const kJLCG_Model_DataCount = @"count";
NSString *const kJLCG_Model_DataEndtime = @"endtime";
NSString *const kJLCG_Model_DataGoods = @"goods";
NSString *const kJLCG_Model_DataGroup = @"group";

@interface JLCG_Model_Data ()
@end
@implementation JLCG_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLCG_Model_DataAgotime] isKindOfClass:[NSNull class]]){
		self.agotime = [dictionary[kJLCG_Model_DataAgotime] integerValue];
	}

	if(![dictionary[kJLCG_Model_DataCount] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[kJLCG_Model_DataCount] integerValue];
	}

	if(![dictionary[kJLCG_Model_DataEndtime] isKindOfClass:[NSNull class]]){
		self.endtime = dictionary[kJLCG_Model_DataEndtime];
	}	
	if(![dictionary[kJLCG_Model_DataGoods] isKindOfClass:[NSNull class]]){
		self.goods = [[JLCG_Model_Good alloc] initWithDictionary:dictionary[kJLCG_Model_DataGoods]];
	}

	if(dictionary[kJLCG_Model_DataGroup] != nil && [dictionary[kJLCG_Model_DataGroup] isKindOfClass:[NSArray class]]){
		NSArray * groupDictionaries = dictionary[kJLCG_Model_DataGroup];
		NSMutableArray * groupItems = [NSMutableArray array];
		for(NSDictionary * groupDictionary in groupDictionaries){
			JLCG_Model_Group * groupItem = [[JLCG_Model_Group alloc] initWithDictionary:groupDictionary];
			[groupItems addObject:groupItem];
		}
		self.group = groupItems;
	}
	return self;
}
@end
