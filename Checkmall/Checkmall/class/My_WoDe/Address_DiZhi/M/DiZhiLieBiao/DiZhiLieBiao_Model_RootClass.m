//
//	DiZhiLieBiao_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DiZhiLieBiao_Model_RootClass.h"

NSString *const kDiZhiLieBiao_Model_RootClassCode = @"code";
NSString *const kDiZhiLieBiao_Model_RootClassData = @"data";
NSString *const kDiZhiLieBiao_Model_RootClassMessage = @"msg";

@interface DiZhiLieBiao_Model_RootClass ()
@end
@implementation DiZhiLieBiao_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDiZhiLieBiao_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kDiZhiLieBiao_Model_RootClassCode] integerValue];
	}

	if(dictionary[kDiZhiLieBiao_Model_RootClassData] != nil && [dictionary[kDiZhiLieBiao_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kDiZhiLieBiao_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			DiZhiLieBiao_Model_Data * dataItem = [[DiZhiLieBiao_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kDiZhiLieBiao_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kDiZhiLieBiao_Model_RootClassMessage];
	}	
	return self;
}
@end
