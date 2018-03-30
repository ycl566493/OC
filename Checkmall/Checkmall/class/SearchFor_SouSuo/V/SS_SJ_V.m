//
//  SS_SJ_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SS_SJ_V.h"

@interface SS_SJ_V(){
    
}

@property (nonatomic,strong)NSMutableArray      *arrM_Btn;

@end

@implementation SS_SJ_V

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)layoutSubviews{
    [super layoutSubviews];

}

-(NSMutableArray *)arrM_Btn{
    if (!_arrM_Btn) {
        _arrM_Btn = [[NSMutableArray alloc]init];
    }
    return _arrM_Btn;
}
-(void)setArr_Data:(NSArray *)arr_Data{
    _arr_Data = arr_Data;
    
    for (UIButton *bbbbb in self.arrM_Btn) {
        [bbbbb removeFromSuperview];
    }
    
    NSArray*arr =arr_Data;
    CGFloat x = 15;
    CGFloat y = self.lbl_Title.height;
    CGFloat h = 29;
    CGFloat w = 0;
    
    for (NSInteger i = 0; i < arr.count; i ++) {
        
        CGFloat wwwww = [MyHelper strWidth:arr[i] andFont:font15 andHeight:h] + 10;
        
        if (x + wwwww + 15   > self.width) {
            y = y+ h + 11;
            x = 15;

            if (wwwww +15*2 > self.width) {
                w = self.width - 15*2;
            }else{
                w = wwwww;
            }
        }else{
            w =wwwww;
        }
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        btn.layer.borderColor = UIColorFromHex(0xbfbfbf).CGColor;
        btn.layer.borderWidth = .5;
        [btn setTitleColor:UIColorFromHex(0xbfbfbf) forState:UIControlStateNormal];
        btn.titleLabel.font = font15;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btn_Action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.arrM_Btn addObject:btn];
        x = x + wwwww + 10;
    }
    self.height = y + h;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(SS_SJ_V_Delegate_UP)]) {
        [self.delegate SS_SJ_V_Delegate_UP];
    }
}

-(void)btn_Action:(UIButton*)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(SS_SJ_V_Delegate_Action:VC:Name:)]) {
        [self.delegate SS_SJ_V_Delegate_Action:btn.tag VC:self Name:btn.titleLabel.text];
    }
}




@end
