//
//	ShangPin_Model_Comment.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShangPin_Model_Comment.h"

NSString *const kShangPin_Model_CommentComInfo = @"com_info";
NSString *const kShangPin_Model_CommentComNum = @"com_num";

@interface ShangPin_Model_Comment ()
@end
@implementation ShangPin_Model_Comment




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kShangPin_Model_CommentComInfo] isKindOfClass:[NSNull class]]){
		self.comInfo = dictionary[kShangPin_Model_CommentComInfo];
	}	
	if(![dictionary[kShangPin_Model_CommentComNum] isKindOfClass:[NSNull class]]){
		self.comNum = [dictionary[kShangPin_Model_CommentComNum] integerValue];
	}

	return self;
}
@end
