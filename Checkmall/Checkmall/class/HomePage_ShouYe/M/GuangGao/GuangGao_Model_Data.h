//
//	GuangGao_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface GuangGao_Model_Data : NSObject

@property (nonatomic, strong) NSString * adverUrl;
@property (nonatomic, assign) NSInteger goodsId;
@property (nonatomic, assign) NSInteger istype;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
