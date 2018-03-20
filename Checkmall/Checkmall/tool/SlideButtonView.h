//
//  SlideButtonView.h
//  轮播
//
//  Created by 信码互通 on 16/7/14.
//  Copyright © 2016年 杨成龙. All rights reserved.
//  点击条状按钮

#import <UIKit/UIKit.h>

//代理
@protocol SlideButtonViewDelegate <NSObject>
//点击的回调
- (void)SlideButtonViewDelegate_Acion:(NSInteger )btn_Tag;

@end

@interface SlideButtonView : UIView

@property (nonatomic,assign)id<SlideButtonViewDelegate>                   delegate;

//需要显示的文字
@property (nonatomic,strong)NSArray                                                                 *arr_Title;

//文字大小
@property (nonatomic,assign)CGFloat                                                                     Font_Size;

//对其方式  0 居中  1左对齐  2右对齐
@property (nonatomic,assign)NSInteger                                                                   Title_Alignment;

//未选择颜色
@property (nonatomic,strong)UIColor                                                                       *No_Color;

//选中颜色
@property (nonatomic,strong)UIColor                                                                       *Yes_Color;

//未选择背景颜色
@property (nonatomic,strong)UIColor                                                                       *No_backgroundColor;

//选中背景颜色
@property (nonatomic,strong)UIColor                                                                       *Yes_backgroundColor;

//是否需要底部滑动条
@property (nonatomic,assign)BOOL                                                                            bool_SlideBar;

//滑动条颜色
@property (nonatomic,strong)UIColor                                                                       *SlideBar_Color;

//滑动条时间
@property (nonatomic,assign)CGFloat                                                                            float_SlideBar;

//初始化选中第几个 在最后调用
@property (nonatomic,assign)NSInteger                                                                         init_Selected;

//左划一下 +1
- (void)SB_Left;

//右划一下 -1
- (void)SB_right;

@end









