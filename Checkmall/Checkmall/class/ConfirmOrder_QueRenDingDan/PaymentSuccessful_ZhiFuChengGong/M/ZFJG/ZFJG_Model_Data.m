//
//	ZFJG_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZFJG_Model_Data.h"

NSString *const kZFJG_Model_DataPaidAmount = @"paid_amount";
NSString *const kZFJG_Model_DataSta = @"sta";

@interface ZFJG_Model_Data ()
@end
@implementation ZFJG_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kZFJG_Model_DataPaidAmount] isKindOfClass:[NSNull class]]){
		self.paidAmount = dictionary[kZFJG_Model_DataPaidAmount];
	}	
	if(![dictionary[kZFJG_Model_DataSta] isKindOfClass:[NSNull class]]){
		self.sta = [dictionary[kZFJG_Model_DataSta] boolValue];
	}

	return self;
}
@end
