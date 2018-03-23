//
//	ShangPin_Model_GroupUserInfo.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShangPin_Model_GroupUserInfo.h"

NSString *const kShangPin_Model_GroupUserInfoArrivalTime = @"arrival_time";
NSString *const kShangPin_Model_GroupUserInfoBulkGroupId = @"bulk_group_id";
NSString *const kShangPin_Model_GroupUserInfoBulkImageUrl = @"bulk_image_url";
NSString *const kShangPin_Model_GroupUserInfoBulkNickname = @"bulk_nickname";
NSString *const kShangPin_Model_GroupUserInfoEndtime = @"endtime";
NSString *const kShangPin_Model_GroupUserInfoOrderTime = @"order_time";
NSString *const kShangPin_Model_GroupUserInfoStarttime = @"starttime";
NSString *const kShangPin_Model_GroupUserInfoSurplusNum = @"surplus_num";
NSString *const kShangPin_Model_GroupUserInfoSurplusTime = @"surplus_time";

@interface ShangPin_Model_GroupUserInfo ()
@end
@implementation ShangPin_Model_GroupUserInfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShangPin_Model_GroupUserInfoArrivalTime] isKindOfClass:[NSNull class]]){
		self.arrivalTime = [dictionary[kShangPin_Model_GroupUserInfoArrivalTime] integerValue];
	}

	if(![dictionary[kShangPin_Model_GroupUserInfoBulkGroupId] isKindOfClass:[NSNull class]]){
		self.bulkGroupId = [dictionary[kShangPin_Model_GroupUserInfoBulkGroupId] integerValue];
	}

	if(![dictionary[kShangPin_Model_GroupUserInfoBulkImageUrl] isKindOfClass:[NSNull class]]){
		self.bulkImageUrl = dictionary[kShangPin_Model_GroupUserInfoBulkImageUrl];
	}	
	if(![dictionary[kShangPin_Model_GroupUserInfoBulkNickname] isKindOfClass:[NSNull class]]){
		self.bulkNickname = dictionary[kShangPin_Model_GroupUserInfoBulkNickname];
	}	
	if(![dictionary[kShangPin_Model_GroupUserInfoEndtime] isKindOfClass:[NSNull class]]){
		self.endtime = [dictionary[kShangPin_Model_GroupUserInfoEndtime] integerValue];
	}

	if(![dictionary[kShangPin_Model_GroupUserInfoOrderTime] isKindOfClass:[NSNull class]]){
		self.orderTime = dictionary[kShangPin_Model_GroupUserInfoOrderTime];
	}	
	if(![dictionary[kShangPin_Model_GroupUserInfoStarttime] isKindOfClass:[NSNull class]]){
		self.starttime = [dictionary[kShangPin_Model_GroupUserInfoStarttime] integerValue];
	}

	if(![dictionary[kShangPin_Model_GroupUserInfoSurplusNum] isKindOfClass:[NSNull class]]){
		self.surplusNum = [dictionary[kShangPin_Model_GroupUserInfoSurplusNum] integerValue];
	}

	if(![dictionary[kShangPin_Model_GroupUserInfoSurplusTime] isKindOfClass:[NSNull class]]){
		self.surplusTime = [dictionary[kShangPin_Model_GroupUserInfoSurplusTime] integerValue];
	}

	return self;
}
@end
