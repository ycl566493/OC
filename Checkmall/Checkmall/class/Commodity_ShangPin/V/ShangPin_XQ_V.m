//
//  ShangPin_XQ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_XQ_V.h"

@interface ShangPin_XQ_V () <UIWebViewDelegate>{
    
    
}
@end

@implementation ShangPin_XQ_V

-(void)awakeFromNib{
    [super awakeFromNib];
    self.webV.delegate = self;
    self.webV.scalesPageToFit = YES;
    self.webV.scrollView.bounces = NO;
}

-(void)dealloc{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];

}

-(void)setStr_HTML:(NSString *)str_HTML{
    _str_HTML = str_HTML;
      [self.webV loadHTMLString:str_HTML baseURL:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];

    //HTML5的高度
    NSString *htmlHeight = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"];
    //HTML5的宽度
    NSString *htmlWidth = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollWidth"];
    //宽高比
    float i = [htmlWidth floatValue]/[htmlHeight floatValue];
    //webview控件的最终高度
    float height = ScreenWidth / i;
    
    self.height = height;
    //后面的代码
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ShangPin_XQ_V_Delegate_H)]) {
        [self.delegate ShangPin_XQ_V_Delegate_H];
    }
}
@end
