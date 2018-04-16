//
//	ShangPin_Model_ComInfo.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface ShangPin_Model_Com_Info : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, assign) NSInteger created;
@property (nonatomic, assign) NSInteger descrank;
@property (nonatomic, strong) NSString * headimgurl;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * slidshow;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
