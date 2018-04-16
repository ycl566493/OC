//
//	PLLB_Model_RootClass.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PLLB_Model_Data.h"

@interface PLLB_Model_RootClass : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSMutableArray * data;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, assign) NSInteger page;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
-(void)Add_Dictionary:(NSDictionary *)dictionary;

@end
