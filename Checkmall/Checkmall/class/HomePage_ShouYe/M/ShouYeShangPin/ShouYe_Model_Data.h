//
//	ShouYe_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface ShouYe_Model_Data : NSObject

@property (nonatomic, assign) NSInteger productCategory;
@property (nonatomic, strong) NSString * productDesc;
@property (nonatomic, assign) NSInteger productId;
@property (nonatomic, strong) NSString * productImage;
@property (nonatomic, strong) NSString * productMarketPrice;
@property (nonatomic, strong) NSString * productName;
@property (nonatomic, strong) NSString * productNum;
@property (nonatomic, strong) NSString * productPrice;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
