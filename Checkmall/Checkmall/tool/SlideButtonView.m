//
//  SlideButtonView.m
//  轮播
//
//  Created by 信码互通 on 16/7/14.
//  Copyright © 2016年 杨成龙. All rights reserved.
//

#import "SlideButtonView.h"
//#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


@interface SlideButtonView ()<UIScrollViewDelegate>
{
    UIScrollView                    *scrollV; // 承载的视图
    NSMutableArray              *arr_Button;//存放显示的button
    UIView                              *view_SplitLine;//滑动条
    int                                         int_tag;//记录上次选中的第几个
}
@end

@implementation SlideButtonView

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //属性初始化
        [self initDefaultProperty];
        
        //初始化UI
        [self initUI];
        
    }
    return self;
}

#pragma mark 默认属性初始化
- (void)initDefaultProperty{
    //初始化选中第几个
    self.init_Selected = 0;
    //初始化存放按钮 的数组
    arr_Button = [[NSMutableArray alloc]init];
    //初始化文字大小为view高度的4/5
    self.Font_Size = 17;
    //初始化文字对齐方式为居中
    self.Title_Alignment = 0;
    //未选择的颜色    黑色
    self.No_Color = [UIColor blackColor];
    //选中的颜色
    self.Yes_Color = [UIColor blackColor];
    //未选择的背景颜色    黑色
    self.No_backgroundColor = [UIColor blackColor];
    //选中的背景颜色
    self.Yes_backgroundColor = [UIColor blackColor];
    //是否需要底部滑动条
    self.bool_SlideBar = YES;
    //底部滑动条颜色
    self.SlideBar_Color = [UIColor blackColor];
    self.float_SlideBar = .3;
}

#pragma mark 初始化UI
- (void)initUI{
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, view_Width, view_Height)];
    //背景色
    scrollV.backgroundColor = [UIColor clearColor];
    //是否反弹
    scrollV.bounces = NO;
    scrollV.delegate = self;
    //    scrollV.alwaysBounceVertical =YES;
    //    scrollV.alwaysBounceHorizontal = YES;
    //隐藏滚动条
    scrollV.showsVerticalScrollIndicator = NO;
    scrollV.showsHorizontalScrollIndicator = NO;
    //    scrollV.scrollEnabled = YES;
    //    scrollV.scrollsToTop = NO;
    //    scrollV.contentSize = CGSizeMake(0, 0);
    [self addSubview:scrollV];
    
    view_SplitLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 2)];
    view_SplitLine.backgroundColor = self.SlideBar_Color;
    [scrollV addSubview:view_SplitLine];
    
    UIView *view_FGX = [[UIView alloc]initWithFrame:CGRectMake(0, view_Height - .5, view_Width, .5)];
    view_FGX.backgroundColor  = UIColorFromHex(0xf2f2f2);
    [self addSubview:view_FGX];
}
#pragma mark //修改滑动条颜色
-(void)setSlideBar_Color:(UIColor *)SlideBar_Color{
    _SlideBar_Color = SlideBar_Color;
    view_SplitLine.backgroundColor = SlideBar_Color;
}
#pragma mark //是否显示滑动条
-(void)setBool_SlideBar:(BOOL)bool_SlideBar{
    if (bool_SlideBar) {
        view_SplitLine.hidden = NO;
    }else{
        view_SplitLine.hidden = YES;
    }
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollV.contentOffset.y !=0) {
        scrollV.contentOffset = CGPointMake(scrollV.contentOffset.x, 0);
    }
}

#pragma mark 判断按钮是否过多超过屏幕需要滑动
- (BOOL)Button_DetectingWidth:(NSArray*)arr_Title{
    
    //算出这些文字和间隔一的长度
    CGFloat   str_Int = 0;
    for (NSString * str in arr_Title) {
        str_Int += (str.length + 2) * self.Font_Size;
    }
    
    //如果大于屏幕的宽就返回yes 否则no
    if (str_Int > view_Width) {
        return 1;
    }else{
        return 0;
    }
    
}

#pragma mark 赋值文字颜色方法Yes
-(void)setYes_Color:(UIColor *)Yes_Color{
    _Yes_Color = Yes_Color;
    for (UIButton *btn in arr_Button) {
        [btn removeFromSuperview];
    }
    self.arr_Title = self.arr_Title;
}

#pragma mark 赋值文字颜色方法No
-(void)setNo_Color:(UIColor *)No_Color{
    _No_Color = No_Color;
    for (UIButton *btn in arr_Button) {
        [btn removeFromSuperview];
    }
    self.arr_Title = self.arr_Title;
}

#pragma mark 赋值背景颜色方法Yes
-(void)setYes_backgroundColor:(UIColor *)Yes_backgroundColor{
    _Yes_backgroundColor = Yes_backgroundColor;
    for (UIButton *btn in arr_Button) {
        [btn removeFromSuperview];
    }
    self.arr_Title = self.arr_Title;
}

#pragma mark 赋值背景颜色方法No
-(void)setNo_backgroundColor:(UIColor *)No_backgroundColor{
    _No_backgroundColor = No_backgroundColor;
    for (UIButton *btn in arr_Button) {
        [btn removeFromSuperview];
    }
    self.arr_Title = self.arr_Title;
}

#pragma mark 赋值对其方式
-(void)setTitle_Alignment:(NSInteger)Title_Alignment{
    _Title_Alignment = Title_Alignment;
    for (UIButton *btn in arr_Button) {
        [btn removeFromSuperview];
    }
    self.arr_Title = self.arr_Title;
}

#pragma mark 赋值文字大小
-(void)setFont_Size:(CGFloat)Font_Size{
    _Font_Size = Font_Size;
    for (UIButton *btn in arr_Button) {
        [btn removeFromSuperview];
    }
    self.arr_Title = self.arr_Title;
}

#pragma mark 初始化大于屏幕的滑动点击button
- (void)largeView:(NSArray*)arr_Title{
    
    //    记录上次的x坐标
    CGFloat flact_X = 0;
    for (int i = 0; i< arr_Title.count; i ++) {
        
        UIButton    *button = [[UIButton alloc]init];
        NSString *str_title = arr_Title[i];
        button.frame = CGRectMake(flact_X,  0, (str_title.length + 2) * self.Font_Size ,  view_Height);
        [button.titleLabel setFont:[UIFont systemFontOfSize:self.Font_Size]];
        flact_X += (str_title.length + 2) * self.Font_Size ;
        if (i == self.init_Selected) {
            view_SplitLine.frame = CGRectMake((self.Font_Size + 1) / 2, view_Height - 2.5, button.frame.size.width - (self.Font_Size + 1), 2);
            [button setTitleColor:self.Yes_Color forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:self.Font_Size]];

        }else{
            [button setTitleColor:self.No_Color forState:UIControlStateNormal];
        }
        int_tag = (int)self.init_Selected;
        [button setTitle:str_title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [arr_Button addObject:button];
        [scrollV addSubview:button];
        
    }
    scrollV.contentSize = CGSizeMake(flact_X, 0);
    
}

#pragma mark 初始化小于于屏幕的滑动点击button
- (void)SmallView:(NSArray*)arr_Title{
    
    //算出这些文字和间隔一的长度
    CGFloat   str_Int = 0;
    for (NSString * str in arr_Title) {
        str_Int += (str.length + 2) * self.Font_Size;
    }
    //    记录上次的x坐标
    CGFloat flact_X = 0;
    //在一屏的情况下算出一共几个按钮 加上需要加的差值
    CGFloat flagt_difference = (view_Width - str_Int) / arr_Title.count;
    for (int i = 0; i< arr_Title.count; i ++) {
        
        UIButton    *button = [[UIButton alloc]init];
        NSString *str_title = arr_Title[i];
        button.frame = CGRectMake(flact_X,  0, (str_title.length + 2) * self.Font_Size + flagt_difference,  view_Height - 2);
        [button.titleLabel setFont:[UIFont systemFontOfSize:self.Font_Size]];
        flact_X += (str_title.length + 2) * self.Font_Size + flagt_difference;
        if (i == self.init_Selected) {
            //            view_SplitLine.frame = CGRectMake(self.Font_Size / 2, view_Height - 2, button.frame.size.width - self.Font_Size, 2);
            view_SplitLine.frame = CGRectMake(button.frame.origin.x + (button.frame.size.width - str_title.length * (self.Font_Size + 1))/2 - (self.Font_Size + 1) / 2+0.5, view_Height - 2.5 ,str_title.length * (self.Font_Size + 1) +(self.Font_Size + 1), 2);
            
            [button setTitleColor:self.Yes_Color forState:UIControlStateNormal];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:self.Font_Size]];

        }else{
            [button setTitleColor:self.No_Color forState:UIControlStateNormal];
        }
        int_tag = (int)self.init_Selected;
        [button setTitle:str_title forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [arr_Button addObject:button];
        [scrollV addSubview:button];
    }
    scrollV.contentSize = CGSizeMake(0, 0);
    
}

#pragma mark 需要显示的内容
-(void)setArr_Title:(NSArray *)arr_Title{
    //如果是空数组 则什么操作也不做
    if (arr_Title.count == 0) {
        return;
    }
    _arr_Title = arr_Title;
    [arr_Button removeAllObjects];
    
    //清除上传btn
    for (UIView *btn in scrollV.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn removeFromSuperview];
        }
    }
    
    //判断是否按钮长度大于屏幕
    if ([self Button_DetectingWidth:arr_Title]) {
        //加载大于屏幕的
        [self largeView:arr_Title];
    }else{
        //加载小于屏幕的
        [self SmallView:arr_Title];
    }
}

- (void)buttonAction:(UIButton *)btn{
    //循环取出按钮
    for (UIButton *button in arr_Button) {
        //判断点击是否是当前的按钮
        if (button.tag == btn.tag) {
            int_tag = (int)btn.tag;
            [button setTitleColor:self.Yes_Color forState:UIControlStateNormal];
            [button  setBackgroundColor:self.Yes_backgroundColor];
            [button.titleLabel setFont:[UIFont boldSystemFontOfSize:self.Font_Size]];
        }else{
            [button setTitleColor:self.No_Color forState:UIControlStateNormal];
            [button  setBackgroundColor:self.No_backgroundColor];
            [button.titleLabel setFont:[UIFont systemFontOfSize:self.Font_Size]];

        }
    }
    NSLog(@"第几个%i",int_tag);
    //执行动画
    [UIView animateWithDuration:self.float_SlideBar animations:^{
        //判断是否是一屏显示完 滑动条宽度等于文字宽度 + 1
        if ([self Button_DetectingWidth:self.arr_Title]) {
            view_SplitLine.frame = CGRectMake(btn.frame.origin.x + (self.Font_Size + 1) / 2, view_Height - 2.5, btn.frame.size.width - (self.Font_Size + 1), 2);
        }else{
            NSString    *str_title = self.arr_Title[btn.tag];
            view_SplitLine.frame = CGRectMake(btn.frame.origin.x + (btn.frame.size.width - str_title.length *  (self.Font_Size + 1))/2 - (self.Font_Size + 1) /2, view_Height - 2.5,str_title.length * (self.Font_Size + 1) + (self.Font_Size + 1), 2);
        }
        
        //获取点击的按钮距离屏幕的x
        CGFloat flogt_btn = btn.frame.origin.x + btn.frame.size.width / 2 - scrollV.contentOffset.x;
        //判断是点击的屏幕左边还是右边
        if (flogt_btn  > view_Width / 2) {
            //判断是否滑动到最大范围
            if (scrollV.contentOffset.x != scrollV.contentSize.width - view_Width) {
                //判断是否滑动到最大范围
                if (scrollV.contentOffset.x + flogt_btn - view_Width / 2 > scrollV.contentSize.width - view_Width) {
                    if (![self Button_DetectingWidth:self.arr_Title]) {
                        scrollV.contentOffset =CGPointMake(scrollV.contentSize.width , 0) ;
                    }else{
                        scrollV.contentOffset =CGPointMake(scrollV.contentSize.width - view_Width, 0) ;
                    }
                }else{
                    scrollV.contentOffset =CGPointMake(scrollV.contentOffset.x + flogt_btn - view_Width / 2, 0) ;
                }
            }
        }else{
            //判断是否滑动到最小范围
            if (scrollV.contentOffset.x != 0) {
                //判断是否滑动到最小范围
                if (scrollV.contentOffset.x - (scrollV.contentOffset.x + view_Width / 2 - btn.frame.origin.x) + btn.frame.size.width / 2 < 0) {
                    scrollV.contentOffset = CGPointMake(0, 0) ;
                }else{
                    scrollV.contentOffset = CGPointMake(scrollV.contentOffset.x - (scrollV.contentOffset.x + view_Width / 2 - btn.frame.origin.x) + btn.frame.size.width / 2, 0);
                }
            }
        }
    }];
    
    //点击事件
    if (self.delegate && [self.delegate respondsToSelector:@selector(SlideButtonViewDelegate_Acion:)]) {
        [self.delegate SlideButtonViewDelegate_Acion:btn.tag];
    }
    
}

-(void)setInit_Selected:(NSInteger)init_Selected{
    _init_Selected = init_Selected;
    //    if (init_Selected < self.arr_Title.count - 1 && init_Selected > 0) {
    [self buttonAction:arr_Button[init_Selected]];
    //    }
}

#pragma mark //左划
-(void)SB_Left{
    if (int_tag +1   > self.arr_Title.count - 1 ) {
        NSLog(@"最后一个了");
    }else{
        [self buttonAction:arr_Button[int_tag + 1]];
    }
}

#pragma mark  右划
-(void)SB_right{
    if (int_tag- 1 < 0) {
        NSLog(@"第一个了");
    }else{
        [self buttonAction:arr_Button[int_tag - 1]];
    }
}

@end







