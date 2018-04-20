//
//	CGFX_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface CGFX_Model_Data : NSObject

@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * promotion;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
