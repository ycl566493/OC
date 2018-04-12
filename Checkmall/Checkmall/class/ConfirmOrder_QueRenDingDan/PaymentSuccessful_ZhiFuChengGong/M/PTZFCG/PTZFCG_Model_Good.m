//
//	PTZFCG_Model_Good.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PTZFCG_Model_Good.h"

NSString *const kPTZFCG_Model_GoodArrivalTime = @"arrival_time";
NSString *const kPTZFCG_Model_GoodCouponAmount = @"coupon_amount";
NSString *const kPTZFCG_Model_GoodGid = @"gid";
NSString *const kPTZFCG_Model_GoodGoodsName = @"goods_name";
NSString *const kPTZFCG_Model_GoodNumber = @"number";
NSString *const kPTZFCG_Model_GoodPrice = @"price";
NSString *const kPTZFCG_Model_GoodSprice = @"sprice";
NSString *const kPTZFCG_Model_GoodUrl = @"url";

@interface PTZFCG_Model_Good ()
@end
@implementation PTZFCG_Model_Good




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPTZFCG_Model_GoodArrivalTime] isKindOfClass:[NSNull class]]){
		self.arrivalTime = [dictionary[kPTZFCG_Model_GoodArrivalTime] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_GoodCouponAmount] isKindOfClass:[NSNull class]]){
		self.couponAmount = dictionary[kPTZFCG_Model_GoodCouponAmount];
	}	
	if(![dictionary[kPTZFCG_Model_GoodGid] isKindOfClass:[NSNull class]]){
		self.gid = [dictionary[kPTZFCG_Model_GoodGid] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_GoodGoodsName] isKindOfClass:[NSNull class]]){
		self.goodsName = dictionary[kPTZFCG_Model_GoodGoodsName];
	}	
	if(![dictionary[kPTZFCG_Model_GoodNumber] isKindOfClass:[NSNull class]]){
		self.number = [dictionary[kPTZFCG_Model_GoodNumber] integerValue];
	}

	if(![dictionary[kPTZFCG_Model_GoodPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kPTZFCG_Model_GoodPrice];
	}	
	if(![dictionary[kPTZFCG_Model_GoodSprice] isKindOfClass:[NSNull class]]){
		self.sprice = [dictionary[kPTZFCG_Model_GoodSprice] floatValue];
	}

	if(![dictionary[kPTZFCG_Model_GoodUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kPTZFCG_Model_GoodUrl];
	}	
	return self;
}
@end
