//
//	QueRenDingDan_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QueRenDingDan_Model_Data.h"

NSString *const kQueRenDingDan_Model_DataAddress = @"address";
NSString *const kQueRenDingDan_Model_DataArr = @"arr";
NSString *const kQueRenDingDan_Model_DataDistribution = @"distribution";
NSString *const kQueRenDingDan_Model_DataIsfirst = @"isfirst";

@interface QueRenDingDan_Model_Data ()
@end
@implementation QueRenDingDan_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kQueRenDingDan_Model_DataAddress] isKindOfClass:[NSNull class]]){
		self.address = [[QueRenDingDan_Model_Addres alloc] initWithDictionary:dictionary[kQueRenDingDan_Model_DataAddress]];
	}

	if(dictionary[kQueRenDingDan_Model_DataArr] != nil && [dictionary[kQueRenDingDan_Model_DataArr] isKindOfClass:[NSArray class]]){
		NSArray * arrDictionaries = dictionary[kQueRenDingDan_Model_DataArr];
		NSMutableArray * arrItems = [NSMutableArray array];
		for(NSDictionary * arrDictionary in arrDictionaries){
			QueRenDingDan_Model_Arr * arrItem = [[QueRenDingDan_Model_Arr alloc] initWithDictionary:arrDictionary];
			[arrItems addObject:arrItem];
		}
		self.arr = arrItems;
	}
	if(![dictionary[kQueRenDingDan_Model_DataDistribution] isKindOfClass:[NSNull class]]){
		self.distribution = [dictionary[kQueRenDingDan_Model_DataDistribution] boolValue];
	}

	if(![dictionary[kQueRenDingDan_Model_DataIsfirst] isKindOfClass:[NSNull class]]){
		self.isfirst = [dictionary[kQueRenDingDan_Model_DataIsfirst] boolValue];
	}

	return self;
}
@end
