//
//	JLXQ_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "JLXQ_Model_Buyuser.h"
#import "ShangPin_Model_Comment.h"
#import "JLXQ_Model_Rule.h"

@interface JLXQ_Model_Data : NSObject

@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger arrivaltime;
@property (nonatomic, assign) NSInteger buynum;
@property (nonatomic, strong) NSArray * buyuser;
@property (nonatomic, strong) ShangPin_Model_Comment * comment;
@property (nonatomic, strong) NSString * details;
@property (nonatomic, assign) NSInteger goodsid;
@property (nonatomic, strong) NSString * mprice;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSArray * path;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * promotion;
@property (nonatomic, strong) NSArray * rule;
@property (nonatomic, assign) NSInteger sid;
@property (nonatomic, strong) NSString * slidshow;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, strong) NSString * sumnum;
@property (nonatomic, assign) NSInteger surplusTime;
@property (nonatomic, assign) NSInteger taketype;
@property (nonatomic, strong) NSString * video;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
