//
//  SS_SJ_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//  搜索数据

#import "MyUIView.h"
@protocol SS_SJ_V_Delegate <NSObject>

@optional
- (void)SS_SJ_V_Delegate_UP;//更新视图

- (void)SS_SJ_V_Delegate_Action:(NSInteger)tag VC:(UIView*)vc Name:(NSString *)str;//按钮点击 那个视图

@end

@interface SS_SJ_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_Title;//标题

@property (nonatomic,assign) id<SS_SJ_V_Delegate>  delegate;

@property (nonatomic,strong) NSArray            *arr_Data;

@end
