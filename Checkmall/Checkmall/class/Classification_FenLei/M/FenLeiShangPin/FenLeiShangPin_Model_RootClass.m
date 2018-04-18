//
//	FenLeiShangPin_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FenLeiShangPin_Model_RootClass.h"

NSString *const kFenLeiShangPin_Model_RootClassCode = @"code";
NSString *const kFenLeiShangPin_Model_RootClassData = @"data";
NSString *const kFenLeiShangPin_Model_RootClassMessage = @"msg";
NSString *const kFenLeiShangPin_Model_RootClassPage = @"page";

@interface FenLeiShangPin_Model_RootClass ()
@end
@implementation FenLeiShangPin_Model_RootClass

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    self.data = [[NSMutableArray alloc]init];
	if(![dictionary[kFenLeiShangPin_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kFenLeiShangPin_Model_RootClassCode] integerValue];
	}

	if(dictionary[kFenLeiShangPin_Model_RootClassData] != nil && [dictionary[kFenLeiShangPin_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kFenLeiShangPin_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			FenLeiShangPin_Model_Data * dataItem = [[FenLeiShangPin_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObjectsFromArray:dataItems];
	}
	if(![dictionary[kFenLeiShangPin_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kFenLeiShangPin_Model_RootClassMessage];
	}	
	if(![dictionary[kFenLeiShangPin_Model_RootClassPage] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[kFenLeiShangPin_Model_RootClassPage] integerValue];
	}

	return self;
}

-(void)Add_Dictionary:(NSDictionary *)dictionary{
    if(![dictionary[kFenLeiShangPin_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kFenLeiShangPin_Model_RootClassCode] integerValue];
    }
    
    if(dictionary[kFenLeiShangPin_Model_RootClassData] != nil && [dictionary[kFenLeiShangPin_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kFenLeiShangPin_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            FenLeiShangPin_Model_Data * dataItem = [[FenLeiShangPin_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObjectsFromArray:dataItems];
    }
    if(![dictionary[kFenLeiShangPin_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kFenLeiShangPin_Model_RootClassMessage];
    }
    if(![dictionary[kFenLeiShangPin_Model_RootClassPage] isKindOfClass:[NSNull class]]){
        self.page = [dictionary[kFenLeiShangPin_Model_RootClassPage] integerValue];
    }
}


@end
