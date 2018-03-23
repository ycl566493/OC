//
//    DiZhiLieBiao_Model_Data.m
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DiZhiLieBiao_Model_Data.h"

NSString *const kDiZhiLieBiao_Model_DataAddress = @"address";
NSString *const kDiZhiLieBiao_Model_DataCity = @"city";
NSString *const kDiZhiLieBiao_Model_DataGeoCode = @"geo_code";
NSString *const kDiZhiLieBiao_Model_DataIdField = @"id";
NSString *const kDiZhiLieBiao_Model_DataIsfirst = @"isfirst";
NSString *const kDiZhiLieBiao_Model_DataMerchantId = @"merchant_id";
NSString *const kDiZhiLieBiao_Model_DataName = @"name";
NSString *const kDiZhiLieBiao_Model_DataPhone = @"phone";
NSString *const kDiZhiLieBiao_Model_DataProvince = @"province";
NSString *const kDiZhiLieBiao_Model_DataUsername = @"username";
NSString *const kDiZhiLieBiao_Model_DataAddressto = @"addressto";

@interface DiZhiLieBiao_Model_Data ()
@end
@implementation DiZhiLieBiao_Model_Data


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kDiZhiLieBiao_Model_DataAddressto] isKindOfClass:[NSNull class]]){
        self.addressto = dictionary[kDiZhiLieBiao_Model_DataAddressto];
    }
    if(![dictionary[kDiZhiLieBiao_Model_DataAddress] isKindOfClass:[NSNull class]]){
        self.address = dictionary[kDiZhiLieBiao_Model_DataAddress];
    }
    if(![dictionary[kDiZhiLieBiao_Model_DataCity] isKindOfClass:[NSNull class]]){
        self.city = [dictionary[kDiZhiLieBiao_Model_DataCity] integerValue];
    }
    
    if(![dictionary[kDiZhiLieBiao_Model_DataGeoCode] isKindOfClass:[NSNull class]]){
        self.geoCode = dictionary[kDiZhiLieBiao_Model_DataGeoCode];
    }
    if(![dictionary[kDiZhiLieBiao_Model_DataIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kDiZhiLieBiao_Model_DataIdField] integerValue];
    }
    
    if(![dictionary[kDiZhiLieBiao_Model_DataIsfirst] isKindOfClass:[NSNull class]]){
        self.isfirst = [dictionary[kDiZhiLieBiao_Model_DataIsfirst] integerValue];
    }
    
    if(![dictionary[kDiZhiLieBiao_Model_DataMerchantId] isKindOfClass:[NSNull class]]){
        self.merchantId = [dictionary[kDiZhiLieBiao_Model_DataMerchantId] integerValue];
    }
    
    if(![dictionary[kDiZhiLieBiao_Model_DataName] isKindOfClass:[NSNull class]]){
        self.name = dictionary[kDiZhiLieBiao_Model_DataName];
    }
    if(![dictionary[kDiZhiLieBiao_Model_DataPhone] isKindOfClass:[NSNull class]]){
        self.phone = dictionary[kDiZhiLieBiao_Model_DataPhone];
    }
    if(![dictionary[kDiZhiLieBiao_Model_DataProvince] isKindOfClass:[NSNull class]]){
        self.province = [dictionary[kDiZhiLieBiao_Model_DataProvince] integerValue];
    }
    
    if(![dictionary[kDiZhiLieBiao_Model_DataUsername] isKindOfClass:[NSNull class]]){
        self.username = dictionary[kDiZhiLieBiao_Model_DataUsername];
    }
    return self;
}
@end

