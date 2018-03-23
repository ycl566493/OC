//
//	ShangPin_Model_SlidsUrlList.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShangPin_Model_SlidsUrlList.h"

NSString *const kShangPin_Model_SlidsUrlListPath = @"path";

@interface ShangPin_Model_SlidsUrlList ()
@end
@implementation ShangPin_Model_SlidsUrlList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShangPin_Model_SlidsUrlListPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kShangPin_Model_SlidsUrlListPath];
	}	
	return self;
}
@end
