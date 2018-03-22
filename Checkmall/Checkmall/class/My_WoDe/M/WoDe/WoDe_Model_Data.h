//
//	WoDe_Model_Data.h
 on 22/3/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WoDe_Model_Data : NSObject

@property (nonatomic, assign) NSInteger coupon;
@property (nonatomic, strong) NSString * creditCardBalance;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, strong) NSObject * username;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end