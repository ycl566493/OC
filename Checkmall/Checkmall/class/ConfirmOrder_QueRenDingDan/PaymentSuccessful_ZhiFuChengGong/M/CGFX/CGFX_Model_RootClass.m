//
//	CGFX_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CGFX_Model_RootClass.h"

NSString *const kCGFX_Model_RootClassCode = @"code";
NSString *const kCGFX_Model_RootClassData = @"data";
NSString *const kCGFX_Model_RootClassMsg = @"msg";

@interface CGFX_Model_RootClass ()
@end
@implementation CGFX_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCGFX_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kCGFX_Model_RootClassCode] integerValue];
	}

	if(![dictionary[kCGFX_Model_RootClassData] isKindOfClass:[NSNull class]]){
		self.data = [[CGFX_Model_Data alloc] initWithDictionary:dictionary[kCGFX_Model_RootClassData]];
	}

	if(![dictionary[kCGFX_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kCGFX_Model_RootClassMsg];
	}	
	return self;
}
@end
