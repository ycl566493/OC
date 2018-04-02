//
//  QueRenDingDan_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/13.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "QueRenDingDan_VC.h"
#import "DiZhiXinXi_V.h"//地址信息
#import "ShangPinXinXi_Cell.h"//商品信息
#import "ShangPinJiaJian_V.h"//加减
#import "PeiSongFangShi_V.h"//配送方式
#import "ZhiFuFangShi_V.h"//支付方式
#import "ZhiFuChengGong_VC.h"//支付成功
#import "DiZhiLieBiao_VC.h"//地址信息
#import "WeiXinZhiFu_Model_RootClass.h"//
#import "ZhiFuWenJian.h"//支付文件

@interface QueRenDingDan_VC ()<DiZhiXinXi_V_Delegate,DiZhiLieBiao_VC_Delegate>{
    UIScrollView    *scrollV;
    NSInteger           dz_id;//地址id

    BOOL            bool_PS;//配送方式 0 自提 1 快递
    WeiXinZhiFu_Model_RootClass *model_WX;
    NSString            *str_DDID;//订单id
}

@property (nonatomic,weak)DiZhiXinXi_V   *DZ;//地址信息

@property (nonatomic,weak)ShangPinXinXi_Cell *SP;//商品信息

@property (nonatomic,weak)ShangPinJiaJian_V     *JJ;//加减

@property (nonatomic,weak)PeiSongFangShi_V      *PS;//配送方式

@property (nonatomic,weak)ZhiFuFangShi_V        *ZFFS;//支付方式

@end

@implementation QueRenDingDan_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.width = ScreenWidth;
    
    bool_PS = 0;
    self.title = @"确认订单";
    [self init_UI];
    
    self.view.backgroundColor = UIColorFromHex(0xf2f2f2);
    
    [self UP_UI];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ZFHD) name:@"ZFHD" object:nil];
}

#pragma mark- 支付回调
- (void)ZFHD{
    [self UP_DD];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

#pragma mark- 刷新订单
-(void)UP_DD{
    if (str_DDID) {
        [NetRequest postWithUrl:Order_returnStatus params:@{@"order_sn":str_DDID,@"paytype":@"2",@"token":[MyHelper toToken]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"支付状态 == %@",dict);
            if ([dict[@"code"] integerValue] == 1) {
                [MyHelper showMessage:@"付款成功！"];

                ZhiFuChengGong_VC *vc = [[ZhiFuChengGong_VC alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }else{
                [MyHelper showMessage:dict[@"msg"]];

            }
        } fail:^(id error) {
            
        }];
    }
}

- (void)UP_UI{
    
    QueRenDingDan_Model_Arr *MMMMMM = self.model.data.arr[0];
    self.SP.Model = MMMMMM;
    
    if (!self.model.data.isfirst) {
        self.DZ.bool_SC = YES;
    }else{
        self.DZ.bool_SC = NO;
        
        self.DZ.lbl_Name.text = [NSString stringWithFormat:@"%@ %@",self.model.data.address.username,self.model.data.address.phone];
        self.DZ.lbl_DZXX.text = [NSString stringWithFormat:@"%@ %@",self.model.data.address.addressto,self.model.data.address.address];
        dz_id = self.model.data.address.idField;
        if (self.model.data.address.status == 2) {
            self.DZ.bool_FS = 0;
            self.DZ.lbl_ZTD.text = self.model.data.address.mername;
            self.PS.bool_PS = 0;
        }else{
            self.DZ.bool_FS = 1;
            self.PS.bool_PS = 1;
            
        }
        self.DZ.height = [DiZhiXinXi_V FS:self.DZ.bool_FS str_NR:self.DZ.lbl_DZXX.text];
        
    }
    
    self.SP.top = self.DZ.bottom;
    self.PS.top = self.SP.bottom;
    self.ZFFS.top = self.PS.bottom;
    
    
    scrollV.contentSize = CGSizeMake(0, self.ZFFS.bottom);
    
    CGFloat ffff= 0.00;
    for (QueRenDingDan_Model_Arr *MMMMMM in self.model.data.arr) {
        ffff += [MMMMMM.price floatValue] * [MMMMMM.number integerValue];
    }
    
    self.lbl_JE.text =[NSString stringWithFormat:@"订单金额：%.2f",ffff];
    
}

#pragma mark- 支付下单
- (IBAction)ZF_Action:(id)sender {
    NSLog(@"支付");
    if (dz_id == 0) {
        [MyHelper showMessage:@"请选择收货地址！"];
        return;
    }else{
        
        NSMutableArray  *arr_Data = [[NSMutableArray alloc]init];
        QueRenDingDan_Model_Arr *MMM = self.model.data.arr[0];
        NSMutableDictionary *dic_DDDDDD = [[NSMutableDictionary alloc]init];
        [dic_DDDDDD setObject:[NSString stringWithFormat:@"%li",MMM.gid] forKey:@"goodsid"];
        [dic_DDDDDD setObject:MMM.price forKey:@"price"];
        [dic_DDDDDD setObject:[NSString stringWithFormat:@"%@",MMM.number] forKey:@"num"];
        [arr_Data addObject:[MyHelper toJson:dic_DDDDDD]];
        
        if (arr_Data.count == 0) {
            return;
        }
        //       type 商品类型 1 拼团 2 开团 3 单独购买 4今日团购 5兑换 6接龙
        // paymode 支付方式 1 微信 2 支付宝 3 余额支付
        
        NSDictionary *dic = @{@"token":[MyHelper toToken],@"car":arr_Data,@"type":@"3",@"paymode":@"1",@"addressid":[NSString stringWithFormat:@"%li",dz_id],@"paytype":@"2",@"coupon_amount":@"1",@"shipping_amount":@"1"};
        
        [NetRequest postWithUrl:order_getMessage params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"下单返回 ==  %@",dict);
            model_WX = [[WeiXinZhiFu_Model_RootClass alloc]initWithDictionary:dict];
            if (model_WX.code == 1) {
                
                [ZhiFuWenJian WeiXinZhiFu_partnerId:model_WX.data.partnerid prepayId:model_WX.data.prepayid nonceStr:model_WX.data.noncestr timeStamp:model_WX.data.timestamp package:model_WX.data.packageField sign:model_WX.data.sign];
                str_DDID = model_WX.data.out_trade_no;
            }
        } fail:^(id error) {
            
        }];
    }
}

#pragma mark- 地址点击
-(void)DiZhiXinXi_V_Delegate_Action{
    DiZhiLieBiao_VC *vc = [[DiZhiLieBiao_VC alloc]init];
    vc.delegate = self;
    vc.bool_SH = !self.model.data.distribution;
    [self.navigationController pushViewController:vc animated:YES];
}

//地址列表回调 fs快递方式 0 自提 1 快递
-(void)DiZhiLieBiao_VC_Delegate_DZ:(DiZhiLieBiao_Model_Data *)model isFS:(BOOL)fs{
    self.model.data.address.address = model.address;
    self.model.data.address.addressto = model.addressto;
    self.model.data.address.city = model.city;
    self.model.data.address.geoCode = model.geoCode;
    self.model.data.address.idField = model.idField;
    self.model.data.address.addressto = model.addressto;
    self.model.data.address.isfirst = model.isfirst;
    self.model.data.address.merchantId = model.merchantId;
    self.model.data.address.phone = model.phone;
    self.model.data.address.province = model.province;
    self.model.data.address.username = model.username;
    self.model.data.address.mername = model.name;
    self.model.data.address.status = fs ? 1 : 2;
    self.model.data.isfirst = YES;
    [self UP_UI];
}

-(void)init_UI{
    
    
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, self.btn_DR.top - 1)];
    if (@available(iOS 11.0, *)){
        scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        scrollV.height = ScreenHeight - kTabbarSafeBottomMargin - kStatusBarAndNavigationBarHeight - 50-1;
    }
    if (!iOS11) {
        scrollV.height = ScreenHeight - self.btn_DR.height - kStatusBarAndNavigationBarHeight;
    }
    
    [self.view addSubview:scrollV];
    
    NSString *str_DZ = @"北京市北北京市北京京市北北京市北京市北京市京市北北京市北京市北京市京市北北京市北京市北京市市北京市";
    self.DZ.height = [DiZhiXinXi_V FS:bool_PS str_NR:str_DZ];
    self.DZ.bool_SC =0;
    self.DZ.str_DZ = str_DZ;
    self.DZ.bool_FS = bool_PS;
    [scrollV addSubview:self.DZ];
    
    self.SP.top = self.DZ.bottom;
    self.SP.height = [ShangPinXinXi_Cell get_H];
    [scrollV addSubview:self.SP];
    
    self.JJ.top = self.SP.bottom;
    self.JJ.height = [ShangPinJiaJian_V get_H];
    [scrollV addSubview:self.JJ];
    
    self.PS.top = self.JJ.bottom;
    self.PS.height = [PeiSongFangShi_V get_H:nil];
    self.PS.bool_PS = bool_PS;
    [scrollV addSubview:self.PS];
    
    self.ZFFS.top = self.PS.bottom;
    self.ZFFS.height = [ZhiFuFangShi_V get_H:nil];
    [scrollV addSubview:self.ZFFS];
    
    scrollV.contentSize = CGSizeMake(0, self.ZFFS.bottom);
    
    if (!bool_PS) {
//        self.lbl_JE.height = 30;
        self.lbl_JE_H.constant = 30;
        self.lbl_YF.hidden = YES;
    }else{
//        self.lbl_JE.height = 20;
        self.lbl_JE_H.constant = 20;
        self.lbl_YF.hidden = 0;
    }
}

-(ZhiFuFangShi_V *)ZFFS{
    if (!_ZFFS) {
        ZhiFuFangShi_V *ZFFS = [ZhiFuFangShi_V init_Xib];
        ZFFS.width = self.view.width;
        [self.view addSubview:ZFFS];
        _ZFFS = ZFFS;
    }
    return _ZFFS;
}

-(PeiSongFangShi_V *)PS{
    if (!_PS) {
        PeiSongFangShi_V *PS = [PeiSongFangShi_V init_Xib];
        PS.width = self.view.width;
        [self.view addSubview:PS];
        _PS = PS;
    }
    return _PS;
}

-(ShangPinJiaJian_V *)JJ{
    if (!_JJ) {
        ShangPinJiaJian_V *JJ = [ShangPinJiaJian_V init_Xib];
        JJ.width = self.view.width ;
        [self.view addSubview:JJ];
        _JJ = JJ;
    }
    return _JJ;
}

-(ShangPinXinXi_Cell *)SP{
    if (!_SP) {
        ShangPinXinXi_Cell *SP = [ShangPinXinXi_Cell init_Xib];
        SP.width = self.view.width;
        [self.view addSubview:SP];
        _SP = SP;
    }
    return _SP;
}

- (DiZhiXinXi_V *)DZ {
    if (!_DZ) {
        DiZhiXinXi_V *DZ = [DiZhiXinXi_V init_Xib];
        [self.view addSubview:DZ];
        _DZ = DZ;
        _DZ.delegate = self;
    }
    return _DZ;
}



@end
