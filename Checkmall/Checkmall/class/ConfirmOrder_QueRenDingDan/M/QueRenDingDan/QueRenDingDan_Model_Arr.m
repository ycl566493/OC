//
//	QueRenDingDan_Model_Arr.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QueRenDingDan_Model_Arr.h"

NSString *const kQueRenDingDan_Model_ArrBrandId = @"brand_id";
NSString *const kQueRenDingDan_Model_ArrCateId = @"cate_id";
NSString *const kQueRenDingDan_Model_ArrCourierfees = @"courierfees";
NSString *const kQueRenDingDan_Model_ArrEndTime = @"end_time";
NSString *const kQueRenDingDan_Model_ArrFreeNum = @"free_num";
NSString *const kQueRenDingDan_Model_ArrGid = @"gid";
NSString *const kQueRenDingDan_Model_ArrGoodsName = @"goods_name";
NSString *const kQueRenDingDan_Model_ArrGroupPrice = @"group_price";
NSString *const kQueRenDingDan_Model_ArrNumber = @"number";
NSString *const kQueRenDingDan_Model_ArrPrice = @"price";
NSString *const kQueRenDingDan_Model_ArrSupplier = @"supplier";
NSString *const kQueRenDingDan_Model_ArrUrl = @"url";
NSString *const kQueRenDingDan_Model_ArrMprice = @"mprice";
NSString *const kQueRenDingDan_Model_ArrArrival_time = @"arrival_time";
NSString *const kQueRenDingDan_Model_ArrG_price = @"g_price";

@interface QueRenDingDan_Model_Arr ()
@end
@implementation QueRenDingDan_Model_Arr

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if(![dictionary[kQueRenDingDan_Model_ArrG_price] isKindOfClass:[NSNull class]]){
        self.g_price = dictionary[kQueRenDingDan_Model_ArrG_price];
    }
    
    if(![dictionary[kQueRenDingDan_Model_ArrArrival_time] isKindOfClass:[NSNull class]]){
        self.arrival_time = [dictionary[kQueRenDingDan_Model_ArrArrival_time] integerValue];
    }
    
    if(![dictionary[kQueRenDingDan_Model_ArrMprice] isKindOfClass:[NSNull class]]){
        self.mprice = dictionary[kQueRenDingDan_Model_ArrMprice];
    }
    
	if(![dictionary[kQueRenDingDan_Model_ArrBrandId] isKindOfClass:[NSNull class]]){
		self.brandId = [dictionary[kQueRenDingDan_Model_ArrBrandId] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrCateId] isKindOfClass:[NSNull class]]){
		self.cateId = [dictionary[kQueRenDingDan_Model_ArrCateId] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrCourierfees] isKindOfClass:[NSNull class]]){
		self.courierfees = [dictionary[kQueRenDingDan_Model_ArrCourierfees] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrEndTime] isKindOfClass:[NSNull class]]){
		self.endTime = [dictionary[kQueRenDingDan_Model_ArrEndTime] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrFreeNum] isKindOfClass:[NSNull class]]){
		self.freeNum = [dictionary[kQueRenDingDan_Model_ArrFreeNum] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrGid] isKindOfClass:[NSNull class]]){
		self.gid = [dictionary[kQueRenDingDan_Model_ArrGid] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrGoodsName] isKindOfClass:[NSNull class]]){
		self.goodsName = dictionary[kQueRenDingDan_Model_ArrGoodsName];
	}	
	if(![dictionary[kQueRenDingDan_Model_ArrGroupPrice] isKindOfClass:[NSNull class]]){
		self.groupPrice = dictionary[kQueRenDingDan_Model_ArrGroupPrice];
	}	
	if(![dictionary[kQueRenDingDan_Model_ArrNumber] isKindOfClass:[NSNull class]]){
		self.number = dictionary[kQueRenDingDan_Model_ArrNumber];
	}	
	if(![dictionary[kQueRenDingDan_Model_ArrPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kQueRenDingDan_Model_ArrPrice];
	}	
	if(![dictionary[kQueRenDingDan_Model_ArrSupplier] isKindOfClass:[NSNull class]]){
		self.supplier = [dictionary[kQueRenDingDan_Model_ArrSupplier] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_ArrUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kQueRenDingDan_Model_ArrUrl];
	}	
	return self;
}
@end
