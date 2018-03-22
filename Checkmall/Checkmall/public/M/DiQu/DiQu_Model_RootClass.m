//
//	DiQu_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DiQu_Model_RootClass.h"

NSString *const kDiQu_Model_RootClassCode = @"code";
NSString *const kDiQu_Model_RootClassData = @"data";
NSString *const kDiQu_Model_RootClassMsg = @"msg";

@interface DiQu_Model_RootClass ()
@end
@implementation DiQu_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDiQu_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kDiQu_Model_RootClassCode] integerValue];
	}

	if(dictionary[kDiQu_Model_RootClassData] != nil && [dictionary[kDiQu_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kDiQu_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			DiQu_Model_Data * dataItem = [[DiQu_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kDiQu_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kDiQu_Model_RootClassMsg];
	}	
	return self;
}
@end
