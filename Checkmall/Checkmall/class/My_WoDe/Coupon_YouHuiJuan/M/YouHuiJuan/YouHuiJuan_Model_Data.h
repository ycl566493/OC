//
//	YouHuiJuan_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface YouHuiJuan_Model_Data : NSObject

@property (nonatomic, strong) NSString * endtime;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger needprice;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * goodsid;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
