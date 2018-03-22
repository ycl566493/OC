//
//	FenLeiLieBiao_Model_RootClass.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "FenLeiLieBiao_Model_Data.h"

@interface FenLeiLieBiao_Model_RootClass : NSObject

@property (nonatomic, strong) NSArray * data;
@property (nonatomic, strong) NSString * message;
@property (nonatomic, assign) NSInteger status;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
