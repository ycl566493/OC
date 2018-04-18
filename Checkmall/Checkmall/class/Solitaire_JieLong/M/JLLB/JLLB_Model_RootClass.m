//
//	JLLB_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "JLLB_Model_RootClass.h"

NSString *const kJLLB_Model_RootClassCode = @"code";
NSString *const kJLLB_Model_RootClassData = @"data";
NSString *const kJLLB_Model_RootClassMessage = @"msg";

@interface JLLB_Model_RootClass ()
@end
@implementation JLLB_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    self.data =[[NSMutableArray alloc]init];

	if(![dictionary[kJLLB_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kJLLB_Model_RootClassCode] integerValue];
	}
	if(dictionary[kJLLB_Model_RootClassData] != nil && [dictionary[kJLLB_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kJLLB_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			JLLB_Model_Data * dataItem = [[JLLB_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObjectsFromArray:dataItems];
	}
	if(![dictionary[kJLLB_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kJLLB_Model_RootClassMessage];
	}	
	return self;
}

-(void)Add_Dictionary:(NSDictionary *)dictionary{
    
    if(![dictionary[kJLLB_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kJLLB_Model_RootClassCode] integerValue];
    }
    if(dictionary[kJLLB_Model_RootClassData] != nil && [dictionary[kJLLB_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kJLLB_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            JLLB_Model_Data * dataItem = [[JLLB_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObjectsFromArray:dataItems];
    }
    if(![dictionary[kJLLB_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kJLLB_Model_RootClassMessage];
    }
}

@end
