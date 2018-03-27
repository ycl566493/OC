//
//	QueRenDingDan_Model_Arr.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface QueRenDingDan_Model_Arr : NSObject

@property (nonatomic, assign) NSInteger brandId;
@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, assign) NSInteger courierfees;
@property (nonatomic, assign) NSInteger endTime;
@property (nonatomic, assign) NSInteger freeNum;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, strong) NSString * groupPrice;
@property (nonatomic, strong) NSString * number;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, assign) NSInteger supplier;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSString * mprice;
@property (nonatomic, assign) NSInteger arrival_time;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
