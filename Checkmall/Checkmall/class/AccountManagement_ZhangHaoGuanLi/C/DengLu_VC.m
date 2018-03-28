//
//  DengLu_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DengLu_VC.h"
#import "MyUIScrollView.h"//自定义
#import "ZhuCe_VC.h"//注册
#import "WangJiMiMa_VC.h"//忘记密码
#import "BangDingShouJi_VC.h"//绑定手机
#import <ShareSDK/ShareSDK.h>//sharSDK

@interface DengLu_VC ()<UITextViewDelegate>{
    MyUIScrollView  *scrollV;//滑动背景
    UIImageView     *imageV_BJ;//背景
    
    UIButton        *btn_MiMa;//密码
    UIButton        *btn_YanZhengMa;//验证码
    BOOL            bool_DLFS;//登录方式
    UIView          *view_DLFS_XZ;//登录方式选择
    
    UITextField     *txt_SJH;//手机号
    UITextField     *txt_MM;//密码
    UITextField     *txt_YZM;//验证码
    UIImageView *right_Image_MM;
    
    BOOL            bool_MM_KJ;//密码是否可见
    
    UIButton        *btn_YZM;//获取验证码
    NSInteger        int_DJS;//倒计时
    NSTimer         *timer;//计时器
    
    UIButton        *btn_WJMM;//忘记密码
    
    UIButton        *btn_DL;//登录
    
    UIButton        *btn_WXDL;//微信登录
}

@end

@implementation DengLu_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    bool_MM_KJ = YES;
    self.title = @"登录";
    [self init_UI];
    
    [self setLeftItemWithIcon:[UIImage imageNamed:@"GuanBi"] title:@"" selector:@selector(dismiss)];
    [self setRightItemWithTitle:@"注册" selector:@selector(right_Action)];
}

#pragma mark- 注册
- (void)right_Action{
    ZhuCe_VC *vc = [[ZhuCe_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark- 初始化
-(void)init_UI{
    imageV_BJ = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - kStatusBarAndNavigationBarHeight )];
    imageV_BJ.image = [UIImage imageNamed:@"DengLuBeiJing"];
    imageV_BJ.contentMode = UIViewContentModeScaleAspectFill;
    imageV_BJ.clipsToBounds = YES;
    [self.view addSubview:imageV_BJ];
    
    UIView  *view_FGX = [[UIView alloc]initWithFrame:CGRectMake((ScreenWidth - .5) / 2, 65, .5, 25)];
    view_FGX.backgroundColor = UIColorFromHex(0xbfbfbf);
    [self.view addSubview:view_FGX];
    
    //密码登录
    btn_MiMa = [[UIButton alloc]initWithFrame:CGRectMake((view_FGX.left - 80) / 2, view_FGX.top - 3, 80, 30)];
    [btn_MiMa setTitle:@"密码登录" forState:UIControlStateNormal];
    [btn_MiMa setTitleColor:UIColorFromHex(0x666666) forState:UIControlStateNormal];
    [btn_MiMa setTitleColor:UIColorFromHex(0x5db851) forState:UIControlStateSelected];
    btn_MiMa.titleLabel.font = font15;
    [btn_MiMa addTarget:self action:@selector(DLFS_Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_MiMa];
    
    //验证码登录
    btn_YanZhengMa = [[UIButton alloc]initWithFrame:CGRectMake(view_FGX.right +(view_FGX.left - 80) / 2, view_FGX.top - 3, 80, 30)];
    [btn_YanZhengMa setTitle:@"验证码登录" forState:UIControlStateNormal];
    [btn_YanZhengMa setTitleColor:UIColorFromHex(0x666666) forState:UIControlStateNormal];
    [btn_YanZhengMa setTitleColor:UIColorFromHex(0x5db851) forState:UIControlStateSelected];
    btn_YanZhengMa.titleLabel.font = font15;
    [btn_YanZhengMa addTarget:self action:@selector(DLFS_Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_YanZhengMa];
    
    //选中分割线
    view_DLFS_XZ = [[UIView alloc]initWithFrame:CGRectMake(btn_MiMa.left, btn_MiMa.bottom, btn_MiMa.width, 1.5)];
    view_DLFS_XZ.backgroundColor = UIColorFromHex(0x5db851);
    [self.view addSubview:view_DLFS_XZ];
    
    //手机号
    txt_SJH = [[UITextField alloc]initWithFrame:CGRectMake(22, view_DLFS_XZ.bottom + 40, ScreenWidth - 22*2, 44)];
    txt_SJH.layer.masksToBounds = YES;
    txt_SJH.layer.cornerRadius = txt_SJH.height / 2;
    txt_SJH.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_SJH.layer.borderWidth = .5;
    txt_SJH.keyboardType = UIKeyboardTypeNumberPad;
    txt_SJH.backgroundColor = [UIColor whiteColor];
    txt_SJH.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_SJH.font = font15;
    UIView *leftView_SJH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 0)];
    leftView_SJH.backgroundColor = [UIColor whiteColor];
    txt_SJH.leftView = leftView_SJH;
    txt_SJH.leftViewMode = UITextFieldViewModeAlways;
    txt_SJH.placeholder = @"请输入手机号";
    txt_SJH.text = [kUserDefaults objectForKey:YongHuMing];

    [self.view addSubview:txt_SJH];
    
    //密码
    txt_MM = [[UITextField alloc]initWithFrame:CGRectMake(txt_SJH.left, txt_SJH.bottom + 15, ScreenWidth - 22*2, 44)];
    txt_MM.layer.masksToBounds = YES;
    txt_MM.layer.cornerRadius = txt_MM.height / 2;
    txt_MM.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_MM.layer.borderWidth = .5;
    txt_MM.backgroundColor = [UIColor whiteColor];
    txt_MM.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_MM.font = font15;
    txt_MM.text = [kUserDefaults objectForKey:MiMa];
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
    
    //验证码
    txt_YZM = [[UITextField alloc]initWithFrame:txt_MM.frame];
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
    [self if_DDFS];
    
    //忘记密码
    btn_WJMM = [[UIButton alloc]initWithFrame:CGRectMake(txt_MM.right - 80, txt_MM.bottom, 80, 50)];
    [btn_WJMM setTitleColor:UIColorFromHex(0xff7800) forState:UIControlStateNormal];
    btn_WJMM.titleLabel.font = font13;
    [btn_WJMM setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [btn_WJMM addTarget:self action:@selector(btn_WJMM_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_WJMM];
    
    //登录
    btn_DL = [[UIButton alloc]initWithFrame:txt_MM.frame];
    btn_DL.top = btn_WJMM.bottom;
    btn_DL.layer.masksToBounds = YES;
    btn_DL.layer.cornerRadius = txt_YZM.height / 2;
    btn_DL.backgroundColor = UIColorFromHex(0xff7800);
    [btn_DL setTitle:@"登录" forState:UIControlStateNormal];
    btn_DL.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn_DL setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_DL addTarget:self action:@selector(btn_DL_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_DL];
    
    //协议
    UITextView  *txtV_XX = [[UITextView alloc]initWithFrame:btn_DL.frame];
    txtV_XX.mj_x = btn_DL.left + 10;
    txtV_XX.top = btn_DL.bottom+ 5;
    txtV_XX.height = 25;
    txtV_XX.font = font13;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"登录即为同意《车客生鲜注册协议》"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"xieyi://"
                             range:[[attributedString string] rangeOfString:@"《车客生鲜注册协议》"]];
    txtV_XX.attributedText = attributedString;
    txtV_XX.linkTextAttributes = @{NSForegroundColorAttributeName: UIColorFromHex(0x85ca7c),
                                     NSUnderlineColorAttributeName: UIColorFromHex(0x999999),
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    txtV_XX.delegate = self;
    txtV_XX.editable = NO;        //必须禁止输入，否则点击将弹出输入键盘
    txtV_XX.scrollEnabled = NO;
    [self.view addSubview:txtV_XX];
    
    
    btn_WXDL = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - 45) / 2,ScreenHeight - kStatusBarAndNavigationBarHeight - kTabbarSafeBottomMargin - 27 - 45, 45, 45)];
    [btn_WXDL setBackgroundImage:[UIImage imageNamed:@"WeiXinDengLu"] forState:UIControlStateNormal];
    [btn_WXDL addTarget:self action:@selector(btn_WXDL_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_WXDL];
    
    UIView *view_FGX_WX = [[UIView alloc]initWithFrame:CGRectMake(22, btn_WXDL.top - 31.5, ScreenWidth - 22 * 2, .5)];
    view_FGX_WX.backgroundColor = UIColorFromHex(0xbfbfbf);
    [self.view addSubview:view_FGX_WX];
    
    UILabel *lbl_WXDL = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth - 87) / 2, view_FGX_WX.top - 10, 87, 20)];
    lbl_WXDL.text = @"微信登录";
    lbl_WXDL.backgroundColor = [UIColor whiteColor];
    lbl_WXDL.textColor = UIColorFromHex(0x666666);
    lbl_WXDL.font = font13;
    lbl_WXDL.textAlignment = 1;
    [self.view addSubview:lbl_WXDL];
    
    
    [self if_MMKJ];
}

#pragma mark- 微信登录
- (void)btn_WXDL_Action{
    //例如QQ的登录
    [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
//             NSLog(@"uid=%@",user.uid);
//             NSLog(@"%@",user.credential);
//             NSLog(@"token=%@",user.credential.token);
//             NSLog(@"nickname=%@",user.nickname);
//             NSLog(@"unionid == %@",user.rawData[@"unionid"]);
             [self WeiXinDL:user.rawData[@"unionid"] name:user.nickname image_TX:user.icon];
         }
         
         else
         {
             [MyHelper showMessage:@"微信授权登录失败！"];
             NSLog(@"%@",error);
         }
         
     }];

}

- (void)WeiXinDL:(NSString *)unionid name:(NSString *)name image_TX:(NSString*)image{
    
    NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    NSDictionary *dic = @{@"type":@"4",@"facility":deviceUUID,@"unionid":unionid};
    [NetRequest postWithUrl:login_wxLogin params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"微信登录 == %@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            NSDictionary *dic_Data = dict[@"data"];
            if ([dic_Data[@"status"] boolValue]) {
                NSDictionary *dic_data = dict[@"data"];
                [kUserDefaults setObject:txt_SJH.text forKey:YongHuMing];
                [kUserDefaults setObject:txt_MM.text forKey:MiMa];
                [kUserDefaults setBool:YES forKey:DengLuZhuangTai];
                [kUserDefaults setObject:dic_data[@"token"] forKey:MYtoken];
                
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }else{
                BangDingShouJi_VC *vc = [[BangDingShouJi_VC alloc]init];
                vc.str_Name = name;
                vc.str_UnionID = unionid;
                vc.str_Image_TX = image;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 协议点击
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"xieyi"]) {
        NSLog(@"协议");
        return NO;
    }
    return YES;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    txt_SJH.text = [kUserDefaults objectForKey:YongHuMing];
    txt_MM.text = [kUserDefaults objectForKey:MiMa];

}

#pragma mark- 忘记密码
- (void)btn_WJMM_Action{
    WangJiMiMa_VC *vc = [[WangJiMiMa_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 获取验证码
- (void)btn_YZM_Action{
    [btn_YZM setEnabled:NO];
    int_DJS = 60;
    [btn_YZM setTitleColor:UIColorFromHex(0x333333) forState:UIControlStateNormal];

    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
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
        [btn_YZM setTitle:[NSString stringWithFormat:@"剩余%li秒",int_DJS] forState:UIControlStateNormal];
        int_DJS -- ;
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

#pragma mark- 登录
- (void)btn_DL_Action{
    if (bool_MM_KJ) {
        //验证码
        if (![MyHelper isPhone:txt_SJH.text]){
            [MyHelper showMessage:@"请输入正确的手机号！"];
        }else if(txt_YZM.text.length == 0  ){
            [MyHelper showMessage:@"请输入验证码！"];
        }else{
            [self YZMDL];
        }
    }else{
        //密码
        if (![MyHelper isPhone:txt_SJH.text]){
            [MyHelper showMessage:@"请输入正确的手机号！"];
        }else if(txt_MM.text.length < 6 || txt_MM.text.length > 15){
            [MyHelper showMessage:@"密码长度为6~15位！"];
        }else{
            [self SJHDL];
        }
    }

}
#pragma mark- 验证码登录
- (void)YZMDL{
    NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    NSDictionary *dic_encryptData = @{@"tel":txt_SJH.text,@"code":txt_YZM.text,@"type":@"4",@"facility":deviceUUID};
    NSString * str_encryptData = [RSA_Object encryptString:[MyHelper toJson:dic_encryptData] publicKey:RSA_public_key];
    
    NSDictionary *dic = @{@"encryptData":str_encryptData,@"act":@"verification"};
    [NetRequest postWithUrl:login_getUserInfo params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        if ([dict[@"code"] integerValue] == 1) {
            NSDictionary *dic_data = dict[@"data"];
            [kUserDefaults setObject:txt_SJH.text forKey:YongHuMing];
//            [kUserDefaults setObject:txt_MM.text forKey:MiMa];
            [kUserDefaults setBool:YES forKey:DengLuZhuangTai];
            [kUserDefaults setObject:dic_data[@"token"] forKey:MYtoken];
            
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        NSLog(@"登录 == %@ ==  %@",dict,[MyHelper toJson:dict]);
    } fail:^(id error) {
        
    }];
}

#pragma mark- 手机号登录
- (void)SJHDL{
    NSDictionary *dic_encryptData = @{@"tel":txt_SJH.text,@"password":txt_MM.text};
    NSString * str_encryptData = [RSA_Object encryptString:[MyHelper toJson:dic_encryptData] publicKey:RSA_public_key];
    NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSDictionary *dic = @{@"encryptData":str_encryptData,@"act":@"login",@"type":@"4",@"facility":deviceUUID};
    [NetRequest postWithUrl:login_getUserInfo params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        if ([dict[@"code"] integerValue] == 1) {
            NSDictionary *dic_data = dict[@"data"];
            [kUserDefaults setObject:txt_SJH.text forKey:YongHuMing];
            [kUserDefaults setObject:txt_MM.text forKey:MiMa];
            [kUserDefaults setBool:YES forKey:DengLuZhuangTai];
            [kUserDefaults setObject:dic_data[@"token"] forKey:MYtoken];
            
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
        NSLog(@"登录 == %@ ==  %@",dict,[MyHelper toJson:dict]);
    } fail:^(id error) {
        
    }];
}

- (void)DLFS_Action:(UIButton*)btn{
    if (btn_MiMa == btn) {
        //密码
        bool_DLFS = NO;
    }else{
        //验证码
        bool_DLFS = YES;
    }
    [self if_DDFS];
}

-(void)if_DDFS{
    if (!bool_DLFS) {
        btn_MiMa.selected = YES;
        btn_YanZhengMa.selected = NO;
        view_DLFS_XZ.mj_x = btn_MiMa.left;
        
        txt_MM.hidden = NO;
        txt_YZM.hidden = YES;
        btn_WJMM.hidden = NO;
    }else{
        btn_MiMa.selected = NO;
        btn_YanZhengMa.selected = YES;
        view_DLFS_XZ.mj_x = btn_YanZhengMa.left;
        
        txt_MM.hidden = YES;
        txt_YZM.hidden = NO;
        btn_WJMM.hidden = YES;
    }
}



@end
