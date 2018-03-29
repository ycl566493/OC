//
//	SouSuo_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SouSuo_Model_Data.h"

NSString *const kSouSuo_Model_DataBuynum = @"buynum";
NSString *const kSouSuo_Model_DataCateid = @"cateid";
NSString *const kSouSuo_Model_DataIdField = @"id";
NSString *const kSouSuo_Model_DataMprice = @"mprice";
NSString *const kSouSuo_Model_DataName = @"name";
NSString *const kSouSuo_Model_DataPath = @"path";
NSString *const kSouSuo_Model_DataPromotion = @"promotion";
NSString *const kSouSuo_Model_DataSprice = @"sprice";
NSString *const kSouSuo_Model_DataVideo = @"video";

@interface SouSuo_Model_Data ()
@end
@implementation SouSuo_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSouSuo_Model_DataBuynum] isKindOfClass:[NSNull class]]){
		self.buynum = dictionary[kSouSuo_Model_DataBuynum];
	}	
	if(![dictionary[kSouSuo_Model_DataCateid] isKindOfClass:[NSNull class]]){
		self.cateid = [dictionary[kSouSuo_Model_DataCateid] integerValue];
	}

	if(![dictionary[kSouSuo_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kSouSuo_Model_DataIdField] integerValue];
	}

	if(![dictionary[kSouSuo_Model_DataMprice] isKindOfClass:[NSNull class]]){
		self.mprice = dictionary[kSouSuo_Model_DataMprice];
	}	
	if(![dictionary[kSouSuo_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kSouSuo_Model_DataName];
	}	
	if(![dictionary[kSouSuo_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kSouSuo_Model_DataPath];
	}	
	if(![dictionary[kSouSuo_Model_DataPromotion] isKindOfClass:[NSNull class]]){
		self.promotion = dictionary[kSouSuo_Model_DataPromotion];
	}	
	if(![dictionary[kSouSuo_Model_DataSprice] isKindOfClass:[NSNull class]]){
		self.sprice = dictionary[kSouSuo_Model_DataSprice];
	}	
	if(![dictionary[kSouSuo_Model_DataVideo] isKindOfClass:[NSNull class]]){
		self.video = [dictionary[kSouSuo_Model_DataVideo] integerValue];
	}

	return self;
}
@end
