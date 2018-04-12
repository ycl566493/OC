//
//	PTZFCG_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PTZFCG_Model_Good.h"
#import "PTZFCG_Model_Group.h"

@interface PTZFCG_Model_Data : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger endtime;
@property (nonatomic, strong) PTZFCG_Model_Good * goods;
@property (nonatomic, strong) NSArray * group;
@property (nonatomic, assign) NSInteger agotime;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
