//
//	ShiPinLieBiao_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShiPinLieBiao_Model_RootClass.h"

NSString *const kShiPinLieBiao_Model_RootClassCode = @"code";
NSString *const kShiPinLieBiao_Model_RootClassData = @"data";
NSString *const kShiPinLieBiao_Model_RootClassMsg = @"msg";

@interface ShiPinLieBiao_Model_RootClass ()
@end
@implementation ShiPinLieBiao_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShiPinLieBiao_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kShiPinLieBiao_Model_RootClassCode] integerValue];
	}

	if(dictionary[kShiPinLieBiao_Model_RootClassData] != nil && [dictionary[kShiPinLieBiao_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kShiPinLieBiao_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			ShiPinLieBiao_Model_Data * dataItem = [[ShiPinLieBiao_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kShiPinLieBiao_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kShiPinLieBiao_Model_RootClassMsg];
	}	
	return self;
}
@end
