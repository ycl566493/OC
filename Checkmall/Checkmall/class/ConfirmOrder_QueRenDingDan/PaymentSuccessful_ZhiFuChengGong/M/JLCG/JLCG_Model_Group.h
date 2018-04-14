//
//	JLCG_Model_Group.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface JLCG_Model_Group : NSObject

@property (nonatomic, assign) NSInteger created;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) NSString * path;
@property (nonatomic, assign) NSInteger ranking;
@property (nonatomic, assign) NSInteger tel;
@property (nonatomic, strong) NSString * username;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
