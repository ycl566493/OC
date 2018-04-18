//
//  XiuGaiMiMa_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/18.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "XiuGaiMiMa_VC.h"

@interface XiuGaiMiMa_VC (){
    UIImageView     *imageV_BJ;//背景
    UITextField     *txt_YMM;//原密码
    UITextField     *txt_XMM;//新密码
    UITextField     *txt_QRMM;//确认密码
    UIButton        *btn_ZC;//提交
    
}

@end

@implementation XiuGaiMiMa_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    [self init_UI];
    
}

#pragma mark- 初始化
-(void)init_UI{
    imageV_BJ = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - kStatusBarAndNavigationBarHeight )];
    imageV_BJ.image = [UIImage imageNamed:@"DengLuBeiJing"];
    imageV_BJ.contentMode = UIViewContentModeScaleAspectFill;
    imageV_BJ.clipsToBounds = YES;
    [self.view addSubview:imageV_BJ];
    
    
    //原密码
    txt_YMM = [[UITextField alloc]initWithFrame:CGRectMake(22, 75, ScreenWidth - 22*2, 44)];
    txt_YMM.layer.masksToBounds = YES;
    txt_YMM.layer.cornerRadius = txt_YMM.height / 2;
    txt_YMM.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_YMM.layer.borderWidth = .5;
    txt_YMM.backgroundColor = [UIColor whiteColor];
    txt_YMM.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_YMM.font = font15;
    txt_YMM.secureTextEntry = YES;
    UIView *leftView_SJH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_SJH.backgroundColor = [UIColor whiteColor];
    txt_YMM.leftView = leftView_SJH;
    txt_YMM.leftViewMode = UITextFieldViewModeAlways;
    txt_YMM.placeholder = @"请输入原密码";
    [self.view addSubview:txt_YMM];
    
    //新密码
    txt_XMM = [[UITextField alloc]initWithFrame:txt_YMM.frame];
    txt_XMM.top = txt_YMM.bottom + 15;
    txt_XMM.layer.masksToBounds = YES;
    txt_XMM.layer.cornerRadius = txt_XMM.height / 2;
    txt_XMM.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_XMM.layer.borderWidth = .5;
    txt_XMM.secureTextEntry = YES;
    txt_XMM.backgroundColor = [UIColor whiteColor];
    txt_XMM.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_XMM.font = font15;
    txt_XMM.userInteractionEnabled = YES;
    
    UIView *leftView_YZM = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_YZM.backgroundColor = [UIColor whiteColor];
    txt_XMM.leftView = leftView_YZM;
    txt_XMM.leftViewMode = UITextFieldViewModeAlways;
    txt_XMM.placeholder = @"请输入新密码";
    [self.view addSubview:txt_XMM];
    
    
    //确认密码
    txt_QRMM = [[UITextField alloc]initWithFrame:txt_XMM.frame];
    txt_QRMM.top = txt_XMM.bottom + 15;
    txt_QRMM.layer.masksToBounds = YES;
    txt_QRMM.layer.cornerRadius = txt_QRMM.height / 2;
    txt_QRMM.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_QRMM.layer.borderWidth = .5;
    txt_QRMM.backgroundColor = [UIColor whiteColor];
    txt_QRMM.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_QRMM.font = font15;
    txt_QRMM.secureTextEntry = YES;
    UIView *leftView_MM = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_MM.backgroundColor = [UIColor whiteColor];
    txt_QRMM.leftView = leftView_MM;
    txt_QRMM.leftViewMode = UITextFieldViewModeAlways;
    txt_QRMM.placeholder = @"请再次输入密码";
    [self.view addSubview:txt_QRMM];
    
    UILabel *lbl_TS = [[UILabel alloc]initWithFrame:CGRectMake(txt_QRMM.left + 15, txt_QRMM.bottom, txt_QRMM.width - 15 * 2, 40)];
    lbl_TS.textColor = UIColorFromHex(0x999999);
    lbl_TS.font = font13;
    lbl_TS.text = @"密码长度6~15位，支持字母、数字、特殊字符";
    [self.view addSubview:lbl_TS];
    
    //提交
    btn_ZC = [[UIButton alloc]initWithFrame:txt_QRMM.frame];
    btn_ZC.top = lbl_TS.bottom ;
    btn_ZC.layer.masksToBounds = YES;
    btn_ZC.layer.cornerRadius = btn_ZC.height / 2;
    btn_ZC.titleLabel.font = [UIFont systemFontOfSize:18];
    btn_ZC.backgroundColor = UIColorFromHex(0xff7800);
    [btn_ZC setTitle:@"提交" forState:UIControlStateNormal];
    [btn_ZC setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_ZC addTarget:self action:@selector(btn_ZC_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_ZC];

}

#pragma mark- 提交
-(void)btn_ZC_Action{
    if (txt_YMM.text.length == 0 ){
        [MyHelper showMessage:@"请输入正确的手机号！"];
    }else if (txt_XMM.text.length == 0){
        [MyHelper showMessage:@"请输入新密码！"];
    }else if (txt_QRMM.text.length == 0){
        [MyHelper showMessage:@"请再次输入新密码！"];
    }else if (![txt_XMM.text isEqualToString:txt_QRMM.text]){
        [MyHelper showMessage:@"两次密码不相同，请再次输入！"];
        txt_XMM.text = @"";
        txt_QRMM.text = @"";
    }else{
        NSDictionary *dic = @{@"token":[MyHelper toToken],@"newpwd":txt_XMM.text,@"password":txt_YMM.text};
        
        [NetRequest postWithUrl:User_setModifyPwd params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            if ([dict[@"code"] integerValue] == 1) {
                [kUserDefaults setObject:@"" forKey:MiMa];
                [MyHelper showMessage:@"修改密码成功！"];
                [self.navigationController popViewControllerAnimated:YES];
            }
            NSLog(@"修改密码 == %@",dict);
        } fail:^(id error) {
            
        }];
    }
}


@end
