//
//	WeiXinZhiFu_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "WeiXinZhiFu_Model_Data.h"

NSString *const kWeiXinZhiFu_Model_DataAppid = @"appid";
NSString *const kWeiXinZhiFu_Model_DataNoncestr = @"noncestr";
NSString *const kWeiXinZhiFu_Model_DataPackageField = @"package";
NSString *const kWeiXinZhiFu_Model_DataPartnerid = @"partnerid";
NSString *const kWeiXinZhiFu_Model_DataPrepayid = @"prepayid";
NSString *const kWeiXinZhiFu_Model_DataSign = @"sign";
NSString *const kWeiXinZhiFu_Model_DataTimestamp = @"timestamp";
NSString *const kWeiXinZhiFu_Model_DataOut_trade_no = @"out_trade_no";

@interface WeiXinZhiFu_Model_Data ()
@end
@implementation WeiXinZhiFu_Model_Data

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if(![dictionary[kWeiXinZhiFu_Model_DataOut_trade_no] isKindOfClass:[NSNull class]]){
        self.out_trade_no = dictionary[kWeiXinZhiFu_Model_DataOut_trade_no];
    }
	if(![dictionary[kWeiXinZhiFu_Model_DataAppid] isKindOfClass:[NSNull class]]){
		self.appid = dictionary[kWeiXinZhiFu_Model_DataAppid];
	}	
	if(![dictionary[kWeiXinZhiFu_Model_DataNoncestr] isKindOfClass:[NSNull class]]){
		self.noncestr = dictionary[kWeiXinZhiFu_Model_DataNoncestr];
	}	
	if(![dictionary[kWeiXinZhiFu_Model_DataPackageField] isKindOfClass:[NSNull class]]){
		self.packageField = dictionary[kWeiXinZhiFu_Model_DataPackageField];
	}	
	if(![dictionary[kWeiXinZhiFu_Model_DataPartnerid] isKindOfClass:[NSNull class]]){
		self.partnerid = dictionary[kWeiXinZhiFu_Model_DataPartnerid];
	}	
	if(![dictionary[kWeiXinZhiFu_Model_DataPrepayid] isKindOfClass:[NSNull class]]){
		self.prepayid = dictionary[kWeiXinZhiFu_Model_DataPrepayid];
	}	
	if(![dictionary[kWeiXinZhiFu_Model_DataSign] isKindOfClass:[NSNull class]]){
		self.sign = dictionary[kWeiXinZhiFu_Model_DataSign];
	}	
	if(![dictionary[kWeiXinZhiFu_Model_DataTimestamp] isKindOfClass:[NSNull class]]){
		self.timestamp = [dictionary[kWeiXinZhiFu_Model_DataTimestamp] intValue];
	}

	return self;
}
@end
