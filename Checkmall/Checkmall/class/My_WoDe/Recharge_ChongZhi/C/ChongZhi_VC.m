//
//  ChongZhi_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/9.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ChongZhi_VC.h"
#import "TC_DHJ_V.h"
#import "ZhiFuWenJian.h"//支付文件
#import "WeiXinZhiFu_Model_RootClass.h"//微信支付文件
#import "DingDanZhuangTai_Model_RootClass.h"

@interface ChongZhi_VC ()<UITextViewDelegate,UITextFieldDelegate,TC_DHJ_V_Delegate>{
    UILabel         *lbl_ZH;//当前账号
    UILabel         *lbl_YE;//余额
    NSMutableArray  *arr_Btn;//按钮
    NSMutableArray  *arr_lbl;//充值金额lbl
    UILabel         *lbl_JQ;//充值金钱数量
    UITextField     *txt_SL;//充值数量
    UIButton        *btn_CZ;//充值
    NSInteger            int_ZDY;//类别数量
    UITextView *txtV_XX;//充值协议
    WeiXinZhiFu_Model_RootClass *model_WX;//微信支付model
    NSString                *str_DDID;//订单id
    UIButton             *btn_FL;
    DingDanZhuangTai_Model_RootClass    *model;
}

@property (nonatomic,weak)TC_DHJ_V      *DHJ;//兑换券

@end

@implementation ChongZhi_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arr_Btn = [[NSMutableArray alloc]init];
    arr_lbl = [[NSMutableArray alloc]init];
    
    
    self.title = @"充值中心";
    [self init_UI];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ZFHS:) name:@"ZFHD" object:nil];
}

- (void)ZFHS:(NSNotification *)notification;{
    if ([notification.object isEqualToString:@"微信"]) {
        [self UP_DD];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark- 刷新订单
-(void)UP_DD{
    if (str_DDID) {
        
        if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
            [self QuDeLu];
            return;
        }
        
        NSString *str_JE = @"";
        switch (int_ZDY) {
            case 0:
                str_JE= @"50";
                break;
            case 1:
                str_JE= @"100";
                break;
            case 2:
                str_JE= @"200";
                break;
            case 3:
                str_JE= @"500";
                break;
            case 4:
                str_JE= @"1000";
                break;
            case 5:
                str_JE= txt_SL.text;
                break;
            default:
                break;
        }
        NSDictionary *dic = @{@"order_sn":str_DDID,@"paytype":@"1",@"token":[MyHelper toToken],@"money":str_JE};
        [NetRequest postWithUrl:Order_returnStatus params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"支付状态 == %@",dict);
            model = [[DingDanZhuangTai_Model_RootClass alloc]initWithDictionary:dict];
            if (model.data.sta) {
                [kUserDefaults setObject:model.data.money forKey:YuE];
                lbl_YE.text = [NSString stringWithFormat:@"￥%@",model.data.money];
                [self.window addSubview:self.DHJ];
                [self.DHJ.imageV_TP sd_setImageWithURL:[MyHelper imaeg_URL:model.data.path view:self.DHJ.imageV_TP] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
                self.DHJ.lbl_LBMC.text = model.data.name;
                self.DHJ.lbl_SJ.text =[NSString stringWithFormat:@"%@到期",model.data.endtime];
                
            }else{
                [MyHelper showMessage:model.msg];
            }
        } fail:^(id error) {
            
        }];
    }
}

-(TC_DHJ_V *)DHJ{
    if (!_DHJ) {
        TC_DHJ_V *DHJ = [TC_DHJ_V init_Xib];
        _DHJ = DHJ;
        _DHJ.frame = self.window.bounds;
        _DHJ.delegate = self;
    }
    return _DHJ;
}

-(void)TC_DHJ_V_Delegate_Action{
    NSLog(@"立即领取");
    
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSDictionary *dic = @{@"cid":[NSString stringWithFormat:@"%li",model.data.idField],@"cname":model.data.name,@"order_sn":str_DDID,@"token":[MyHelper toToken]};
    [NetRequest postWithUrl:Coupon_receiveCoin params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"领取优惠劵==  %@",dict);
        if ([dict[@"code"] integerValue]) {
            [MyHelper showMessage:@"领取成功！"];
        }else{
            [MyHelper showMessage:dict[@"msg"]];
        }
    } fail:^(id error) {
        
    }];
}

#pragma mark- 初始化
- (void)init_UI{
    self.view.backgroundColor = RGBA(239, 239, 239, 1);
    
    UIImageView *image_BJ = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, ScreenWidth - 30, 100)];
    image_BJ.image = [UIImage imageNamed:@"ChongZhiBeiJing"];
    [self.view addSubview:image_BJ];
    
    lbl_ZH = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, image_BJ.width - 10 * 2, 38)];
    lbl_ZH.font = font14;
    lbl_ZH.textColor = UIColorFromHex(0x666666);
    lbl_ZH.text = [NSString stringWithFormat:@"当前账号：%@",[kUserDefaults objectForKey:YongHuMing]];
    [image_BJ addSubview:lbl_ZH];
    
    lbl_YE = [[UILabel alloc]initWithFrame:CGRectMake(image_BJ.width - 210, 39, 200, 60)];
    lbl_YE.font = [UIFont systemFontOfSize:26];
    lbl_YE.textColor = UIColorFromHex(0x333333);
    lbl_YE.text = [NSString stringWithFormat:@"￥%@",[kUserDefaults objectForKey:YuE]];
    lbl_YE.textAlignment = 2;
    [image_BJ addSubview:lbl_YE];
    
    UILabel *lbl_TS = [[UILabel alloc]initWithFrame:CGRectMake(10, 39, 110, 60)];
    lbl_TS.font = font12;
    lbl_TS.textColor = UIColorFromHex(0x5db851);
    lbl_TS.text = @"账户支付超快捷呦!";
    [image_BJ addSubview:lbl_TS];
    
    for (NSInteger i =0 ; i < 2; i ++) {
//        UIButton    *btn_AN = [[UIButton alloc]initWithFrame:CGRectMake(15 + i%3 * ((ScreenWidth - 15* 2 -10*2) / 3 + 10), (image_BJ.bottom + 15) + ( 10 + 65) * (i / 3), (ScreenWidth - 15* 2 -10*2) / 3, 65)];
        UIButton    *btn_AN = [[UIButton alloc]initWithFrame:CGRectMake(15 + i * ((ScreenWidth - 15* 2 - 10) / 2 + 10), (image_BJ.bottom + 15) , (ScreenWidth - 15* 2 -10) / 2, 65)];

        [btn_AN setBackgroundImage:[UIImage imageNamed:@"CZWXZ"] forState:UIControlStateNormal];
        [btn_AN setBackgroundImage:[UIImage imageNamed:@"CZXZ"] forState:UIControlStateSelected];
        btn_AN.tag = i;
        [btn_AN addTarget:self action:@selector(btn_AN_Action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn_AN];
        [arr_Btn addObject:btn_AN];
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 30, btn_AN.width - 10, 30)];
        lbl.font = [UIFont systemFontOfSize:16];
//        lbl.textColor = UIColorFromHex(0xff7800);
        lbl.textColor = UIColorFromHex(0x999999);

        if (i==0) {
             lbl.text = @"1000元";
        }else if (i==1) {
            lbl.text = @"2000元";
        }
        
        [btn_AN addSubview:lbl];
        [arr_lbl addObject:lbl];
    }
    
    btn_FL = [[UIButton alloc]initWithFrame:CGRectMake(15, image_BJ.bottom + 15 + ( 10 + 65) * 2, ScreenWidth - 15*2, 30)];
    [btn_FL setImage:[UIImage imageNamed:@"TiShi"] forState:UIControlStateNormal];
    [btn_FL setTitle:@" 单次充值满1000送鸡蛋兑换券" forState:UIControlStateNormal];
    btn_FL.titleLabel.font = font12;
    [btn_FL setTitleColor:UIColorFromHex(0x333333) forState:UIControlStateNormal];
    btn_FL.width = [MyHelper strWidth:btn_FL.titleLabel.text andFont:btn_FL.titleLabel.font andHeight:btn_FL.height] + 15;
    [self.view addSubview:btn_FL];
    
    //充值数量
    txt_SL = [[UITextField alloc]initWithFrame:CGRectMake(15, btn_FL.bottom , ScreenWidth - 15*2, 40)];
    txt_SL.delegate = self;
    txt_SL.layer.masksToBounds = YES;
    txt_SL.layer.cornerRadius = 5;
    txt_SL.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    txt_SL.layer.borderWidth = .5;
    txt_SL.backgroundColor = [UIColor whiteColor];
    txt_SL.clearButtonMode=UITextFieldViewModeWhileEditing;
    txt_SL.font = font15;
    UIView *leftView_SL = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 13, 0)];
    leftView_SL.backgroundColor = [UIColor whiteColor];
    txt_SL.leftView = leftView_SL;
    txt_SL.leftViewMode = UITextFieldViewModeAlways;
    txt_SL.placeholder = @"请输入充值金额";
    txt_SL.keyboardType = UIKeyboardTypeNumberPad;
    txt_SL.hidden = YES;
    [self.view addSubview:txt_SL];
    
    
    //充值
    btn_CZ = [[UIButton alloc]initWithFrame:CGRectMake(15, txt_SL.bottom + 10, ScreenWidth - 15 * 2, 40)];
    btn_CZ.layer.masksToBounds = YES;
    btn_CZ.layer.cornerRadius = 5;
    btn_CZ.titleLabel.font = [UIFont systemFontOfSize:18];
    btn_CZ.backgroundColor = UIColorFromHex(0xff7800);
    [btn_CZ setTitle:@"立即充值" forState:UIControlStateNormal];
    [btn_CZ setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn_CZ addTarget:self action:@selector(btn_CZ_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_CZ];
    
    txtV_XX = [[UITextView alloc]initWithFrame:CGRectMake(15 , btn_CZ.bottom+10, ScreenWidth - 15*2, 30)];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@" 我已经阅读并同意车客生鲜的充值协议"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"xieyi://"
                             range:[[attributedString string] rangeOfString:@"充值协议"]];
    
    UIImage *image = [UIImage imageNamed:@"XieYi"];
    CGSize size = CGSizeMake(12, 12);
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = resizeImage;
    NSMutableAttributedString *imageString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
    [imageString addAttribute:NSLinkAttributeName
                        value:@"checkbox://"
                        range:NSMakeRange(0, imageString.length)];
    [attributedString insertAttributedString:imageString atIndex:0];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, attributedString.length)];
    
    txtV_XX.attributedText = attributedString;
    txtV_XX.linkTextAttributes = @{NSForegroundColorAttributeName: UIColorFromHex(0x5db851),
                                   NSUnderlineColorAttributeName: UIColorFromHex(0x8b8b8b),
                                   NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    txtV_XX.delegate = self;
    txtV_XX.editable = NO;        //必须禁止输入，否则点击将弹出输入键盘
    txtV_XX.scrollEnabled = NO;
    txtV_XX.backgroundColor = [UIColor clearColor];
    [self.view addSubview:txtV_XX];
    
    UIImageView *imageV_CZXX = [[UIImageView alloc]initWithFrame:CGRectMake((ScreenWidth - 174) / 2, ScreenHeight - kStatusBarAndNavigationBarHeight - 75 - kTabbarSafeBottomMargin - 13, 174, 13)];
    imageV_CZXX.image = [UIImage imageNamed:@"ChongZhiXieYi"];
    [self.view addSubview:imageV_CZXX];
    
    UILabel     *lbl_XX = [[UILabel alloc]initWithFrame:CGRectMake(15, imageV_CZXX.bottom +7, ScreenWidth - 30, 15)];
    lbl_XX.font = [UIFont systemFontOfSize:11];
    lbl_XX.textColor = UIColorFromHex(0x999999);
    lbl_XX.text = @"1.储值金额暂不支持提现功能";
    [self.view addSubview:lbl_XX];
    
    
    [self if_ZDY];
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [self UP_YHJ];
    return YES;
}

#pragma mark-  //更新优惠劵送礼品
- (void)UP_YHJ{
    NSString *str_JE = @"";
    switch (int_ZDY) {
        case 0:
            str_JE= @"50";
            break;
        case 1:
            str_JE= @"100";
            break;
        case 2:
            str_JE= @"200";
            break;
        case 3:
            str_JE= @"500";
            break;
        case 4:
            str_JE= @"1000";
            break;
        case 5:
            str_JE= txt_SL.text;
            break;
        default:
            break;
    }
    
    [NetRequest postWithUrl:Coupon_getcoin_warn params:@{@"money_str":str_JE} showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"获取送的优惠劵 ==  %@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            NSDictionary *dic_data = dict[@"data"];
            btn_FL.hidden = NO;
            [btn_FL setTitle:[NSString stringWithFormat:@" 单次充值满%@送%@",str_JE,dic_data[@"name"]] forState:UIControlStateNormal];
            btn_FL.width = [MyHelper strWidth:btn_FL.titleLabel.text andFont:btn_FL.titleLabel.font andHeight:btn_FL.height] + 15;
        }else{
            btn_FL.hidden = YES;
        }
        
    } fail:^(id error) {
        
    }];
}

- (void)if_ZDY{
    if (int_ZDY == 5) {
        //自定义金额
        txt_SL.hidden = NO;
        btn_CZ.top = txt_SL.bottom + 10;
        txtV_XX.top =  btn_CZ.bottom+10;
    }else{
        txt_SL.hidden = YES;
        btn_CZ.top = txt_SL.top ;
        txtV_XX.top =  btn_CZ.bottom+10;

        
    }
}

#pragma mark- 充值按钮
-(void)btn_CZ_Action{
    
    //初始化提示框；
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择充值方式" preferredStyle: UIAlertControllerStyleActionSheet];
    
    __weak ChongZhi_VC *weak_Self = self;
    [alert addAction:[UIAlertAction actionWithTitle:@"微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        if (int_ZDY == 0) {
            [weak_Self ChongZhi:YES str_JE:@"50"];
        }else if (int_ZDY == 1){
            [weak_Self ChongZhi:YES str_JE:@"100"];
        }else if (int_ZDY == 2){
            [weak_Self ChongZhi:YES str_JE:@"200"];
        }else if (int_ZDY == 3){
            [weak_Self ChongZhi:YES str_JE:@"500"];
        }else if (int_ZDY == 4){
            [weak_Self ChongZhi:YES str_JE:@"1000"];
        }else if (int_ZDY == 5){
            if ([txt_SL.text integerValue] > 0) {
                [weak_Self ChongZhi:YES str_JE:txt_SL.text];
            }else{
                [MyHelper showMessage:@"请输入充值金额！"];
            }
        }
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
    return;
    
//    [self.window addSubview:self.DHJ];

}

#pragma mark- 充值接口 yes 微信 no 支付宝
- (void)ChongZhi:(BOOL)Y_N  str_JE:(NSString *)str_je{
    if (Y_N) {
        
        if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
            [self QuDeLu];
            return;
        }
        
        NSDictionary *dic = @{@"fee":str_je,@"token":[MyHelper toToken],@"paytype":@"1",@"paymode":@"1"};
        [NetRequest postWithUrl:order_getMessage params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"支付回调 = = %@",dict);
            model_WX = [[WeiXinZhiFu_Model_RootClass alloc]initWithDictionary:dict];
            if (model_WX.code == 1) {
                
                [ZhiFuWenJian WeiXinZhiFu_partnerId:model_WX.data.partnerid prepayId:model_WX.data.prepayid nonceStr:model_WX.data.noncestr timeStamp:model_WX.data.timestamp package:model_WX.data.packageField sign:model_WX.data.sign];
                str_DDID = model_WX.data.out_trade_no;
            }
        } fail:^(id error) {
            
        }];
    }

    
}

#pragma mark- 协议点击
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"xieyi"]) {
        NSLog(@"协议");
        
        web_VC *vc = [[web_VC alloc]init];
        vc.title = @"充值协议";
        vc.str_URL =@"http://www.jingchengcaidian.com/index/index/recharge";
        [self.navigationController pushViewController:vc animated:YES];
        
        return NO;
    }
    return YES;
}

-(void)btn_AN_Action:(UIButton*)btn{
    
    for (NSInteger i = 0; i<arr_Btn.count; i++) {
        UIButton*Button = arr_Btn[i];
        UILabel *lblbel = arr_lbl[i];
        if (btn == Button) {
            btn.selected = YES;
            lblbel.textColor = UIColorFromHex(0xff7800);
            int_ZDY = i;

        }else{
            Button.selected = NO;
            lblbel.textColor = UIColorFromHex(0x999999);
            
        }
    }
    [self if_ZDY];
    [self UP_YHJ];
}

@end
