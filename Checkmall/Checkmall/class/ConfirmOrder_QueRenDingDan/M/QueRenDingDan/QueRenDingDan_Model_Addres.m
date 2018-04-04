//
//	QueRenDingDan_Model_Addres.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QueRenDingDan_Model_Addres.h"

NSString *const kQueRenDingDan_Model_AddresAddress = @"address";
NSString *const kQueRenDingDan_Model_AddresAddressto = @"addressto";
NSString *const kQueRenDingDan_Model_AddresCity = @"city";
NSString *const kQueRenDingDan_Model_AddresCreated = @"created";
NSString *const kQueRenDingDan_Model_AddresGeoCode = @"geo_code";
NSString *const kQueRenDingDan_Model_AddresIdField = @"id";
NSString *const kQueRenDingDan_Model_AddresIsdelete = @"isdelete";
NSString *const kQueRenDingDan_Model_AddresIsfirst = @"isfirst";
NSString *const kQueRenDingDan_Model_AddresMerchantId = @"merchant_id";
NSString *const kQueRenDingDan_Model_AddresOpenid = @"openid";
NSString *const kQueRenDingDan_Model_AddresPhone = @"phone";
NSString *const kQueRenDingDan_Model_AddresProvince = @"province";
NSString *const kQueRenDingDan_Model_AddresStatus = @"status";
NSString *const kQueRenDingDan_Model_AddresUid = @"uid";
NSString *const kQueRenDingDan_Model_AddresUsername = @"username";
NSString *const kQueRenDingDan_Model_AddresMername = @"mername";

@interface QueRenDingDan_Model_Addres ()
@end
@implementation QueRenDingDan_Model_Addres

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    if(![dictionary[kQueRenDingDan_Model_AddresMername] isKindOfClass:[NSNull class]]){
        self.mername = dictionary[kQueRenDingDan_Model_AddresMername];
    }else{
        self.mername = @"";
    }
    
	if(![dictionary[kQueRenDingDan_Model_AddresAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kQueRenDingDan_Model_AddresAddress];
    }else{
        self.address = @"";
    }
    
	if(![dictionary[kQueRenDingDan_Model_AddresAddressto] isKindOfClass:[NSNull class]]){
		self.addressto = dictionary[kQueRenDingDan_Model_AddresAddressto];
    }else{
        self.addressto = @"";
    }
    
	if(![dictionary[kQueRenDingDan_Model_AddresCity] isKindOfClass:[NSNull class]]){
		self.city = [dictionary[kQueRenDingDan_Model_AddresCity] integerValue];
    }

	if(![dictionary[kQueRenDingDan_Model_AddresCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kQueRenDingDan_Model_AddresCreated] integerValue];
    }

	if(![dictionary[kQueRenDingDan_Model_AddresGeoCode] isKindOfClass:[NSNull class]]){
		self.geoCode = dictionary[kQueRenDingDan_Model_AddresGeoCode];
    }else{
        self.geoCode = @"";
    }
    
	if(![dictionary[kQueRenDingDan_Model_AddresIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kQueRenDingDan_Model_AddresIdField] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresIsdelete] isKindOfClass:[NSNull class]]){
		self.isdelete = [dictionary[kQueRenDingDan_Model_AddresIsdelete] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresIsfirst] isKindOfClass:[NSNull class]]){
		self.isfirst = [dictionary[kQueRenDingDan_Model_AddresIsfirst] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresMerchantId] isKindOfClass:[NSNull class]]){
		self.merchantId = [dictionary[kQueRenDingDan_Model_AddresMerchantId] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresOpenid] isKindOfClass:[NSNull class]]){
		self.openid = dictionary[kQueRenDingDan_Model_AddresOpenid];
	}
    
	if(![dictionary[kQueRenDingDan_Model_AddresPhone] isKindOfClass:[NSNull class]]){
		self.phone = dictionary[kQueRenDingDan_Model_AddresPhone];
    }else{
        self.phone  = @"";
    }

	if(![dictionary[kQueRenDingDan_Model_AddresProvince] isKindOfClass:[NSNull class]]){
		self.province = [dictionary[kQueRenDingDan_Model_AddresProvince] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kQueRenDingDan_Model_AddresStatus] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresUid] isKindOfClass:[NSNull class]]){
		self.uid = [dictionary[kQueRenDingDan_Model_AddresUid] integerValue];
	}

	if(![dictionary[kQueRenDingDan_Model_AddresUsername] isKindOfClass:[NSNull class]]){
		self.username = dictionary[kQueRenDingDan_Model_AddresUsername];
    }else{
        self.username = @"";
    }
    
	return self;
}
@end
