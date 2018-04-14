//
//	JLCG_Model_Good.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface JLCG_Model_Good : NSObject

@property (nonatomic, assign) NSInteger created;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * endTime;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * imgpath;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
