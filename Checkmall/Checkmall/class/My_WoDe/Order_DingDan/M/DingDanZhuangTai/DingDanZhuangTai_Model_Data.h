//
//	DingDanZhuangTai_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DingDanZhuangTai_Model_Data : NSObject

@property (nonatomic, strong) NSString * endtime;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) BOOL iscoupon;
@property (nonatomic, strong) NSString * money;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, assign) BOOL sta;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
