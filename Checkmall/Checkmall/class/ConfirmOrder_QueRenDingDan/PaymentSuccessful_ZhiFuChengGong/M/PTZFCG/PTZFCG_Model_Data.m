//
//	PTZFCG_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PTZFCG_Model_Data.h"

NSString *const kPTZFCG_Model_DataCount = @"count";
NSString *const kPTZFCG_Model_DataEndtime = @"endtime";
NSString *const kPTZFCG_Model_DataGoods = @"goods";
NSString *const kPTZFCG_Model_DataGroup = @"group";
NSString *const kPTZFCG_Model_DataAgotime = @"agotime";

@interface PTZFCG_Model_Data ()
@end
@implementation PTZFCG_Model_Data


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if(![dictionary[kPTZFCG_Model_DataAgotime] isKindOfClass:[NSNull class]]){
        self.agotime = [dictionary[kPTZFCG_Model_DataAgotime] integerValue];
    }
    
	if(![dictionary[kPTZFCG_Model_DataCount] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[kPTZFCG_Model_DataCount] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_DataEndtime] isKindOfClass:[NSNull class]]){
		self.endtime = [dictionary[kPTZFCG_Model_DataEndtime] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_DataGoods] isKindOfClass:[NSNull class]]){
		self.goods = [[PTZFCG_Model_Good alloc] initWithDictionary:dictionary[kPTZFCG_Model_DataGoods]];
	}

	if(dictionary[kPTZFCG_Model_DataGroup] != nil && [dictionary[kPTZFCG_Model_DataGroup] isKindOfClass:[NSArray class]]){
		NSArray * groupDictionaries = dictionary[kPTZFCG_Model_DataGroup];
		NSMutableArray * groupItems = [NSMutableArray array];
		for(NSDictionary * groupDictionary in groupDictionaries){
			PTZFCG_Model_Group * groupItem = [[PTZFCG_Model_Group alloc] initWithDictionary:groupDictionary];
			[groupItems addObject:groupItem];
		}
		self.group = groupItems;
	}
	return self;
}
@end
