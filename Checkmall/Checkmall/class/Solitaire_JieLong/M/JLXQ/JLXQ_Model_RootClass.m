//
//	JLXQ_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLXQ_Model_RootClass.h"

NSString *const kJLXQ_Model_RootClassCode = @"code";
NSString *const kJLXQ_Model_RootClassData = @"data";
NSString *const kJLXQ_Model_RootClassMessage = @"msg";

@interface JLXQ_Model_RootClass ()
@end
@implementation JLXQ_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLXQ_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kJLXQ_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kJLXQ_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[JLXQ_Model_Data alloc] initWithDictionary:dictionary[kJLXQ_Model_RootClassData]];
	}

	if(![dictionary[kJLXQ_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kJLXQ_Model_RootClassMessage];
	}	
	return self;
}
@end
