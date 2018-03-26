//
//	GouWuChe_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface GouWuChe_Model_Data : NSObject

@property (nonatomic, strong) NSString * arrivalTime;
@property (nonatomic, assign) NSInteger goodsId;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * mprice;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) BOOL is_XZ;//选中


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
