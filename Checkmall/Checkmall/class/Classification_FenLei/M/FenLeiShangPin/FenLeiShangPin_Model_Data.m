//
//	FenLeiShangPin_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FenLeiShangPin_Model_Data.h"

NSString *const kFenLeiShangPin_Model_DataBuynum = @"buynum";
NSString *const kFenLeiShangPin_Model_DataCateid = @"cateid";
NSString *const kFenLeiShangPin_Model_DataDesc = @"desc";
NSString *const kFenLeiShangPin_Model_DataGroupPrice = @"group_price";
NSString *const kFenLeiShangPin_Model_DataIdField = @"id";
NSString *const kFenLeiShangPin_Model_DataImage = @"image";
NSString *const kFenLeiShangPin_Model_DataMarketPrice = @"market_price";
NSString *const kFenLeiShangPin_Model_DataName = @"name";

@interface FenLeiShangPin_Model_Data ()
@end
@implementation FenLeiShangPin_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kFenLeiShangPin_Model_DataBuynum] isKindOfClass:[NSNull class]]){
		self.buynum = dictionary[kFenLeiShangPin_Model_DataBuynum];
	}	
	if(![dictionary[kFenLeiShangPin_Model_DataCateid] isKindOfClass:[NSNull class]]){
		self.cateid = [dictionary[kFenLeiShangPin_Model_DataCateid] integerValue];
	}

	if(![dictionary[kFenLeiShangPin_Model_DataDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kFenLeiShangPin_Model_DataDesc];
	}	
	if(![dictionary[kFenLeiShangPin_Model_DataGroupPrice] isKindOfClass:[NSNull class]]){
		self.groupPrice = dictionary[kFenLeiShangPin_Model_DataGroupPrice];
	}	
	if(![dictionary[kFenLeiShangPin_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kFenLeiShangPin_Model_DataIdField] integerValue];
	}

	if(![dictionary[kFenLeiShangPin_Model_DataImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kFenLeiShangPin_Model_DataImage];
	}	
	if(![dictionary[kFenLeiShangPin_Model_DataMarketPrice] isKindOfClass:[NSNull class]]){
		self.marketPrice = dictionary[kFenLeiShangPin_Model_DataMarketPrice];
	}	
	if(![dictionary[kFenLeiShangPin_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kFenLeiShangPin_Model_DataName];
	}	
	return self;
}
@end
