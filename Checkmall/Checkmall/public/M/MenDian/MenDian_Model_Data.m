//
//	MenDian_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MenDian_Model_Data.h"

NSString *const kMenDian_Model_DataAddress = @"address";
NSString *const kMenDian_Model_DataIdField = @"id";
NSString *const kMenDian_Model_DataName = @"name";

@interface MenDian_Model_Data ()
@end
@implementation MenDian_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMenDian_Model_DataAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kMenDian_Model_DataAddress];
	}	
	if(![dictionary[kMenDian_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kMenDian_Model_DataIdField] integerValue];
	}

	if(![dictionary[kMenDian_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kMenDian_Model_DataName];
	}	
	return self;
}
@end
