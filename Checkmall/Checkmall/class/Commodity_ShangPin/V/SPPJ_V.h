//
//  SPPJ_V.h
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "MyUIView.h"
#import "ShangPin_Model_Comment.h"

@protocol SPPJ_V_Delegate <NSObject>

@optional
-(void)SPPJ_V_Delegate_GD;//更多

@end

@interface SPPJ_V : MyUIView

@property (weak, nonatomic) IBOutlet UILabel *lbl_SL;//评价人数

@property (weak, nonatomic) IBOutlet UILabel *lbl_HP;//好评率



@property (nonatomic, strong) ShangPin_Model_Comment    *model;

@property (nonatomic, assign) id<SPPJ_V_Delegate>  delegate;

@end

