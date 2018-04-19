//
//	Share.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Share.h"

NSString *const kShareContent = @"content";
NSString *const kShareImage = @"image";
NSString *const kSharePath = @"path";
NSString *const kShareTitle = @"title";

@interface Share ()
@end
@implementation Share




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShareContent] isKindOfClass:[NSNull class]]){
		self.content = dictionary[kShareContent];
	}	
	if(![dictionary[kShareImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kShareImage];
	}	
	if(![dictionary[kSharePath] isKindOfClass:[NSNull class]]){
		self.path = dictionary[kSharePath];
	}	
	if(![dictionary[kShareTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kShareTitle];
	}	
	return self;
}
@end
