//
//	PTZFCG_Model_Good.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PTZFCG_Model_Good : NSObject

@property (nonatomic, assign) NSInteger arrivalTime;
@property (nonatomic, strong) NSString * couponAmount;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, assign) CGFloat sprice;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
