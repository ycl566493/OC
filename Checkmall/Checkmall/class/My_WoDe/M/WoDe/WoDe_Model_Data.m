//
//	WoDe_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WoDe_Model_Data.h"

NSString *const kWoDe_Model_DataCoupon = @"coupon";
NSString *const kWoDe_Model_DataCreditCardBalance = @"credit_card_balance";
NSString *const kWoDe_Model_DataIdField = @"id";
NSString *const kWoDe_Model_DataScore = @"score";
NSString *const kWoDe_Model_DataUsername = @"username";
NSString *const kWoDe_Model_DataPath = @"path";
NSString *const kWoDe_Model_Dataconum = @"conum";
NSString *const kWoDe_Model_Datasex = @"sex";

@interface WoDe_Model_Data ()
@end
@implementation WoDe_Model_Data


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    
    if(![dictionary[kWoDe_Model_Datasex] isKindOfClass:[NSNull class]]){
        self.sex = [dictionary[kWoDe_Model_Datasex] integerValue];
    }
    
    if(![dictionary[kWoDe_Model_Dataconum] isKindOfClass:[NSNull class]]){
        self.conum = [dictionary[kWoDe_Model_Dataconum] integerValue];
    }

    
    if(![dictionary[kWoDe_Model_DataPath] isKindOfClass:[NSNull class]]){
        self.path = dictionary[kWoDe_Model_DataPath];
    }
    
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
