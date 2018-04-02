//
//	DingDanLieBiao_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DingDanLieBiao_Model_Data : NSObject

@property (nonatomic, strong) NSString * allPayCount;
@property (nonatomic, assign) NSInteger arrivalTime;
@property (nonatomic, assign) NSInteger comCount;
@property (nonatomic, assign) NSInteger courierfees;
@property (nonatomic, strong) NSString * created;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, assign) NSInteger groupPeople;
@property (nonatomic, strong) NSString * groupPrice;
@property (nonatomic, assign) NSInteger merchantId;
@property (nonatomic, strong) NSString * mprice;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSString * orderSn;
@property (nonatomic, strong) NSString * orderStatus;
@property (nonatomic, assign) NSInteger orderType;
@property (nonatomic, strong) NSString * paidAmount;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * sprice;
@property (nonatomic, strong) NSString * path;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
