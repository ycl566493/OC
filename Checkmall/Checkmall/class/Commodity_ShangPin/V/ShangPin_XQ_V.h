//
//  ShangPin_XQ_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@protocol ShangPin_XQ_V_Delegate <NSObject>

@optional
- (void)ShangPin_XQ_V_Delegate_H;//返回高度

@end

@interface ShangPin_XQ_V : MyUIView

@property (weak, nonatomic) IBOutlet UIWebView *webV;

@property (nonatomic,strong) NSString       *str_HTML;//

@property (nonatomic,assign) id<ShangPin_XQ_V_Delegate> delegate;


@end
