//
//	GuangGao_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GuangGao_Model_RootClass.h"

NSString *const kGuangGao_Model_RootClassCode = @"code";
NSString *const kGuangGao_Model_RootClassData = @"data";
NSString *const kGuangGao_Model_RootClassMsg = @"msg";

@interface GuangGao_Model_RootClass ()
@end
@implementation GuangGao_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kGuangGao_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kGuangGao_Model_RootClassCode] integerValue];
	}

	if(dictionary[kGuangGao_Model_RootClassData] != nil && [dictionary[kGuangGao_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kGuangGao_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			GuangGao_Model_Data * dataItem = [[GuangGao_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kGuangGao_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kGuangGao_Model_RootClassMsg];
	}	
	return self;
}
@end
