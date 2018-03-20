//
//  LYWPickerView.h
//  同文同书
//
//  Created by 信码互通 on 2017/6/28.
//  Copyright © 2017年 XC. All rights reserved.
// 改装版pickerview

#import <UIKit/UIKit.h>

@protocol LYWPickerViewDelegate <NSObject>

@optional
- (void)pickViewSureBtnClick:(NSString *)selectRow;
- (void)pickViewSureBtnClick:(NSString *)selectRow tag:(NSInteger)tag;

@end

@interface LYWPickerView : UIView

/*** 提供出一个数组 方便外面传递 ***/
@property (strong, nonatomic) NSMutableArray *NumberArr;

@property (weak, nonatomic)id<LYWPickerViewDelegate> delegate;

@end
