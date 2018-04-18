//
//	PLLB_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PLLB_Model_RootClass.h"

NSString *const kPLLB_Model_RootClassCode = @"code";
NSString *const kPLLB_Model_RootClassData = @"data";
NSString *const kPLLB_Model_RootClassMessage = @"msg";
NSString *const kPLLB_Model_RootClassPage = @"page";

@interface PLLB_Model_RootClass ()
@end
@implementation PLLB_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    
    self.data = [[NSMutableArray alloc]init];
    
	if(![dictionary[kPLLB_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kPLLB_Model_RootClassCode] integerValue];
	}
    
	if(dictionary[kPLLB_Model_RootClassData] != nil && [dictionary[kPLLB_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kPLLB_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			PLLB_Model_Data * dataItem = [[PLLB_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObjectsFromArray:dataItems];
	}
	if(![dictionary[kPLLB_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kPLLB_Model_RootClassMessage];
	}	
	if(![dictionary[kPLLB_Model_RootClassPage] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[kPLLB_Model_RootClassPage] integerValue];
	}

	return self;
}

-(void)Add_Dictionary:(NSDictionary *)dictionary{
    if(![dictionary[kPLLB_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kPLLB_Model_RootClassCode] integerValue];
    }
    if(dictionary[kPLLB_Model_RootClassData] != nil && [dictionary[kPLLB_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kPLLB_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            PLLB_Model_Data * dataItem = [[PLLB_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObjectsFromArray:dataItems];
    }
    if(![dictionary[kPLLB_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kPLLB_Model_RootClassMessage];
    }
    if(![dictionary[kPLLB_Model_RootClassPage] isKindOfClass:[NSNull class]]){
        self.page = [dictionary[kPLLB_Model_RootClassPage] integerValue];
    }
}

@end
