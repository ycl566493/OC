//
//	DiQu_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DiQu_Model_Data.h"

NSString *const kDiQu_Model_DataGeoId = @"geo_id";
NSString *const kDiQu_Model_DataGeoName = @"geo_name";

@interface DiQu_Model_Data ()
@end
@implementation DiQu_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDiQu_Model_DataGeoId] isKindOfClass:[NSNull class]]){
		self.geoId = [dictionary[kDiQu_Model_DataGeoId] integerValue];
	}

	if(![dictionary[kDiQu_Model_DataGeoName] isKindOfClass:[NSNull class]]){
		self.geoName = dictionary[kDiQu_Model_DataGeoName];
	}	
	return self;
}
@end
