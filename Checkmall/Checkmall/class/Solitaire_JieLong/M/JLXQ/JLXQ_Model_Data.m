//
//	JLXQ_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLXQ_Model_Data.h"

NSString *const kJLXQ_Model_DataAmount = @"amount";
NSString *const kJLXQ_Model_DataArrivaltime = @"arrivaltime";
NSString *const kJLXQ_Model_DataBuynum = @"buynum";
NSString *const kJLXQ_Model_DataBuyuser = @"buyuser";
NSString *const kJLXQ_Model_DataComment = @"comment";
NSString *const kJLXQ_Model_DataDetails = @"details";
NSString *const kJLXQ_Model_DataGoodsid = @"goodsid";
NSString *const kJLXQ_Model_DataMprice = @"mprice";
NSString *const kJLXQ_Model_DataName = @"name";
NSString *const kJLXQ_Model_DataPath = @"path";
NSString *const kJLXQ_Model_DataPrice = @"price";
NSString *const kJLXQ_Model_DataPromotion = @"promotion";
NSString *const kJLXQ_Model_DataRule = @"rule";
NSString *const kJLXQ_Model_DataSid = @"sid";
NSString *const kJLXQ_Model_DataSlidshow = @"slidshow";
NSString *const kJLXQ_Model_DataStock = @"stock";
NSString *const kJLXQ_Model_DataSumnum = @"sumnum";
NSString *const kJLXQ_Model_DataSurplusTime = @"surplus_time";
NSString *const kJLXQ_Model_DataTaketype = @"taketype";
NSString *const kJLXQ_Model_DataVideo = @"video";

@interface JLXQ_Model_Data ()
@end
@implementation JLXQ_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLXQ_Model_DataAmount] isKindOfClass:[NSNull class]]){
		self.amount = [dictionary[kJLXQ_Model_DataAmount] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataArrivaltime] isKindOfClass:[NSNull class]]){
		self.arrivaltime = [dictionary[kJLXQ_Model_DataArrivaltime] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataBuynum] isKindOfClass:[NSNull class]]){
		self.buynum = [dictionary[kJLXQ_Model_DataBuynum] integerValue];
	}

	if(dictionary[kJLXQ_Model_DataBuyuser] != nil && [dictionary[kJLXQ_Model_DataBuyuser] isKindOfClass:[NSArray class]]){
		NSArray * buyuserDictionaries = dictionary[kJLXQ_Model_DataBuyuser];
		NSMutableArray * buyuserItems = [NSMutableArray array];
		for(NSDictionary * buyuserDictionary in buyuserDictionaries){
			JLXQ_Model_Buyuser * buyuserItem = [[JLXQ_Model_Buyuser alloc] initWithDictionary:buyuserDictionary];
			[buyuserItems addObject:buyuserItem];
		}
		self.buyuser = buyuserItems;
	}
	if(![dictionary[kJLXQ_Model_DataComment] isKindOfClass:[NSNull class]]){
		self.comment = [[ShangPin_Model_Comment alloc] initWithDictionary:dictionary[kJLXQ_Model_DataComment]];
	}

	if(![dictionary[kJLXQ_Model_DataDetails] isKindOfClass:[NSNull class]]){
		self.details = dictionary[kJLXQ_Model_DataDetails];
	}	
	if(![dictionary[kJLXQ_Model_DataGoodsid] isKindOfClass:[NSNull class]]){
		self.goodsid = [dictionary[kJLXQ_Model_DataGoodsid] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataMprice] isKindOfClass:[NSNull class]]){
		self.mprice = dictionary[kJLXQ_Model_DataMprice];
	}	
	if(![dictionary[kJLXQ_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kJLXQ_Model_DataName];
	}	
	if(![dictionary[kJLXQ_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kJLXQ_Model_DataPath];
	}	
	if(![dictionary[kJLXQ_Model_DataPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kJLXQ_Model_DataPrice];
	}	
	if(![dictionary[kJLXQ_Model_DataPromotion] isKindOfClass:[NSNull class]]){
		self.promotion = dictionary[kJLXQ_Model_DataPromotion];
	}	
	if(dictionary[kJLXQ_Model_DataRule] != nil && [dictionary[kJLXQ_Model_DataRule] isKindOfClass:[NSArray class]]){
		NSArray * ruleDictionaries = dictionary[kJLXQ_Model_DataRule];
		NSMutableArray * ruleItems = [NSMutableArray array];
		for(NSDictionary * ruleDictionary in ruleDictionaries){
			JLXQ_Model_Rule * ruleItem = [[JLXQ_Model_Rule alloc] initWithDictionary:ruleDictionary];
			[ruleItems addObject:ruleItem];
		}
		self.rule = ruleItems;
	}
	if(![dictionary[kJLXQ_Model_DataSid] isKindOfClass:[NSNull class]]){
		self.sid = [dictionary[kJLXQ_Model_DataSid] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataSlidshow] isKindOfClass:[NSNull class]]){
		self.slidshow = dictionary[kJLXQ_Model_DataSlidshow];
	}	
	if(![dictionary[kJLXQ_Model_DataStock] isKindOfClass:[NSNull class]]){
		self.stock = [dictionary[kJLXQ_Model_DataStock] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataSumnum] isKindOfClass:[NSNull class]]){
		self.sumnum = dictionary[kJLXQ_Model_DataSumnum];
	}	
	if(![dictionary[kJLXQ_Model_DataSurplusTime] isKindOfClass:[NSNull class]]){
		self.surplusTime = [dictionary[kJLXQ_Model_DataSurplusTime] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataTaketype] isKindOfClass:[NSNull class]]){
		self.taketype = [dictionary[kJLXQ_Model_DataTaketype] integerValue];
	}

	if(![dictionary[kJLXQ_Model_DataVideo] isKindOfClass:[NSNull class]]){
		self.video = dictionary[kJLXQ_Model_DataVideo];
	}	
	return self;
}
@end
