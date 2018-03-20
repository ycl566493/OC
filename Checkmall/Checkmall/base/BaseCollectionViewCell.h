//
//  BaseCollectionViewCell.h
//  黄轩博客 blog.libuqing.com
//
//  Created by 黄轩 on 16/1/14.
//  Copyright © 2016年 IT小子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface BaseCollectionViewCell : UICollectionViewCell

+ (UINib *)nib;
+ (NSString *)reuseIdentifier;
+ (float)getCellFrame:(id)msg;
+ (CGFloat)get_H:(id)data;

- (void)init_UI;
- (void)setData:(id)data delegate:(id)delegate;

@end
