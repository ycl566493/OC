//
//  WenBenShuRu_VC.m
//  同文同书
//
//  Created by 信码互通 on 2017/7/21.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "WenBenShuRu_VC.h"
#import "MyUITextView.h"

@interface WenBenShuRu_VC (){
    
   
}

@property(nonatomic,strong)UILabel             *lbl_Title;
@property(nonatomic,strong) MyUITextView      *txtV;
@end

@implementation WenBenShuRu_VC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self init_UI];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

-(UILabel *)lbl_Title{
    if (!_lbl_Title) {
        _lbl_Title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, ScreenWidth, 20)];
        _lbl_Title.font = font1;
    }
    return _lbl_Title;
}

-(MyUITextView *)txtV{
    if (!_txtV) {
        _txtV = [[MyUITextView alloc]initWithFrame:CGRectMake(10, self.lbl_Title.bottom+10, ScreenWidth - 20, 100)];
        _txtV.placeholder = @"请输入";
        _txtV.layer.borderColor = UIColorFromHex(0x999999).CGColor;
        _txtV.layer.borderWidth = .5;
    }
    return _txtV;
}

#pragma mark- 初始化
- (void)init_UI{
   
    [self.view addSubview:self.lbl_Title];

    
    [self.view addSubview:self.txtV];
    
    [self setRightItemWithTitle:@"完成" selector:@selector(WC)];
    [self setLeftItemWithIcon:nil title:@"取消" selector:@selector(backAction:)];
    
//    [self.rightBarBtn setTitle:@"完成" forState:UIControlStateNormal];
//    [self.rightBarBtn addTarget:self action:@selector(WC) forControlEvents:UIControlEventTouchUpInside];
//    self.rightBarBtn.hidden = NO;
    
//    [self.leftBarBtn setTitle:@"取消" forState:UIControlStateNormal];
}

#pragma mark- 完成
- (void)WC{
    if ([self.txtV.text isEqualToString:@""]) {
        [MyHelper showMessage:@"信息不可为空！"];
        return;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(WenBenShuRu_VC_delegate_XX: tag:)]) {
        [self.delegate WenBenShuRu_VC_delegate_XX:self.txtV.text tag:self.view.tag];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setStr_title:(NSString *)str_title{
    self.lbl_Title.text = str_title;
}

-(void)setStr_NR:(NSString *)str_NR{
    self.txtV.text = str_NR;
    [self.txtV setNeedsDisplay];
}


@end
