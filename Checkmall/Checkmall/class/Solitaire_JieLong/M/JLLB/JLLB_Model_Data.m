//
//	JLLB_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLLB_Model_Data.h"

NSString *const kJLLB_Model_DataAllprice = @"allprice";
NSString *const kJLLB_Model_DataArrivaltime = @"arrivaltime";
NSString *const kJLLB_Model_DataCreated = @"created";
NSString *const kJLLB_Model_DataDesc = @"desc";
NSString *const kJLLB_Model_DataEndtime = @"endtime";
NSString *const kJLLB_Model_DataGoodsinfo = @"goodsinfo";
NSString *const kJLLB_Model_DataIdField = @"id";
NSString *const kJLLB_Model_DataImgpath = @"imgpath";
NSString *const kJLLB_Model_DataIsSet = @"is_set";
NSString *const kJLLB_Model_DataIsdel = @"isdel";
NSString *const kJLLB_Model_DataSendnumber = @"sendnumber";
NSString *const kJLLB_Model_DataTitle = @"title";
NSString *const kJLLB_Model_DataWeight = @"weight";

@interface JLLB_Model_Data ()
@end
@implementation JLLB_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLLB_Model_DataAllprice] isKindOfClass:[NSNull class]]){
		self.allprice = dictionary[kJLLB_Model_DataAllprice];
	}	
	if(![dictionary[kJLLB_Model_DataArrivaltime] isKindOfClass:[NSNull class]]){
		self.arrivaltime = [dictionary[kJLLB_Model_DataArrivaltime] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kJLLB_Model_DataCreated] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kJLLB_Model_DataDesc];
	}	
	if(![dictionary[kJLLB_Model_DataEndtime] isKindOfClass:[NSNull class]]){
		self.endtime = [dictionary[kJLLB_Model_DataEndtime] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataGoodsinfo] isKindOfClass:[NSNull class]]){
		self.goodsinfo = dictionary[kJLLB_Model_DataGoodsinfo];
	}	
	if(![dictionary[kJLLB_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kJLLB_Model_DataIdField] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataImgpath] isKindOfClass:[NSNull class]]){
		self.imgpath = dictionary[kJLLB_Model_DataImgpath];
	}	
	if(![dictionary[kJLLB_Model_DataIsSet] isKindOfClass:[NSNull class]]){
		self.isSet = [dictionary[kJLLB_Model_DataIsSet] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataIsdel] isKindOfClass:[NSNull class]]){
		self.isdel = [dictionary[kJLLB_Model_DataIsdel] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataSendnumber] isKindOfClass:[NSNull class]]){
		self.sendnumber = [dictionary[kJLLB_Model_DataSendnumber] integerValue];
	}

	if(![dictionary[kJLLB_Model_DataTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kJLLB_Model_DataTitle];
	}	
	if(![dictionary[kJLLB_Model_DataWeight] isKindOfClass:[NSNull class]]){
		self.weight = [dictionary[kJLLB_Model_DataWeight] integerValue];
	}

	return self;
}
@end
