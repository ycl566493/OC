//
//	WoDe_Model_Data.m
 on 22/3/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WoDe_Model_Data.h"

NSString *const kWoDe_Model_DataCoupon = @"coupon";
NSString *const kWoDe_Model_DataCreditCardBalance = @"credit_card_balance";
NSString *const kWoDe_Model_DataIdField = @"id";
NSString *const kWoDe_Model_DataScore = @"score";
NSString *const kWoDe_Model_DataUsername = @"username";

@interface WoDe_Model_Data ()
@end
@implementation WoDe_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kWoDe_Model_DataCoupon] isKindOfClass:[NSNull class]]){
		self.coupon = [dictionary[kWoDe_Model_DataCoupon] integerValue];
	}

	if(![dictionary[kWoDe_Model_DataCreditCardBalance] isKindOfClass:[NSNull class]]){
		self.creditCardBalance = dictionary[kWoDe_Model_DataCreditCardBalance];
	}	
	if(![dictionary[kWoDe_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kWoDe_Model_DataIdField] integerValue];
	}

	if(![dictionary[kWoDe_Model_DataScore] isKindOfClass:[NSNull class]]){
		self.score = [dictionary[kWoDe_Model_DataScore] integerValue];
	}

	if(![dictionary[kWoDe_Model_DataUsername] isKindOfClass:[NSNull class]]){
		self.username = dictionary[kWoDe_Model_DataUsername];
	}	
	return self;
}
@end