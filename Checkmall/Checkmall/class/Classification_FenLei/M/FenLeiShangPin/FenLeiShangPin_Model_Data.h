//
//	FenLeiShangPin_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface FenLeiShangPin_Model_Data : NSObject

@property (nonatomic, strong) NSString * buynum;
@property (nonatomic, assign) NSInteger cateid;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * groupPrice;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, strong) NSString * marketPrice;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
