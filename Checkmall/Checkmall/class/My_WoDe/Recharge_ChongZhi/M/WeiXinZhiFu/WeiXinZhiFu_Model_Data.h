//
//	WeiXinZhiFu_Model_Data.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface WeiXinZhiFu_Model_Data : NSObject

@property (nonatomic, strong) NSString * appid;
@property (nonatomic, strong) NSString * noncestr;
@property (nonatomic, strong) NSString * packageField;
@property (nonatomic, strong) NSString * partnerid;
@property (nonatomic, strong) NSString * prepayid;
@property (nonatomic, strong) NSString * sign;
@property (nonatomic, assign) UInt32     timestamp;
@property (nonatomic, strong) NSString * out_trade_no;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
