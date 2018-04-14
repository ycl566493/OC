//
//  TC_PTXZ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_PTXZ_V.h"

@implementation TC_PTXZ_V


-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
    
}

-(void)init_UI{
    
    NSArray  *arr_str = @[
                          @"开团：选择心仪商品，点击“马上拼团”按钮，付款后即为参团成功；",
                          @"参团：进入朋友分享的页面，点击“立即参团”按钮，付款后即为参团成功;",
                          @"成团：在开团或参团成功后，点击“邀请好友参团”将页面分享给好友，在有效时间内凑齐人数/件数即为成团，此时商家会开始发货；",
                          @"组团失败：在有效时间内未凑齐人数，即为组团失败，此时付款项会原路退回到支付账户；",
                          @"组团有效期间内，拼团商品订单不允许取消；"
                          ];
    CGFloat yyyyyy= 0;
    
    for (NSInteger i = 0; i < arr_str.count; i ++) {
        NSString *str = arr_str[i];
        UIView  *view = [[UIView alloc]initWithFrame:CGRectMake(5,yyyyyy + 5, 4, 4)];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = view.width / 2;
        view.backgroundColor = UIColorFromHex(0x666666);
        [self.scrollV addSubview:view];
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(view.right + 5, yyyyyy, self.scrollV.width - view.right - 10, 10)];
        lbl.text = str;
        lbl.textColor = UIColorFromHex(0x333333);
        lbl.numberOfLines = 0;
        lbl.font = font13;
        [MyHelper setLabelSpace:lbl withValue:lbl.text withFont:lbl.font Spacing:5];
        lbl.height = [MyHelper getSpaceLabelHeight:lbl.text withFont:lbl.font withWidth:lbl.width Spacing:5];
        
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl.text];
        NSRange range = NSMakeRange(0, 3);
        // 设置颜色
        [attributedStr addAttribute:NSExpansionAttributeName value:@(0) range:range];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range];

        lbl.attributedText = attributedStr;
        
        [self.scrollV addSubview:lbl];
        yyyyyy = lbl.bottom+5;
        
        self.scrollV.contentSize = CGSizeMake(0, yyyyyy);
    }
    
    
}

#pragma mark- 关闭按钮
- (IBAction)btn_GB_Action:(UIButton *)sender {
    self.hidden = YES;
    [self removeFromSuperview];
}



@end
