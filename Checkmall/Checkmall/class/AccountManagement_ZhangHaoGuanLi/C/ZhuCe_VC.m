//
//  ZhuCe_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhuCe_VC.h"
#import "RSA.h"

@interface ZhuCe_VC (){
    UIImageView     *imageV_BJ;//背景
    UITextField     *txt_SJH;//手机号
    UITextField     *txt_MM;//密码
    UITextField     *txt_YZM;//验证码
    UIImageView *right_Image_MM;
    BOOL            bool_MM_KJ;//密码是否可见
    UIButton        *btn_YZM;//获取验证码
    NSInteger        int_DJS;//倒计时
    NSTimer         *timer;//计时器
    UIButton        *btn_ZC;//注册

}

@end

@implementation ZhuCe_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    bool_MM_KJ = YES;
    self.title = @"注册";
    [self init_UI];
}
#pragma mark- 初始化
-(void)init_UI{
    imageV_BJ = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - kStatusBarAndNavigationBarHeight )];
    imageV_BJ.image = [UIImage imageNamed:@"DengLuBeiJing"];
    imageV_BJ.contentMode = UIViewContentModeScaleAspectFill;
    imageV_BJ.clipsToBounds = YES;
    [self.view addSubview:imageV_BJ];
    
    
    //手机号
    txt_SJH = [[UITextField alloc]initWithFrame:CGRectMake(22, 75, ScreenWidth - 22*2, 44)];
    txt_SJH.layer.masksToBounds = YES;
    txt_SJH.layer.cornerRadius = txt_SJH.height / 2;
    txt_SJH.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_SJH.layer.borderWidth = .5;
    txt_SJH.backgroundColor = [UIColor whiteColor];
    txt_SJH.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_SJH.font = font15;
    UIView *leftView_SJH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_SJH.backgroundColor = [UIColor whiteColor];
    txt_SJH.leftView = leftView_SJH;
    txt_SJH.leftViewMode = UITextFieldViewModeAlways;
    txt_SJH.placeholder = @"请输入手机号";
    [self.view addSubview:txt_SJH];
    
    //验证码
    txt_YZM = [[UITextField alloc]initWithFrame:txt_SJH.frame];
    txt_YZM.top = txt_SJH.bottom + 15;
    txt_YZM.layer.masksToBounds = YES;
    txt_YZM.layer.cornerRadius = txt_YZM.height / 2;
    txt_YZM.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_YZM.layer.borderWidth = .5;
    txt_YZM.backgroundColor = [UIColor whiteColor];
    txt_YZM.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_YZM.font = font15;
    txt_YZM.userInteractionEnabled = YES;
    
    UIView *leftView_YZM = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_YZM.backgroundColor = [UIColor whiteColor];
    txt_YZM.leftView = leftView_YZM;
    txt_YZM.leftViewMode = UITextFieldViewModeAlways;
    txt_YZM.placeholder = @"请输入验证码";
    
    btn_YZM= [[UIButton alloc]init];
    btn_YZM.size = CGSizeMake(85, 44);
    btn_YZM.contentMode = UIViewContentModeCenter;
    txt_YZM.rightView = btn_YZM;
    txt_YZM.rightViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:txt_YZM];
    
    //获取验证码
    [btn_YZM setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btn_YZM setTitleColor:UIColorFromHex(0xff7800) forState:UIControlStateNormal];
    
    btn_YZM.titleLabel.font = font13;
    [btn_YZM addTarget:self action:@selector(btn_YZM_Action) forControlEvents:UIControlEventTouchUpInside];
    
    //密码
    txt_MM = [[UITextField alloc]initWithFrame:txt_YZM.frame];
    txt_MM.top = txt_YZM.bottom + 15;

    txt_MM.layer.masksToBounds = YES;
    txt_MM.layer.cornerRadius = txt_MM.height / 2;
    txt_MM.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_MM.layer.borderWidth = .5;
    txt_MM.backgroundColor = [UIColor whiteColor];
    txt_MM.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_MM.font = font15;
    UIView *leftView_MM = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_MM.backgroundColor = [UIColor whiteColor];
    txt_MM.leftView = leftView_MM;
    txt_MM.leftViewMode = UITextFieldViewModeAlways;
    txt_MM.placeholder = @"请输入密码";
    
    right_Image_MM = [[UIImageView alloc]init];
    right_Image_MM.image = [UIImage imageNamed:@"BiYan"];
    right_Image_MM.size = CGSizeMake(44, 44);
    right_Image_MM.contentMode = UIViewContentModeCenter;
    txt_MM.rightView = right_Image_MM;
    txt_MM.rightViewMode = UITextFieldViewModeAlways;
    right_Image_MM.userInteractionEnabled = YES;
    UITapGestureRecognizer *right_Image_MM_Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(right_Image_MM_Click:)];
    [right_Image_MM addGestureRecognizer:right_Image_MM_Tap];
    [self.view addSubview:txt_MM];
    
    UILabel *lbl_TS = [[UILabel alloc]initWithFrame:CGRectMake(txt_MM.left + 15, txt_MM.bottom, txt_MM.width - 15 * 2, 40)];
    lbl_TS.textColor = UIColorFromHex(0x999999);
    lbl_TS.font = font13;
    lbl_TS.text = @"密码长度6~15位，支持字母、数字、特殊字符";
    [self.view addSubview:lbl_TS];
    
    //注册
    btn_ZC = [[UIButton alloc]initWithFrame:txt_MM.frame];
    btn_ZC.top = lbl_TS.bottom ;
    btn_ZC.layer.masksToBounds = YES;
    btn_ZC.layer.cornerRadius = txt_YZM.height / 2;
    btn_ZC.titleLabel.font = [UIFont systemFontOfSize:18];
    btn_ZC.backgroundColor = UIColorFromHex(0xff7800);
    [btn_ZC setTitle:@"注册" forState:UIControlStateNormal];
    [btn_ZC setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_ZC addTarget:self action:@selector(btn_ZC_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_ZC];
    
    [self if_MMKJ];
}

#pragma mark- 注册
-(void)btn_ZC_Action{
    if (![MyHelper isPhone:txt_SJH.text]){
        [MyHelper showMessage:@"请输入正确的手机号！"];
    }else if(txt_YZM.text.length == 0){
        [MyHelper showMessage:@"请输入验证码！"];
    }else if(txt_MM.text.length < 6 || txt_MM.text.length > 15){
        [MyHelper showMessage:@"密码长度6~15位！"];
    }else{
        NSLog(@"注册");
        NSDictionary *dic_encryptData = @{@"code":txt_YZM.text,@"tel":txt_SJH.text,@"password":txt_MM.text};
        NSString * str_encryptData = [RSA encryptString:[MyHelper toJson:dic_encryptData] publicKey:RSA_public_key];

        NSDictionary *dic = @{@"encryptData":str_encryptData,@"act":@"register"};
        [NetRequest postWithUrl:login_getUserInfo params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            if ([dict[@"code"] integerValue] == 1) {
                [kUserDefaults setObject:txt_SJH.text forKey:YongHuMing];
                [kUserDefaults setObject:txt_MM.text forKey:MiMa];
            }
            NSLog(@"注册 == %@",dict);
        } fail:^(id error) {
            
        }];
    }
}

-(void)dealloc{
    // 停止定时器
    [timer invalidate];
    timer = nil;
}


#pragma mark- 右边图片点击时间
- (void)right_Image_MM_Click:(UITapGestureRecognizer*)tag{
    bool_MM_KJ = !bool_MM_KJ;
    [self if_MMKJ];
}

#pragma mark- 判断密码是否可见
- (void)if_MMKJ{
    if (bool_MM_KJ) {
        right_Image_MM.image = [UIImage imageNamed:@"BiYan"];
        
        NSString *tempPwdStr = txt_MM.text;
        txt_MM.text = @""; // 这句代码可以防止切换的时候光标偏移
        txt_MM.secureTextEntry = YES;
        txt_MM.text = tempPwdStr;

    }else{
        right_Image_MM.image = [UIImage imageNamed:@"KaiYan"];

        NSString *tempPwdStr = txt_MM.text;
        txt_MM.text = @""; // 这句代码可以防止切换的时候光标偏移
        txt_MM.secureTextEntry = NO;
        txt_MM.text = tempPwdStr;
    }
    
}


#pragma mark- 获取验证码
- (void)btn_YZM_Action{
    if (![MyHelper isPhone:txt_SJH.text]){
        [MyHelper showMessage:@"请输入正确的手机号！"];
    }else{
        NSString * str_JM = [RSA encryptString:txt_SJH.text publicKey:RSA_public_key];
        [NetRequest postWithUrl:message_getIphone params:@{@"iphone":str_JM,@"type":@"register"} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
           
            NSLog(@"发送验证码===  %@ \n%@",dict,[MyHelper toJson:dict]);
            if ([dict[@"code"] integerValue] == 1) {
                [btn_YZM setEnabled:NO];
                int_DJS = 60;
                timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action:) userInfo:nil repeats:YES];
                [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
            }
        } fail:^(id error) {
        }];
    }
 
}

- (void)action:(NSTimer *)sender {
    if (int_DJS  == 0) {
        // 停止定时器
        [timer invalidate];
        timer = nil;
        [btn_YZM setEnabled:YES];
        [btn_YZM setTitleColor:UIColorFromHex(0xff7800) forState:UIControlStateNormal];
        [btn_YZM setTitle:@"获取验证码" forState:UIControlStateNormal];
        
    }else{
        [btn_YZM setTitleColor:UIColorFromHex(0x333333) forState:UIControlStateNormal];

        [btn_YZM setTitle:[NSString stringWithFormat:@"剩余%li秒",int_DJS] forState:UIControlStateNormal];
        int_DJS -- ;
    }
}



@end
