//
//	YouHuiJuan_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "YouHuiJuan_Model_RootClass.h"

NSString *const kYouHuiJuan_Model_RootClassCode = @"code";
NSString *const kYouHuiJuan_Model_RootClassData = @"data";
NSString *const kYouHuiJuan_Model_RootClassMessage = @"message";

@interface YouHuiJuan_Model_RootClass ()
@end
@implementation YouHuiJuan_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kYouHuiJuan_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kYouHuiJuan_Model_RootClassCode] integerValue];
	}

	if(dictionary[kYouHuiJuan_Model_RootClassData] != nil && [dictionary[kYouHuiJuan_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kYouHuiJuan_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			YouHuiJuan_Model_Data * dataItem = [[YouHuiJuan_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kYouHuiJuan_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kYouHuiJuan_Model_RootClassMessage];
	}	
	return self;
}
@end
