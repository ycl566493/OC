//
//	FenLeiLieBiao_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FenLeiLieBiao_Model_Data.h"

NSString *const kFenLeiLieBiao_Model_DataIdField = @"id";
NSString *const kFenLeiLieBiao_Model_DataName = @"name";

@interface FenLeiLieBiao_Model_Data ()
@end
@implementation FenLeiLieBiao_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kFenLeiLieBiao_Model_DataIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kFenLeiLieBiao_Model_DataIdField] integerValue];
	}

	if(![dictionary[kFenLeiLieBiao_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kFenLeiLieBiao_Model_DataName];
	}	
	return self;
}
@end
