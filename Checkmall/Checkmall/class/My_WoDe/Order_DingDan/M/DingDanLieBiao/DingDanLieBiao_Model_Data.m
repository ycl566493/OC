//
//	DingDanLieBiao_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DingDanLieBiao_Model_Data.h"

NSString *const kDingDanLieBiao_Model_DataAllPayCount = @"all_pay_count";
NSString *const kDingDanLieBiao_Model_DataArrivalTime = @"arrival_time";
NSString *const kDingDanLieBiao_Model_DataComCount = @"com_count";
NSString *const kDingDanLieBiao_Model_DataCourierfees = @"courierfees";
NSString *const kDingDanLieBiao_Model_DataCreated = @"created";
NSString *const kDingDanLieBiao_Model_DataGid = @"gid";
NSString *const kDingDanLieBiao_Model_DataGoodsName = @"goods_name";
NSString *const kDingDanLieBiao_Model_DataGroupPeople = @"group_people";
NSString *const kDingDanLieBiao_Model_DataGroupPrice = @"group_price";
NSString *const kDingDanLieBiao_Model_DataMerchantId = @"merchant_id";
NSString *const kDingDanLieBiao_Model_DataMprice = @"mprice";
NSString *const kDingDanLieBiao_Model_DataNumber = @"number";
NSString *const kDingDanLieBiao_Model_DataOrderSn = @"order_sn";
NSString *const kDingDanLieBiao_Model_DataOrderStatus = @"order_status";
NSString *const kDingDanLieBiao_Model_DataOrderType = @"order_type";
NSString *const kDingDanLieBiao_Model_DataPaidAmount = @"paid_amount";
NSString *const kDingDanLieBiao_Model_DataPrice = @"price";
NSString *const kDingDanLieBiao_Model_DataSprice = @"sprice";
NSString *const kDingDanLieBiao_Model_DataPath = @"path";
NSString *const kDingDanLieBiao_Model_DataOg_status = @"og_status";
NSString *const kDingDanLieBiao_Model_Datagroup_type = @"group_type";

@interface DingDanLieBiao_Model_Data ()
@end
@implementation DingDanLieBiao_Model_Data

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if(![dictionary[kDingDanLieBiao_Model_Datagroup_type] isKindOfClass:[NSNull class]]){
        self.group_type = [dictionary[kDingDanLieBiao_Model_Datagroup_type] integerValue];
    }
    if(![dictionary[kDingDanLieBiao_Model_DataOg_status] isKindOfClass:[NSNull class]]){
        self.og_status = [dictionary[kDingDanLieBiao_Model_DataOg_status] integerValue];
    }
	if(![dictionary[kDingDanLieBiao_Model_DataAllPayCount] isKindOfClass:[NSNull class]]){
		self.allPayCount = dictionary[kDingDanLieBiao_Model_DataAllPayCount];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataArrivalTime] isKindOfClass:[NSNull class]]){
		self.arrivalTime = [dictionary[kDingDanLieBiao_Model_DataArrivalTime] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataComCount] isKindOfClass:[NSNull class]]){
		self.comCount = [dictionary[kDingDanLieBiao_Model_DataComCount] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataCourierfees] isKindOfClass:[NSNull class]]){
		self.courierfees = [dictionary[kDingDanLieBiao_Model_DataCourierfees] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataCreated] isKindOfClass:[NSNull class]]){
		self.created = dictionary[kDingDanLieBiao_Model_DataCreated];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataGid] isKindOfClass:[NSNull class]]){
		self.gid = [dictionary[kDingDanLieBiao_Model_DataGid] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataGoodsName] isKindOfClass:[NSNull class]]){
		self.goodsName = dictionary[kDingDanLieBiao_Model_DataGoodsName];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataGroupPeople] isKindOfClass:[NSNull class]]){
		self.groupPeople = [dictionary[kDingDanLieBiao_Model_DataGroupPeople] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataGroupPrice] isKindOfClass:[NSNull class]]){
		self.groupPrice = dictionary[kDingDanLieBiao_Model_DataGroupPrice];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataMerchantId] isKindOfClass:[NSNull class]]){
		self.merchantId = [dictionary[kDingDanLieBiao_Model_DataMerchantId] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataMprice] isKindOfClass:[NSNull class]]){
		self.mprice = dictionary[kDingDanLieBiao_Model_DataMprice];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataNumber] isKindOfClass:[NSNull class]]){
		self.number = [dictionary[kDingDanLieBiao_Model_DataNumber] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataOrderSn] isKindOfClass:[NSNull class]]){
		self.orderSn = dictionary[kDingDanLieBiao_Model_DataOrderSn];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataOrderStatus] isKindOfClass:[NSNull class]]){
		self.orderStatus = dictionary[kDingDanLieBiao_Model_DataOrderStatus];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataOrderType] isKindOfClass:[NSNull class]]){
		self.orderType = [dictionary[kDingDanLieBiao_Model_DataOrderType] integerValue];
	}

	if(![dictionary[kDingDanLieBiao_Model_DataPaidAmount] isKindOfClass:[NSNull class]]){
		self.paidAmount = dictionary[kDingDanLieBiao_Model_DataPaidAmount];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kDingDanLieBiao_Model_DataPrice];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataSprice] isKindOfClass:[NSNull class]]){
		self.sprice = dictionary[kDingDanLieBiao_Model_DataSprice];
	}	
	if(![dictionary[kDingDanLieBiao_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kDingDanLieBiao_Model_DataPath];
	}	
	return self;
}
@end
