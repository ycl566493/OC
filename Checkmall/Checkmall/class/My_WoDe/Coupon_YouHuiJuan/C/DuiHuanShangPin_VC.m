//
//  DuiHuanShangPin_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/8.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DuiHuanShangPin_VC.h"
#import "DiZhiXinXi_V.h"
#import "DiQuMenDian_VC.h"
#import "DHJSP_V.h"
#import "ShangPin_Model_RootClass.h"

@interface DuiHuanShangPin_VC ()<DiZhiXinXi_V_Delegate,DiQuMenDian_VC_Delegate>{
    ShangPin_Model_RootClass    *model;
    NSString            *str_SJH;//手机号
    NSString            *str_Name;//姓名
    NSString            *str_MD;//门店
    NSString            *str_MDDZ;//门店地址
    NSString            *str_id;//门店id
}

@property (nonatomic,weak)DiZhiXinXi_V   *DZ;//地址信息

@property (nonatomic,weak)DHJSP_V           *SP;//商品信息

@end

@implementation DuiHuanShangPin_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"兑换商品";
    [self init_Data];
}

- (void)init_Data{
    NSDictionary *dic = @{@"cid":self.str_ID,@"goodsid":self.str_SPID};
    
    WeakSelf(ws);
    [NetRequest postWithUrl:Coupon_exchangeGoodsDesc params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"商品信息 == %@",dict);
        model = [[ShangPin_Model_RootClass alloc]initWithDictionary:dict];
        if (model.code == 1) {
            [ws UP_UI];
        }
    } fail:^(id error) {
        
    }];
}

- (void)UP_UI{
    [self.SP.imageV sd_setImageWithURL:[MyHelper imaeg_URL:model.data.productImage view:self.SP.imageV] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
    self.SP.lbl_Name.text = model.data.productName;
    self.SP.lbl_JG.text = [NSString stringWithFormat:@"￥%@",model.data.productSprice];
    self.SP.lbl_RQ.text = model.data.productArrivalTime;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self init_UI];
}



- (void)init_UI{
    
 
    [self.scrollV addSubview:self.DZ];
    self.SP.mj_y = self.DZ.bottom;
    [self.scrollV addSubview:self.SP];
}

- (IBAction)LJDH_Action:(id)sender {
    NSDictionary *dic = @{@"cid":self.str_ID,@"goodsid":self.str_SPID,@"token":[MyHelper toToken],@"address":str_MDDZ,@"type":@"5",@"phone":str_SJH,@"username":str_Name,@"merchant_id":str_id};
    [NetRequest postWithUrl:Coupon_exchangeGoods params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"兑换商品 == =%@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [MyHelper showMessage:@"商品兑换成功！"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [MyHelper showMessage:dict[@"msg"]];
        }
        
    } fail:^(id error) {
        
    }];
}

-(void)DiZhiXinXi_V_Delegate_Action{
    DiQuMenDian_VC  *vc = [[DiQuMenDian_VC alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)DiQuMenDian_VC_Delegate_XM:(NSString *)str_XM SJ:(NSString *)str_SJ str_ID:(NSString *)str_Id MD:(NSString *)MD MDDZ:(NSString *)MDDZ{
    
    str_SJH = str_SJ;//手机号
    str_Name = str_XM;//姓名
    str_MD = MD;//门店
    str_MDDZ = MDDZ;//门店地址
    str_id = str_Id;//门店id
    
    self.DZ.bool_SC = NO;
    self.DZ.bool_FS = NO;
    self.DZ.lbl_Name.text = [NSString stringWithFormat:@"%@%@",str_XM,str_SJ];
    self.DZ.lbl_ZTD.text = MD;
    self.DZ.lbl_DZXX.text = MDDZ;
    self.DZ.height = [DiZhiXinXi_V FS:NO str_NR:MDDZ];

    self.SP.mj_y = self.DZ.bottom;
    self.scrollV.contentSize =CGSizeMake(0,self.SP.bottom);
}

-(DiZhiXinXi_V *)DZ{
    if (!_DZ) {
        DiZhiXinXi_V *DZ = [DiZhiXinXi_V init_Xib];
        _DZ = DZ;
        _DZ.frame = CGRectMake(0, 0, ScreenWidth, 80);
        _DZ.delegate = self;
        
        NSString *str_DZ = @"";
        _DZ.height = [DiZhiXinXi_V FS:YES str_NR:str_DZ];
        _DZ.bool_SC =YES;
        _DZ.str_DZ = str_DZ;
        _DZ.bool_FS = YES;
    }
    return _DZ;
}

-(DHJSP_V *)SP{
    if (!_SP) {
        DHJSP_V *sp = [DHJSP_V init_Xib];
        _SP = sp;
        _SP.width = ScreenWidth;
        _SP.height = sp.view_FGX.bottom;
    }
    return _SP;
}

@end
