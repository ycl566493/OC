//
//	ShangPin_Model_Comment.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "ShangPin_Model_Com_Info.h"

@interface ShangPin_Model_Comment : NSObject

@property (nonatomic, strong) ShangPin_Model_Com_Info * comInfo;
@property (nonatomic, assign) NSInteger comNum;
@property (nonatomic, assign) NSInteger rate;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
