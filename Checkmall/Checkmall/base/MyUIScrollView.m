//
//  MyUIScrollView.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/6.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIScrollView.h"

@implementation MyUIScrollView


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
}


#pragma mark - 懒加载
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        //创建一屏的视图大小
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.frame.size.height)];
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _scrollView.delegate = self;
        if (@available(iOS 11.0, *)){
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _scrollView;
}

@end
