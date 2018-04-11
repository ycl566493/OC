//
//	JLLPSP_Model_Spec.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLLPSP_Model_Spec.h"

NSString *const kJLLPSP_Model_SpecJprice = @"jprice";
NSString *const kJLLPSP_Model_SpecNeednumber = @"neednumber";

@interface JLLPSP_Model_Spec ()
@end
@implementation JLLPSP_Model_Spec




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLLPSP_Model_SpecJprice] isKindOfClass:[NSNull class]]){
		self.jprice = dictionary[kJLLPSP_Model_SpecJprice];
	}	
	if(![dictionary[kJLLPSP_Model_SpecNeednumber] isKindOfClass:[NSNull class]]){
		self.neednumber = [dictionary[kJLLPSP_Model_SpecNeednumber] integerValue];
	}

	return self;
}
@end
