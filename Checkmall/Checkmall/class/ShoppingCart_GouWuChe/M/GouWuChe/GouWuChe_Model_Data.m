//
//	GouWuChe_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GouWuChe_Model_Data.h"

NSString *const kGouWuChe_Model_DataArrivalTime = @"arrival_time";
NSString *const kGouWuChe_Model_DataGoodsId = @"goods_id";
NSString *const kGouWuChe_Model_DataIdField = @"id";
NSString *const kGouWuChe_Model_DataImage = @"image";
NSString *const kGouWuChe_Model_DataMprice = @"mprice";
NSString *const kGouWuChe_Model_DataNum = @"num";
NSString *const kGouWuChe_Model_DataPrice = @"price";
NSString *const kGouWuChe_Model_DataSelected = @"selected";
NSString *const kGouWuChe_Model_DataTitle = @"title";

@interface GouWuChe_Model_Data ()
@end
@implementation GouWuChe_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGouWuChe_Model_DataArrivalTime] isKindOfClass:[NSNull class]]){
		self.arrivalTime = dictionary[kGouWuChe_Model_DataArrivalTime];
	}	
	if(![dictionary[kGouWuChe_Model_DataGoodsId] isKindOfClass:[NSNull class]]){
		self.goodsId = [dictionary[kGouWuChe_Model_DataGoodsId] integerValue];
	}

	if(![dictionary[kGouWuChe_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kGouWuChe_Model_DataIdField] integerValue];
	}

	if(![dictionary[kGouWuChe_Model_DataImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kGouWuChe_Model_DataImage];
	}	
	if(![dictionary[kGouWuChe_Model_DataMprice] isKindOfClass:[NSNull class]]){
		self.mprice = dictionary[kGouWuChe_Model_DataMprice];
	}	
	if(![dictionary[kGouWuChe_Model_DataNum] isKindOfClass:[NSNull class]]){
		self.num = [dictionary[kGouWuChe_Model_DataNum] integerValue];
	}

	if(![dictionary[kGouWuChe_Model_DataPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kGouWuChe_Model_DataPrice];
	}	
	if(![dictionary[kGouWuChe_Model_DataSelected] isKindOfClass:[NSNull class]]){
		self.selected = [dictionary[kGouWuChe_Model_DataSelected] boolValue];
	}

	if(![dictionary[kGouWuChe_Model_DataTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kGouWuChe_Model_DataTitle];
	}	
	return self;
}
@end
