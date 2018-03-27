//
//	GuangGao_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GuangGao_Model_Data.h"

NSString *const kGuangGao_Model_DataAdverUrl = @"adver_url";
NSString *const kGuangGao_Model_DataGoodsId = @"goods_id";
NSString *const kGuangGao_Model_DataIstype = @"istype";

@interface GuangGao_Model_Data ()
@end
@implementation GuangGao_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGuangGao_Model_DataAdverUrl] isKindOfClass:[NSNull class]]){
		self.adverUrl = dictionary[kGuangGao_Model_DataAdverUrl];
	}	
	if(![dictionary[kGuangGao_Model_DataGoodsId] isKindOfClass:[NSNull class]]){
		self.goodsId = [dictionary[kGuangGao_Model_DataGoodsId] integerValue];
	}

	if(![dictionary[kGuangGao_Model_DataIstype] isKindOfClass:[NSNull class]]){
		self.istype = [dictionary[kGuangGao_Model_DataIstype] integerValue];
	}

	return self;
}
@end
