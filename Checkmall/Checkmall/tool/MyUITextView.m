//
//  MyUITextView.m
//  同文同书
//
//  Created by 信码互通 on 2017/6/28.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "MyUITextView.h"

@implementation MyUITextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //设置默认字体
        self.font = font1;
        
        //设置占位文字默认颜色
        self.placeholderColor = [UIColor grayColor];
        
        //使用通知监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)dealloc
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)textDidChange:(NSNotification *)note
{
    //重绘
    //会重新调用drawRect:方法
    [self setNeedsDisplay];
}
/**
 *  每次调用drawRect：方法，都会将以前画的东西清除掉，重新画
 */
- (void)drawRect:(CGRect)rect
{
    //如果有文字就直接返回，不需要画占位文字
    if (self.text.length) return;
    
    //设置占位文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderColor;
    
    //画占位文字
    //调整rect：画得位置（5，8是根据经验所得）调整光标，和每一行两边各控制间隙
    rect.origin.x = 5;
    rect.origin.y = 8;
    rect.size.width -= 2 * rect.origin.x;
    
    //画
    [self.placeholder drawInRect:rect withAttributes:attrs];
}


@end
