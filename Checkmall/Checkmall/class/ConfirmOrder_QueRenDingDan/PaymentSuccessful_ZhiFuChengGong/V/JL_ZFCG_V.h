//
//  JL_ZFCG_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//  接龙支付成功

#import "MyUIView.h"
#import "JLCG_Model_RootClass.h"

@protocol JL_ZFCG_V_Delegate <NSObject>

@optional
- (void)JL_ZFCG_V_Delegate_FX;//分享

@end

@interface JL_ZFCG_V : MyUIView

@property (weak, nonatomic) IBOutlet UIView *View_TX;//头像背景

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *View_TX_W;//头像背景宽

@property (weak, nonatomic) IBOutlet UILabel *lbl_XDTS;//下单提示

@property (weak, nonatomic) IBOutlet UILabel *lbl_JSSJ;//结束时间

@property (weak, nonatomic) IBOutlet UIButton *Btn_YQ;//邀请好友

@property (weak, nonatomic) IBOutlet UILabel *lbl_XDE;//已经下单人数

@property (nonatomic,strong)JLCG_Model_RootClass    *model;

@property (nonatomic , assign) id <JL_ZFCG_V_Delegate> delegate;

@end
