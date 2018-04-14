//
//	JLCG_Model_Good.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLCG_Model_Good.h"

NSString *const kJLCG_Model_GoodCreated = @"created";
NSString *const kJLCG_Model_GoodDesc = @"desc";
NSString *const kJLCG_Model_GoodEndTime = @"end_time";
NSString *const kJLCG_Model_GoodIdField = @"id";
NSString *const kJLCG_Model_GoodImgpath = @"imgpath";
NSString *const kJLCG_Model_GoodTitle = @"title";

@interface JLCG_Model_Good ()
@end
@implementation JLCG_Model_Good




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kJLCG_Model_GoodCreated] isKindOfClass:[NSNull class]]){
		self.created = [dictionary[kJLCG_Model_GoodCreated] integerValue];
	}

	if(![dictionary[kJLCG_Model_GoodDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kJLCG_Model_GoodDesc];
	}	
	if(![dictionary[kJLCG_Model_GoodEndTime] isKindOfClass:[NSNull class]]){
		self.endTime = dictionary[kJLCG_Model_GoodEndTime];
	}	
	if(![dictionary[kJLCG_Model_GoodIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kJLCG_Model_GoodIdField] integerValue];
	}

	if(![dictionary[kJLCG_Model_GoodImgpath] isKindOfClass:[NSNull class]]){
		self.imgpath = dictionary[kJLCG_Model_GoodImgpath];
	}	
	if(![dictionary[kJLCG_Model_GoodTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kJLCG_Model_GoodTitle];
	}	
	return self;
}
@end
