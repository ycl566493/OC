//
//	SouSuo_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SouSuo_Model_RootClass.h"

NSString *const kSouSuo_Model_RootClassCode = @"code";
NSString *const kSouSuo_Model_RootClassData = @"data";
NSString *const kSouSuo_Model_RootClassMsg = @"msg";

@interface SouSuo_Model_RootClass ()
@end
@implementation SouSuo_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    self.data = [[NSMutableArray alloc]init];
	if(![dictionary[kSouSuo_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kSouSuo_Model_RootClassCode] integerValue];
	}

	if(dictionary[kSouSuo_Model_RootClassData] != nil && [dictionary[kSouSuo_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kSouSuo_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			SouSuo_Model_Data * dataItem = [[SouSuo_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObjectsFromArray:dataItems];
	}
	if(![dictionary[kSouSuo_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
		self.msg = dictionary[kSouSuo_Model_RootClassMsg];
	}	
	return self;
}
-(void)Add_Dictionary:(NSDictionary *)dictionary{
    if(![dictionary[kSouSuo_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kSouSuo_Model_RootClassCode] integerValue];
    }
    
    if(dictionary[kSouSuo_Model_RootClassData] != nil && [dictionary[kSouSuo_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kSouSuo_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            SouSuo_Model_Data * dataItem = [[SouSuo_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObjectsFromArray:dataItems];
    }
    if(![dictionary[kSouSuo_Model_RootClassMsg] isKindOfClass:[NSNull class]]){
        self.msg = dictionary[kSouSuo_Model_RootClassMsg];
    }    
}

@end
