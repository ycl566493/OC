//
//	ShiPinLieBiao_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShiPinLieBiao_Model_Data.h"

NSString *const kShiPinLieBiao_Model_DataIspay = @"ispay";
NSString *const kShiPinLieBiao_Model_DataName = @"name";
NSString *const kShiPinLieBiao_Model_DataPath = @"path";

@interface ShiPinLieBiao_Model_Data ()
@end
@implementation ShiPinLieBiao_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShiPinLieBiao_Model_DataIspay] isKindOfClass:[NSNull class]]){
		self.ispay = [dictionary[kShiPinLieBiao_Model_DataIspay] integerValue];
	}

	if(![dictionary[kShiPinLieBiao_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kShiPinLieBiao_Model_DataName];
	}	
	if(![dictionary[kShiPinLieBiao_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kShiPinLieBiao_Model_DataPath];
	}	
	return self;
}
@end
