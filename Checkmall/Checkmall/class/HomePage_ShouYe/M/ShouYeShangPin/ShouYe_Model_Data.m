//
//	ShouYe_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShouYe_Model_Data.h"

NSString *const kShouYe_Model_DataProductCategory = @"product_category";
NSString *const kShouYe_Model_DataProductDesc = @"product_desc";
NSString *const kShouYe_Model_DataProductId = @"product_id";
NSString *const kShouYe_Model_DataProductImage = @"product_image";
NSString *const kShouYe_Model_DataProductMarketPrice = @"product_market_price";
NSString *const kShouYe_Model_DataProductName = @"product_name";
NSString *const kShouYe_Model_DataProductNum = @"product_num";
NSString *const kShouYe_Model_DataProductPrice = @"product_price";
NSString *const kShouYe_Model_DataMprice = @"mprice";

@interface ShouYe_Model_Data ()
@end
@implementation ShouYe_Model_Data



-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if(![dictionary[kShouYe_Model_DataMprice] isKindOfClass:[NSNull class]]){
        self.mprice = dictionary[kShouYe_Model_DataMprice];
    }
	if(![dictionary[kShouYe_Model_DataProductCategory] isKindOfClass:[NSNull class]]){
		self.productCategory = [dictionary[kShouYe_Model_DataProductCategory] integerValue];
	}

	if(![dictionary[kShouYe_Model_DataProductDesc] isKindOfClass:[NSNull class]]){
		self.productDesc = dictionary[kShouYe_Model_DataProductDesc];
	}	
	if(![dictionary[kShouYe_Model_DataProductId] isKindOfClass:[NSNull class]]){
		self.productId = [dictionary[kShouYe_Model_DataProductId] integerValue];
	}

	if(![dictionary[kShouYe_Model_DataProductImage] isKindOfClass:[NSNull class]]){
		self.productImage = dictionary[kShouYe_Model_DataProductImage];
	}	
	if(![dictionary[kShouYe_Model_DataProductMarketPrice] isKindOfClass:[NSNull class]]){
		self.productMarketPrice = dictionary[kShouYe_Model_DataProductMarketPrice];
	}	
	if(![dictionary[kShouYe_Model_DataProductName] isKindOfClass:[NSNull class]]){
		self.productName = dictionary[kShouYe_Model_DataProductName];
	}	
	if(![dictionary[kShouYe_Model_DataProductNum] isKindOfClass:[NSNull class]]){
		self.productNum = dictionary[kShouYe_Model_DataProductNum];
	}	
	if(![dictionary[kShouYe_Model_DataProductPrice] isKindOfClass:[NSNull class]]){
		self.productPrice = dictionary[kShouYe_Model_DataProductPrice];
	}	
	return self;
}
@end
