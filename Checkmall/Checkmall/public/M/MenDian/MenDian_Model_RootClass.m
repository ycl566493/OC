//
//	MenDian_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "MenDian_Model_RootClass.h"

NSString *const kMenDian_Model_RootClassCode = @"code";
NSString *const kMenDian_Model_RootClassData = @"data";
NSString *const kMenDian_Model_RootClassMsg = @"msg";

@interface MenDian_Model_RootClass ()
@end
@implementation MenDian_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kMenDian_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kMenDian_Model_RootClassCode] integerValue];
	}

	if(dictionary[kMenDian_Model_RootClassData] != nil && [dictionary[kMenDian_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kMenDian_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			MenDian_Model_Data * dataItem = [[MenDian_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kMenDian_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kMenDian_Model_RootClassMsg];
	}	
	return self;
}
@end
