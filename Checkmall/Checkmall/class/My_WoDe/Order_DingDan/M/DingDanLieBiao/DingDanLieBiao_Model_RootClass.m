//
//	DingDanLieBiao_Model_RootClass.m
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DingDanLieBiao_Model_RootClass.h"

NSString *const kDingDanLieBiao_Model_RootClassCode = @"code";
NSString *const kDingDanLieBiao_Model_RootClassData = @"data";
NSString *const kDingDanLieBiao_Model_RootClassMessage = @"message";
NSString *const kDingDanLieBiao_Model_RootClassPage = @"page";

@interface DingDanLieBiao_Model_RootClass ()
@end
@implementation DingDanLieBiao_Model_RootClass

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
    self.data = [[NSMutableArray alloc]init];
	if(![dictionary[kDingDanLieBiao_Model_RootClassCode] isKindOfClass:[NSNull class]]){
		self.code = [dictionary[kDingDanLieBiao_Model_RootClassCode] integerValue];
	}

	if(dictionary[kDingDanLieBiao_Model_RootClassData] != nil && [dictionary[kDingDanLieBiao_Model_RootClassData] isKindOfClass:[NSArray class]]){
		NSArray * dataDictionaries = dictionary[kDingDanLieBiao_Model_RootClassData];
		NSMutableArray * dataItems = [NSMutableArray array];
		for(NSDictionary * dataDictionary in dataDictionaries){
			DingDanLieBiao_Model_Data * dataItem = [[DingDanLieBiao_Model_Data alloc] initWithDictionary:dataDictionary];
			[dataItems addObject:dataItem];
		}
		[self.data addObject:dataItems];
	}
	if(![dictionary[kDingDanLieBiao_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
		self.message = dictionary[kDingDanLieBiao_Model_RootClassMessage];
	}	
	if(![dictionary[kDingDanLieBiao_Model_RootClassPage] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[kDingDanLieBiao_Model_RootClassPage] integerValue];
	}

	return self;
}

-(void)Add_Dictionary:(NSDictionary *)dictionary{
    if(![dictionary[kDingDanLieBiao_Model_RootClassCode] isKindOfClass:[NSNull class]]){
        self.code = [dictionary[kDingDanLieBiao_Model_RootClassCode] integerValue];
    }
    
    if(dictionary[kDingDanLieBiao_Model_RootClassData] != nil && [dictionary[kDingDanLieBiao_Model_RootClassData] isKindOfClass:[NSArray class]]){
        NSArray * dataDictionaries = dictionary[kDingDanLieBiao_Model_RootClassData];
        NSMutableArray * dataItems = [NSMutableArray array];
        for(NSDictionary * dataDictionary in dataDictionaries){
            DingDanLieBiao_Model_Data * dataItem = [[DingDanLieBiao_Model_Data alloc] initWithDictionary:dataDictionary];
            [dataItems addObject:dataItem];
        }
        [self.data addObject:dataItems];
    }
    if(![dictionary[kDingDanLieBiao_Model_RootClassMessage] isKindOfClass:[NSNull class]]){
        self.message = dictionary[kDingDanLieBiao_Model_RootClassMessage];
    }
    if(![dictionary[kDingDanLieBiao_Model_RootClassPage] isKindOfClass:[NSNull class]]){
        self.page = [dictionary[kDingDanLieBiao_Model_RootClassPage] integerValue];
    }
}



@end
