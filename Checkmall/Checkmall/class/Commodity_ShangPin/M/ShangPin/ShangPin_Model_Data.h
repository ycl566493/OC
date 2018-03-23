//
//	ShangPin_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "ShangPin_Model_Comment.h"
#import "ShangPin_Model_GroupUserInfo.h"
#import "ShangPin_Model_SlidsUrlList.h"

@interface ShangPin_Model_Data : NSObject

@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger buyNum;
@property (nonatomic, strong) ShangPin_Model_Comment * comment;
@property (nonatomic, assign) NSInteger groupSum;
@property (nonatomic, strong) NSArray * groupUserInfo;
@property (nonatomic, strong) NSString * productArrivalTime;
@property (nonatomic, assign) NSInteger productCategory;
@property (nonatomic, strong) NSString * productContent;
@property (nonatomic, strong) NSString * productDesc;
@property (nonatomic, assign) NSInteger productId;
@property (nonatomic, strong) NSString * productImage;
@property (nonatomic, strong) NSString * productMarketPrice;
@property (nonatomic, strong) NSString * productName;
@property (nonatomic, assign) NSInteger productNeedNumber;
@property (nonatomic, assign) NSInteger productNum;
@property (nonatomic, strong) NSString * productPrice;
@property (nonatomic, strong) NSString * productSprice;
@property (nonatomic, strong) NSArray * slidsUrlList;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, assign) NSInteger surplusTime;
@property (nonatomic, strong) NSString * taketype;
@property (nonatomic, strong) NSString * video;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
