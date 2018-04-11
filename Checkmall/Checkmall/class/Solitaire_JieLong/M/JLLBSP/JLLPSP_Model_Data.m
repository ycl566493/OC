//
//	JLLPSP_Model_Data.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLLPSP_Model_Data.h"

NSString *const kJLLPSP_Model_DataAmount = @"amount";
NSString *const kJLLPSP_Model_DataBuynum = @"buynum";
NSString *const kJLLPSP_Model_DataGid = @"gid";
NSString *const kJLLPSP_Model_DataImgpath = @"imgpath";
NSString *const kJLLPSP_Model_DataIsvideo = @"isvideo";
NSString *const kJLLPSP_Model_DataName = @"name";
NSString *const kJLLPSP_Model_DataNum = @"num";
NSString *const kJLLPSP_Model_DataPrice = @"price";
NSString *const kJLLPSP_Model_DataSid = @"sid";
NSString *const kJLLPSP_Model_DataSpec = @"spec";
NSString *const kJLLPSP_Model_DataSpecCur = @"spec_cur";
NSString *const kJLLPSP_Model_DataSprice = @"sprice";
NSString *const kJLLPSP_Model_DataVideo = @"video";

@interface JLLPSP_Model_Data ()
@end
@implementation JLLPSP_Model_Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    
    self.str_SL = @"0";//我添加的商品数量

    
	if(![dictionary[kJLLPSP_Model_DataAmount] isKindOfClass:[NSNull class]]){
		self.amount = [dictionary[kJLLPSP_Model_DataAmount] integerValue];
	}

	if(![dictionary[kJLLPSP_Model_DataBuynum] isKindOfClass:[NSNull class]]){
		self.buynum = [dictionary[kJLLPSP_Model_DataBuynum] integerValue];
	}

	if(![dictionary[kJLLPSP_Model_DataGid] isKindOfClass:[NSNull class]]){
		self.gid = [dictionary[kJLLPSP_Model_DataGid] integerValue];
	}

	if(![dictionary[kJLLPSP_Model_DataImgpath] isKindOfClass:[NSNull class]]){
		self.imgpath = dictionary[kJLLPSP_Model_DataImgpath];
	}	
	if(![dictionary[kJLLPSP_Model_DataIsvideo] isKindOfClass:[NSNull class]]){
		self.isvideo = dictionary[kJLLPSP_Model_DataIsvideo];
	}	
	if(![dictionary[kJLLPSP_Model_DataName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kJLLPSP_Model_DataName];
	}	
	if(![dictionary[kJLLPSP_Model_DataNum] isKindOfClass:[NSNull class]]){
		self.num = [dictionary[kJLLPSP_Model_DataNum] integerValue];
	}

	if(![dictionary[kJLLPSP_Model_DataPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kJLLPSP_Model_DataPrice];
	}	
	if(![dictionary[kJLLPSP_Model_DataSid] isKindOfClass:[NSNull class]]){
		self.sid = [dictionary[kJLLPSP_Model_DataSid] integerValue];
	}

	if(dictionary[kJLLPSP_Model_DataSpec] != nil && [dictionary[kJLLPSP_Model_DataSpec] isKindOfClass:[NSArray class]]){
		NSArray * specDictionaries = dictionary[kJLLPSP_Model_DataSpec];
		NSMutableArray * specItems = [NSMutableArray array];
		for(NSDictionary * specDictionary in specDictionaries){
			JLLPSP_Model_Spec * specItem = [[JLLPSP_Model_Spec alloc] initWithDictionary:specDictionary];
			[specItems addObject:specItem];
		}
		self.spec = specItems;
	}
	if(![dictionary[kJLLPSP_Model_DataSpecCur] isKindOfClass:[NSNull class]]){
		self.specCur = [dictionary[kJLLPSP_Model_DataSpecCur] integerValue];
	}

	if(![dictionary[kJLLPSP_Model_DataSprice] isKindOfClass:[NSNull class]]){
		self.sprice = dictionary[kJLLPSP_Model_DataSprice];
	}	
	if(![dictionary[kJLLPSP_Model_DataVideo] isKindOfClass:[NSNull class]]){
		self.video = dictionary[kJLLPSP_Model_DataVideo];
	}	
	return self;
}
@end
