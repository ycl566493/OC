//
//	SouSuo_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface SouSuo_Model_Data : NSObject

@property (nonatomic, strong) NSObject * buynum;
@property (nonatomic, assign) NSInteger cateid;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * mprice;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, strong) NSString * promotion;
@property (nonatomic, strong) NSString * sprice;
@property (nonatomic, assign) NSInteger video;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
