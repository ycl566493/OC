//
//  QieHuan_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"

@protocol QieHuan_V_Delegate <NSObject>

@optional
- (void)QieHuan_V_Delegate_QH:(BOOL)qh;//切换 yes 详情 no 视频

@end

@interface QieHuan_V : MyUIView

@property (weak, nonatomic) IBOutlet UIButton *btn_XQ;//详情按钮

@property (weak, nonatomic) IBOutlet UIButton *btn_SP;//视频

@property (nonatomic,assign) id<QieHuan_V_Delegate> delegate;

@end
