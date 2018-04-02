//
//	DingDanZhuangTai_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DingDanZhuangTai_Model_Data.h"

NSString *const kDingDanZhuangTai_Model_DataEndtime = @"endtime";
NSString *const kDingDanZhuangTai_Model_DataIdField = @"id";
NSString *const kDingDanZhuangTai_Model_DataIscoupon = @"iscoupon";
NSString *const kDingDanZhuangTai_Model_DataMoney = @"money";
NSString *const kDingDanZhuangTai_Model_DataName = @"name";
NSString *const kDingDanZhuangTai_Model_DataPath = @"path";
NSString *const kDingDanZhuangTai_Model_DataSta = @"sta";

@interface DingDanZhuangTai_Model_Data ()
@end
@implementation DingDanZhuangTai_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDingDanZhuangTai_Model_DataEndtime] isKindOfClass:[NSNull class]]){
		self.endtime = dictionary[kDingDanZhuangTai_Model_DataEndtime];
	}	
	if(![dictionary[kDingDanZhuangTai_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kDingDanZhuangTai_Model_DataIdField] integerValue];
	}

	if(![dictionary[kDingDanZhuangTai_Model_DataIscoupon] isKindOfClass:[NSNull class]]){
		self.iscoupon = [dictionary[kDingDanZhuangTai_Model_DataIscoupon] boolValue];
	}

	if(![dictionary[kDingDanZhuangTai_Model_DataMoney] isKindOfClass:[NSNull class]]){
		self.money = dictionary[kDingDanZhuangTai_Model_DataMoney];
	}	
	if(![dictionary[kDingDanZhuangTai_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kDingDanZhuangTai_Model_DataName];
	}	
	if(![dictionary[kDingDanZhuangTai_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kDingDanZhuangTai_Model_DataPath];
	}	
	if(![dictionary[kDingDanZhuangTai_Model_DataSta] isKindOfClass:[NSNull class]]){
		self.sta = [dictionary[kDingDanZhuangTai_Model_DataSta] boolValue];
	}

	return self;
}
@end
