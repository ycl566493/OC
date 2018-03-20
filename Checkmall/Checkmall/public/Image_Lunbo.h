//
//  Image_Lunbo.h
//  轮播
//
//  Created by 信码互通 on 2016/10/14.
//  Copyright © 2016年 杨成龙. All rights reserved.
//图片轮播

#import <UIKit/UIKit.h>

@protocol Image_Lunbo_delegate <NSObject>

- (void)Image_Lunbo_delegate_Action:(NSInteger)tag;

@end

@interface Image_Lunbo : UIView

@property (nonatomic, assign)id<Image_Lunbo_delegate>  delegate;

@property (nonatomic,strong) NSArray                *arr_data;

@property (nonatomic,assign) BOOL searchShow;//搜索按钮是否显示  默认no

-  (void)Stop;//停止

- (void)start;//开始


@end
