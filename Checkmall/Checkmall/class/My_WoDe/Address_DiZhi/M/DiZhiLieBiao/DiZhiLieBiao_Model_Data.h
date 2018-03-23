//
//    DiZhiLieBiao_Model_Data.h
//    Copyright © 2018. All rights reserved.
//

//    Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DiZhiLieBiao_Model_Data : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, assign) NSInteger city;
@property (nonatomic, strong) NSString * geoCode;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger isfirst;
@property (nonatomic, assign) NSInteger merchantId;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, assign) NSInteger province;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * addressto;



-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

