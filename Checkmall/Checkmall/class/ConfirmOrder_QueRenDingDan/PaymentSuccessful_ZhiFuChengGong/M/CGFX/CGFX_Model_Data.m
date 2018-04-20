//
//	CGFX_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CGFX_Model_Data.h"

NSString *const kCGFX_Model_DataImage = @"image";
NSString *const kCGFX_Model_DataName = @"name";
NSString *const kCGFX_Model_DataPath = @"path";
NSString *const kCGFX_Model_DataPromotion = @"promotion";

@interface CGFX_Model_Data ()
@end
@implementation CGFX_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCGFX_Model_DataImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kCGFX_Model_DataImage];
	}	
	if(![dictionary[kCGFX_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kCGFX_Model_DataName];
	}	
	if(![dictionary[kCGFX_Model_DataPath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kCGFX_Model_DataPath];
	}	
	if(![dictionary[kCGFX_Model_DataPromotion] isKindOfClass:[NSNull class]]){
		self.promotion = dictionary[kCGFX_Model_DataPromotion];
	}	
	return self;
}
@end
