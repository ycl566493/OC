//
//	QueRenDingDan_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "QueRenDingDan_Model_Addres.h"
#import "QueRenDingDan_Model_Arr.h"

@interface QueRenDingDan_Model_Data : NSObject

@property (nonatomic, strong) QueRenDingDan_Model_Addres * address;
@property (nonatomic, strong) NSArray * arr;
@property (nonatomic, assign) BOOL distribution;
@property (nonatomic, assign) BOOL isfirst;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
