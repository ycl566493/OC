//
//	FenLeiLieBiao_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FenLeiLieBiao_Model_RootClass.h"

NSString *const kFenLeiLieBiao_Model_RootClassData = @"data";
NSString *const kFenLeiLieBiao_Model_RootClassMessage = @"message";
NSString *const kFenLeiLieBiao_Model_RootClassStatus = @"status";

@interface FenLeiLieBiao_Model_RootClass ()
@end
@implementation FenLeiLieBiao_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kFenLeiLieBiao_Model_RootClassData] != nil && [dictionary[kFenLeiLieBiao_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kFenLeiLieBiao_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			FenLeiLieBiao_Model_Data * dataItem = [[FenLeiLieBiao_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		self.data = dataItems;
	}
	if(![dictionary[kFenLeiLieBiao_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kFenLeiLieBiao_Model_RootClassMessage];
	}	
	if(![dictionary[kFenLeiLieBiao_Model_RootClassStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kFenLeiLieBiao_Model_RootClassStatus] integerValue];
	}

	return self;
}
@end
