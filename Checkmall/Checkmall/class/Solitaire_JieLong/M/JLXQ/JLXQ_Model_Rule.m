//
//	JLXQ_Model_Rule.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLXQ_Model_Rule.h"

NSString *const kJLXQ_Model_RuleJianprice = @"jianprice";
NSString *const kJLXQ_Model_RuleNeednumber = @"neednumber";
NSString *const kJLXQ_Model_RuleStatus = @"status";

@interface JLXQ_Model_Rule ()
@end
@implementation JLXQ_Model_Rule




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLXQ_Model_RuleJianprice] isKindOfClass:[NSNull class]]){
		self.jianprice = dictionary[kJLXQ_Model_RuleJianprice];
	}	
	if(![dictionary[kJLXQ_Model_RuleNeednumber] isKindOfClass:[NSNull class]]){
		self.neednumber = [dictionary[kJLXQ_Model_RuleNeednumber] integerValue];
	}

	if(![dictionary[kJLXQ_Model_RuleStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kJLXQ_Model_RuleStatus] integerValue];
	}

	return self;
}
@end
