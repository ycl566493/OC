//
//	ShangPin_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShangPin_Model_Data.h"

NSString *const kShangPin_Model_DataAmount = @"amount";
NSString *const kShangPin_Model_DataBuyNum = @"buy_num";
NSString *const kShangPin_Model_DataComment = @"comment";
NSString *const kShangPin_Model_DataGroupSum = @"groupSum";
NSString *const kShangPin_Model_DataGroupUserInfo = @"groupUserInfo";
NSString *const kShangPin_Model_DataProductArrivalTime = @"product_arrival_time";
NSString *const kShangPin_Model_DataProductCategory = @"product_category";
NSString *const kShangPin_Model_DataProductContent = @"product_content";
NSString *const kShangPin_Model_DataProductDesc = @"product_desc";
NSString *const kShangPin_Model_DataProductId = @"product_id";
NSString *const kShangPin_Model_DataProductImage = @"product_image";
NSString *const kShangPin_Model_DataProductMarketPrice = @"product_market_price";
NSString *const kShangPin_Model_DataProductName = @"product_name";
NSString *const kShangPin_Model_DataProductNeedNumber = @"product_need_number";
NSString *const kShangPin_Model_DataProductNum = @"product_num";
NSString *const kShangPin_Model_DataProductPrice = @"product_price";
NSString *const kShangPin_Model_DataProductSprice = @"product_sprice";
NSString *const kShangPin_Model_DataSlidsUrlList = @"slids_url_list";
NSString *const kShangPin_Model_DataStock = @"stock";
NSString *const kShangPin_Model_DataSurplusTime = @"surplus_time";
NSString *const kShangPin_Model_DataTaketype = @"taketype";
NSString *const kShangPin_Model_DataVideo = @"video";

@interface ShangPin_Model_Data ()
@end
@implementation ShangPin_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShangPin_Model_DataAmount] isKindOfClass:[NSNull class]]){
		self.amount = [dictionary[kShangPin_Model_DataAmount] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataBuyNum] isKindOfClass:[NSNull class]]){
		self.buyNum = [dictionary[kShangPin_Model_DataBuyNum] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataComment] isKindOfClass:[NSNull class]]){
		self.comment = [[ShangPin_Model_Comment alloc] initWithDictionary:dictionary[kShangPin_Model_DataComment]];
	}

	if(![dictionary[kShangPin_Model_DataGroupSum] isKindOfClass:[NSNull class]]){
		self.groupSum = [dictionary[kShangPin_Model_DataGroupSum] integerValue];
	}

	if(dictionary[kShangPin_Model_DataGroupUserInfo] != nil && [dictionary[kShangPin_Model_DataGroupUserInfo] isKindOfClass:[NSArray class]]){
		NSArray * groupUserInfoDictionaries = dictionary[kShangPin_Model_DataGroupUserInfo];
		NSMutableArray * groupUserInfoItems = [NSMutableArray array];
		for(NSDictionary * groupUserInfoDictionary in groupUserInfoDictionaries){
			ShangPin_Model_GroupUserInfo * groupUserInfoItem = [[ShangPin_Model_GroupUserInfo alloc] initWithDictionary:groupUserInfoDictionary];
			[groupUserInfoItems addObject:groupUserInfoItem];
		}
		self.groupUserInfo = groupUserInfoItems;
	}
	if(![dictionary[kShangPin_Model_DataProductArrivalTime] isKindOfClass:[NSNull class]]){
		self.productArrivalTime = dictionary[kShangPin_Model_DataProductArrivalTime];
	}	
	if(![dictionary[kShangPin_Model_DataProductCategory] isKindOfClass:[NSNull class]]){
		self.productCategory = [dictionary[kShangPin_Model_DataProductCategory] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataProductContent] isKindOfClass:[NSNull class]]){
		self.productContent = dictionary[kShangPin_Model_DataProductContent];
	}	
	if(![dictionary[kShangPin_Model_DataProductDesc] isKindOfClass:[NSNull class]]){
		self.productDesc = dictionary[kShangPin_Model_DataProductDesc];
	}	
	if(![dictionary[kShangPin_Model_DataProductId] isKindOfClass:[NSNull class]]){
		self.productId = [dictionary[kShangPin_Model_DataProductId] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataProductImage] isKindOfClass:[NSNull class]]){
		self.productImage = dictionary[kShangPin_Model_DataProductImage];
	}	
	if(![dictionary[kShangPin_Model_DataProductMarketPrice] isKindOfClass:[NSNull class]]){
		self.productMarketPrice = dictionary[kShangPin_Model_DataProductMarketPrice];
	}	
	if(![dictionary[kShangPin_Model_DataProductName] isKindOfClass:[NSNull class]]){
		self.productName = dictionary[kShangPin_Model_DataProductName];
	}	
	if(![dictionary[kShangPin_Model_DataProductNeedNumber] isKindOfClass:[NSNull class]]){
		self.productNeedNumber = [dictionary[kShangPin_Model_DataProductNeedNumber] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataProductNum] isKindOfClass:[NSNull class]]){
		self.productNum = [dictionary[kShangPin_Model_DataProductNum] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataProductPrice] isKindOfClass:[NSNull class]]){
		self.productPrice = dictionary[kShangPin_Model_DataProductPrice];
	}	
	if(![dictionary[kShangPin_Model_DataProductSprice] isKindOfClass:[NSNull class]]){
		self.productSprice = dictionary[kShangPin_Model_DataProductSprice];
	}	
	if(dictionary[kShangPin_Model_DataSlidsUrlList] != nil && [dictionary[kShangPin_Model_DataSlidsUrlList] isKindOfClass:[NSArray class]]){
		NSArray * slidsUrlListDictionaries = dictionary[kShangPin_Model_DataSlidsUrlList];
		NSMutableArray * slidsUrlListItems = [NSMutableArray array];
		for(NSDictionary * slidsUrlListDictionary in slidsUrlListDictionaries){
			ShangPin_Model_SlidsUrlList * slidsUrlListItem = [[ShangPin_Model_SlidsUrlList alloc] initWithDictionary:slidsUrlListDictionary];
			[slidsUrlListItems addObject:slidsUrlListItem];
		}
		self.slidsUrlList = slidsUrlListItems;
	}
	if(![dictionary[kShangPin_Model_DataStock] isKindOfClass:[NSNull class]]){
		self.stock = [dictionary[kShangPin_Model_DataStock] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataSurplusTime] isKindOfClass:[NSNull class]]){
		self.surplusTime = [dictionary[kShangPin_Model_DataSurplusTime] integerValue];
	}

	if(![dictionary[kShangPin_Model_DataTaketype] isKindOfClass:[NSNull class]]){
		self.taketype = dictionary[kShangPin_Model_DataTaketype];
	}	
	if(![dictionary[kShangPin_Model_DataVideo] isKindOfClass:[NSNull class]]){
		self.video = dictionary[kShangPin_Model_DataVideo];
	}	
	return self;
}
@end
