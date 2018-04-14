//
//	JLCG_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "JLCG_Model_Good.h"
#import "JLCG_Model_Group.h"

@interface JLCG_Model_Data : NSObject

@property (nonatomic, assign) NSInteger agotime;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * endtime;
@property (nonatomic, strong) JLCG_Model_Good * goods;
@property (nonatomic, strong) NSArray * group;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
