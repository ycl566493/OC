//
//  BaseTableViewCell.h
//  黄轩博客 blog.libuqing.com
//
//  Created by 黄轩 on 16/1/14.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

typedef NS_ENUM(NSInteger, SecondHouseCellType) {
    SecondHouseCellTypeFirst,
    SecondHouseCellTypeMiddle,
    SecondHouseCellTypeLast,
    SecondHouseCellTypeSingle,
    SecondHouseCellTypeAny,
    SecondHouseCellTypeHaveTop,
    SecondHouseCellTypeHaveBottom,
    SecondHouseCellTypeNone
};

@interface BaseTableViewCell : UITableViewCell

@property (strong, nonatomic)  UIImageView *lineviewTop;//上横线
@property (strong, nonatomic)  UIImageView *lineviewBottom;//下横线,都是用来分隔cell的

- (void)setSeperatorLineForIOS7 :(NSIndexPath *)indexPath numberOfRowsInSection: (NSInteger)numberOfRowsInSection;
- (void)setSeperatorLine:(NSIndexPath *)indexPath numberOfRowsInSection: (NSInteger)numberOfRowsInSection;
- (void)setData:(id)data delegate:(id)delegate;

- (void)init_UI;

+ (UINib *)nib;
+ (NSString *)reuseIdentifier;
+ (float)getCellFrame:(id)msg;
+ (CGFloat)get_H:(id)data;

@end


@interface UIImage (MGTint)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
