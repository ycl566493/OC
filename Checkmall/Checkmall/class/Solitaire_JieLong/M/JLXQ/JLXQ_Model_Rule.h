//
//	JLXQ_Model_Rule.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface JLXQ_Model_Rule : NSObject

@property (nonatomic, strong) NSString * jianprice;
@property (nonatomic, assign) NSInteger neednumber;
@property (nonatomic, assign) NSInteger status;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
