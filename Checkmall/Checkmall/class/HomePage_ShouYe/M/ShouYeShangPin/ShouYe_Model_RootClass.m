//
//	ShouYe_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ShouYe_Model_RootClass.h"

NSString *const kShouYe_Model_RootClassCode = @"code";
NSString *const kShouYe_Model_RootClassData = @"data";
NSString *const kShouYe_Model_RootClassMessage = @"msg";

@interface ShouYe_Model_RootClass ()
@end
@implementation ShouYe_Model_RootClass

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    self.data = [[NSMutableArray alloc]init];
	if(![dictionary[kShouYe_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kShouYe_Model_RootClassCode] integerValue];
	}

	if(dictionary[kShouYe_Model_RootClassData] != nil && [dictionary[kShouYe_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kShouYe_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			ShouYe_Model_Data * dataItem = [[ShouYe_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObjectsFromArray:dataItems];
	}
	if(![dictionary[kShouYe_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kShouYe_Model_RootClassMessage];
	}	
	return self;
}

-(void)Add_Dictionary:(NSDictionary *)dictionary{
    if(![dictionary[kShouYe_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kShouYe_Model_RootClassCode] integerValue];
    }
    
    if(dictionary[kShouYe_Model_RootClassData] != nil && [dictionary[kShouYe_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kShouYe_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            ShouYe_Model_Data * dataItem = [[ShouYe_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObjectsFromArray:dataItems];
    }
    if(![dictionary[kShouYe_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kShouYe_Model_RootClassMessage];
    }
}

@end
