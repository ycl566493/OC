//
//  TC_JL_Cell.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_JL_Cell.h"

@interface TC_JL_Cell()<UITextFieldDelegate>{
    
}
@end

@implementation TC_JL_Cell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.txt_SL.delegate = self;
}

#pragma mark-  当前输入框结束编辑时触发 ( 键盘收回之后触发 )
- (void)textFieldDidEndEditing:( UITextField *)textField{
    NSInteger int_SL = [self.txt_SL.text integerValue];
    self.txt_SL.text = [NSString stringWithFormat:@"%li",int_SL];
    self.model.str_SL = self.txt_SL.text;
    [self UP_SL];
}

- (IBAction)btn_Jian:(id)sender {
    NSInteger int_SL = [self.txt_SL.text integerValue];
    if (int_SL != 1) {
        int_SL -- ;
        self.txt_SL.text = [NSString stringWithFormat:@"%li",int_SL];
    }
        self.model.str_SL = self.txt_SL.text;
    [self UP_SL];
}

- (IBAction)Jia:(id)sender {
    NSInteger int_SL = [self.txt_SL.text integerValue];
    int_SL ++ ;
    self.txt_SL.text = [NSString stringWithFormat:@"%li",int_SL];
    self.model.str_SL = self.txt_SL.text;
    
    [self UP_SL];
}
#pragma mark- 刷新数量
- (void)UP_SL{
    if (self.delegate && [self.delegate respondsToSelector:@selector(TC_JL_Cell_Delegate_SLUP)]) {
        [self.delegate TC_JL_Cell_Delegate_SLUP];
    }
}

-(void)setModel:(JLLPSP_Model_Data *)model{
    _model = model;
    
    self.txt_SL.text = model.str_SL;
    
    [self.image_V sd_setImageWithURL:[MyHelper imaeg_URL:model.imgpath view:self.image_V] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    
    self.lbl_Name.text = model.name;
    self.lbl_JG.text = [NSString stringWithFormat:@"￥%@",model.sprice];
    self.lbl_SY.text = [NSString stringWithFormat:@"剩余 %ld",(long)model.amount];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     self.lbl_SY.text];
    NSRange range = NSMakeRange(2, [NSString stringWithFormat:@"%li",model.amount].length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0xffa555) range:range];
    self.lbl_SY.attributedText = attributedStr;
    
    self.lbl_MB.hidden = YES;
    self.image_MB.hidden = YES;
    for (NSInteger i = 0 ; i < model.spec.count; i ++) {
        JLLPSP_Model_Spec *MMMM = model.spec[i];
        
        //是否在当前区间
        if (MMMM.neednumber < model.buynum) {
          
            self.lbl_DQ.text = [NSString stringWithFormat:@" 满%li件返￥%@     ",MMMM.neednumber,MMMM.jprice];
            
            //如果不是最后一个就取下一个
            if (i == model.spec.count - 1) {
                self.lbl_MB.hidden = YES;
                 self.image_MB.hidden = YES;
            }else{
                self.lbl_MB.hidden = NO;
                self.image_MB.hidden = NO;
                JLLPSP_Model_Spec *MMMM = model.spec[ i + 1 ];
 
                self.lbl_MB.text = [NSString stringWithFormat:@" 满%li件返￥%@     ",MMMM.neednumber,MMMM.jprice];

            }
        }else{
            //没有一个在的区间 就取第一个
            if (i ==0) {
                self.lbl_DQ.text = [NSString stringWithFormat:@" 满%li件返￥%@     ",MMMM.neednumber,MMMM.jprice];
                
                //如果不是最后一个就取下一个
                if (i == model.spec.count - 1) {
                    self.lbl_MB.hidden = YES;
                    self.image_MB.hidden = YES;
                }else{
                    self.lbl_MB.hidden = NO;
                    self.image_MB.hidden = NO;
                    JLLPSP_Model_Spec *MMMM = model.spec[ i + 1 ];
                    
                    self.lbl_MB.text = [NSString stringWithFormat:@" 满%li件返￥%@     ",MMMM.neednumber,MMMM.jprice];
                    
                }
            }
        }
    }

    self.lbl_DQ_W.constant = [MyHelper strWidth:self.lbl_DQ.text andFont:self.lbl_DQ.font andHeight:self.lbl_DQ.height];
    self.lbl_MB_W.constant = [MyHelper strWidth:self.lbl_MB.text andFont:self.lbl_MB.font andHeight:self.lbl_MB.height];
}


+(CGFloat)get_H{
    return 105;
}

@end
