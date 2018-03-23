//
//	ShangPin_Model_GroupUserInfo.h
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface ShangPin_Model_GroupUserInfo : NSObject

@property (nonatomic, assign) NSInteger arrivalTime;
@property (nonatomic, assign) NSInteger bulkGroupId;
@property (nonatomic, strong) NSString * bulkImageUrl;
@property (nonatomic, strong) NSString * bulkNickname;
@property (nonatomic, assign) NSInteger endtime;
@property (nonatomic, strong) NSString * orderTime;
@property (nonatomic, assign) NSInteger starttime;
@property (nonatomic, assign) NSInteger surplusNum;
@property (nonatomic, assign) NSInteger surplusTime;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
