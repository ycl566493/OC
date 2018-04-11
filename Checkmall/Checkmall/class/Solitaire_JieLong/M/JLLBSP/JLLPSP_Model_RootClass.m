//
//	JLLPSP_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLLPSP_Model_RootClass.h"

NSString *const kJLLPSP_Model_RootClassCode = @"code";
NSString *const kJLLPSP_Model_RootClassData = @"data";
NSString *const kJLLPSP_Model_RootClassMessage = @"message";

@interface JLLPSP_Model_RootClass ()
@end
@implementation JLLPSP_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLLPSP_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kJLLPSP_Model_RootClassCode] integerValue];
	}

	if(dictionary[kJLLPSP_Model_RootClassData] != nil && [dictionary[kJLLPSP_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kJLLPSP_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			JLLPSP_Model_Data * dataItem = [[JLLPSP_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
        
	}
	if(![dictionary[kJLLPSP_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kJLLPSP_Model_RootClassMessage];
	}	
	return self;
}
@end
