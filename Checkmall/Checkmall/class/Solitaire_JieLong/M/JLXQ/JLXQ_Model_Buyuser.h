//
//	JLXQ_Model_Buyuser.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface JLXQ_Model_Buyuser : NSObject

@property (nonatomic, assign) NSInteger created;
@property (nonatomic, strong) NSString * headimgurl;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, assign) NSInteger sort;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
