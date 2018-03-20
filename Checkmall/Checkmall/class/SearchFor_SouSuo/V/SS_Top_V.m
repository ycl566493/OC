//
//  SS_Top_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SS_Top_V.h"
@interface SS_Top_V()<UITextFieldDelegate>{
    
}
@end

@implementation SS_Top_V

-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
}

-(void)init_UI{
    self.View_BJ.layer.masksToBounds = YES;
    self.View_BJ.layer.cornerRadius = self.View_BJ.height / 2;
    
    self.txtF.delegate = self;
    self.txtF.returnKeyType = UIReturnKeySearch;
    self.txtF.clearButtonMode = UITextFieldViewModeWhileEditing;

}

//  搜索按钮的方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.text.length !=0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(SS_Top_V_Delegate_SS:)]) {
            [self.delegate SS_Top_V_Delegate_SS:textField.text];
                [self.txtF resignFirstResponder];
        }
    }
    
    return YES;
}

//取消事件
- (IBAction)btn_QX:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(SS_Top_V_Delegate_QX)]) {
        [self.delegate SS_Top_V_Delegate_QX];
        
    }
}



@end
