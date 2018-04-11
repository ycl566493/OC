//
//	JLLB_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface JLLB_Model_Data : NSObject

@property (nonatomic, strong) NSString * allprice;
@property (nonatomic, assign) NSInteger arrivaltime;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, assign) NSInteger endtime;
@property (nonatomic, strong) NSArray * goodsinfo;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * imgpath;
@property (nonatomic, assign) NSInteger isSet;
@property (nonatomic, assign) NSInteger isdel;
@property (nonatomic, assign) NSInteger sendnumber;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger weight;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
