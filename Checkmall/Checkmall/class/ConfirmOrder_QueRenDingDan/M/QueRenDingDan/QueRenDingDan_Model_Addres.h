//
//	QueRenDingDan_Model_Addres.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface QueRenDingDan_Model_Addres : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * addressto;
@property (nonatomic, assign) NSInteger city;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, strong) NSString * geoCode;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger isdelete;
@property (nonatomic, assign) NSInteger isfirst;
@property (nonatomic, assign) NSInteger merchantId;
@property (nonatomic, strong) NSString * openid;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, assign) NSInteger province;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * mername;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
