//
//	GouWuChe_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "GouWuChe_Model_RootClass.h"

NSString *const kGouWuChe_Model_RootClassCode = @"code";
NSString *const kGouWuChe_Model_RootClassData = @"data";
NSString *const kGouWuChe_Model_RootClassMessage = @"message";

@interface GouWuChe_Model_RootClass ()
@end
@implementation GouWuChe_Model_RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    self.data = [[NSMutableArray alloc]init];
	if(![dictionary[kGouWuChe_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kGouWuChe_Model_RootClassCode] integerValue];
	}

	if(dictionary[kGouWuChe_Model_RootClassData] != nil && [dictionary[kGouWuChe_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kGouWuChe_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			GouWuChe_Model_Data * dataItem = [[GouWuChe_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObjectsFromArray:dataItems];
	}
	if(![dictionary[kGouWuChe_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kGouWuChe_Model_RootClassMessage];
	}	
	return self;
}

-(void)Add_Dictionary:(NSDictionary *)dictionary{
    if(![dictionary[kGouWuChe_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kGouWuChe_Model_RootClassCode] integerValue];
    }
    
    if(dictionary[kGouWuChe_Model_RootClassData] != nil && [dictionary[kGouWuChe_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kGouWuChe_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            GouWuChe_Model_Data * dataItem = [[GouWuChe_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObjectsFromArray:dataItems];
    }
    if(![dictionary[kGouWuChe_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kGouWuChe_Model_RootClassMessage];
    }
}




@end
