//
//	JLLB_Model_RootClass.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport
//接龙列表商品

#import <UIKit/UIKit.h>
#import "JLLB_Model_Data.h"

@interface JLLB_Model_RootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSMutableArray * data;
@property (nonatomic, strong) NSString * message;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(void)Add_Dictionary:(NSDictionary *)dictionary;

@end
