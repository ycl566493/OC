//
//	JLLPSP_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "JLLPSP_Model_Spec.h"

@interface JLLPSP_Model_Data : NSObject

@property (nonatomic, assign) NSInteger amount;
@property (nonatomic, assign) NSInteger buynum;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, strong) NSString * imgpath;
@property (nonatomic, strong) NSString * isvideo;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, assign) NSInteger sid;
@property (nonatomic, strong) NSArray * spec;
@property (nonatomic, assign) NSInteger specCur;
@property (nonatomic, strong) NSString * sprice;
@property (nonatomic, strong) NSString * video;
@property (nonatomic, strong) NSString * str_SL;//我添加的商品数量

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
