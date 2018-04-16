//
//  ShangPinXiangQing_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/10.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPinXiangQing_VC.h"
#import "ShangPin_TuPian_V.h"//商品图片详情
#import "ShangPin_XinXi_V.h"//商品信息
#import "ShangPin_XiaDan_V.h"//商品下单
#import "ShangPin_MS_V.h"//商品描述
#import "ShangPin_PinTuanXuZhi_V.h"//拼团须知
#import "QueRenDingDan_VC.h"//确认订单
#import "QueRenDingDan_PT_VC.h"//确认订单拼团
#import "TC_PTXZ_V.h"//拼团须知
#import "ShangPin_Model_RootClass.h"
#import "QueRenDingDan_Model_RootClass.h"//确认订单
#import "QieHuan_V.h"//切换
#import "SPSP_Cell.h"
#import "SPPJ_V.h"
#import "PingJia_VC.h"//评价列表
#import "ShangPin_XQ_V.h"//商品描述

@interface ShangPinXiangQing_VC ()<ShangPin_PinTuanXuZhi_V_Delegate,QieHuan_V_Delegate,UITableViewDataSource,UITableViewDelegate,SPPJ_V_Delegate,ShangPin_XQ_V_Delegate>{
    ShangPin_TuPian_V       *TuPian;
    UIScrollView            *scrollV;//滑动背景
    ShangPin_XiaDan_V       *XiaDan;//商品下单信息
    ShangPin_MS_V           *MS;//商品描述
    ShangPin_PinTuanXuZhi_V *PinTuan;//拼团
    
    UIButton                *btn_GM;//购买
    UIButton                *btn_PT;//拼团
    
    UILabel                 *lbl_GM;//购买文字
    UILabel                 *lbl_PT;//购买文字

    
    ShangPin_Model_RootClass    *model_SPXQ;//商品详情model
    QueRenDingDan_Model_RootClass   *model_QRDD;//确认订单
    
    UIView                      *view_XQ;//详情
    UITableView                      *tableV_SP;//视频
    
}

@property (nonatomic,weak) QieHuan_V                 *QH;//切换选择
@property (nonatomic,weak) SPPJ_V                 *PJ;//评价
//@property (nonatomic,weak) ShangPin_XQ_V            *Web_MS;//网页描述

@property (nonatomic , assign) ShangPin_XinXi_V        *XinXi;//商品信息

@property(weak,nonatomic)TC_PTXZ_V          *PTXZ;//拼团须知

@end

@implementation ShangPinXiangQing_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    [self init_UI];

    [self init_Data];
}


-(void)dealloc{
    [TuPian removeFromSuperview];
    TuPian  = nil;
//    [self.Web_MS removeFromSuperview];
//    self.Web_MS = nil;
    [self.PJ removeFromSuperview];
    self.PJ = nil;
}

-(void)init_Data{
    [NetRequest postWithUrl:product_bulkDetail params:@{@"goods_id":self.Str_ID} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"商品详情= ==  =%@",dict);
        model_SPXQ = [[ShangPin_Model_RootClass alloc]initWithDictionary:dict];
        if (model_SPXQ.code == 1) {
            [self UP_UI];
        }
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 切换初始化
- (QieHuan_V *)QH{
    if (!_QH) {
        QieHuan_V *qh = [QieHuan_V init_Xib];
        _QH = qh;
        _QH.delegate = self;
    }
    return _QH;
}

#pragma mark- 网页商品描述
//- (ShangPin_XQ_V *)Web_MS{
//    if (!_Web_MS) {
//        ShangPin_XQ_V *web_MS = [ShangPin_XQ_V init_Xib];
//        _Web_MS = web_MS;
//        _Web_MS.frame = CGRectMake(0, 0, ScreenWidth, 0);
//        _Web_MS.delegate = self;
//    }
//    return _Web_MS;
//}

#pragma mark- 商品信息
-(ShangPin_XinXi_V *)XinXi{
    if (!_XinXi) {
        ShangPin_XinXi_V *XinXi = [ShangPin_XinXi_V init_Xib];
        _XinXi = XinXi;
        _XinXi.width =ScreenHeight;
        
    }
    return _XinXi;
}

-(SPPJ_V *)PJ{
    if (!_PJ) {
        SPPJ_V *pj = [SPPJ_V init_Xib];
        _PJ = pj;
        _PJ.delegate = self;
    }
    return _PJ;
}

-(void)SPPJ_V_Delegate_GD{
    PingJia_VC *vc = [[PingJia_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 切换
-(void)QieHuan_V_Delegate_QH:(BOOL)qh{
    if (qh) {
        //详情
        [UIView animateWithDuration:.4 animations:^{
            view_XQ.mj_x = 0;
            tableV_SP.mj_x = ScreenWidth;
            scrollV.contentSize = CGSizeMake(0, view_XQ.bottom);
        }];
        
    }else{
        //视频
        [UIView animateWithDuration:.4 animations:^{
            view_XQ.mj_x = -ScreenWidth;
            tableV_SP.mj_x = 0;
            scrollV.contentSize = CGSizeMake(0, tableV_SP.bottom);
        }];
    }
}

#pragma mark- 更新视图
-(void)UP_UI{
    TuPian.model = model_SPXQ;
    self.XinXi.model = model_SPXQ;
    self.XinXi.height = [ShangPin_XinXi_V get_H:model_SPXQ.data.productName];
    XiaDan.mj_y = self.XinXi.bottom;
    XiaDan.model = model_SPXQ;
    XiaDan.height = [ShangPin_XiaDan_V get_H:[NSString stringWithFormat:@"%li",model_SPXQ.data.groupUserInfo.count]];
    
    self.PJ.model = model_SPXQ.data.comment;
    self.PJ.mj_y = XiaDan.bottom;
    self.PJ.height = [SPPJ_V get_H:model_SPXQ.data.comment.comInfo];
    self.PJ.hidden = NO;
    if (model_SPXQ.data.comment.comNum == 0) {
        self.PJ.hidden = YES;
        self.PJ.height = 0;
    }
    
    MS.mj_y = self.PJ.bottom;
    MS.model = model_SPXQ;
    MS.height = [ShangPin_MS_V get_H:model_SPXQ.data.productDesc];

//    self.Web_MS.str_HTML = model_SPXQ.data.product_content;
//    self.Web_MS.top = MS.bottom;
    
    PinTuan.mj_y = MS.bottom;
    view_XQ.height = PinTuan.bottom;

    scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );

    lbl_GM.text = [NSString stringWithFormat:@"￥%@\n单独购买",model_SPXQ.data.productSprice];
    lbl_PT.text = [NSString stringWithFormat:@"￥%@\n马上参团",model_SPXQ.data.productPrice];
    
//    lbl_GM.text = [NSString stringWithFormat:@"加入购物车"];
//    lbl_PT.text = [NSString stringWithFormat:@"￥%@\n单独购买",model_SPXQ.data.productSprice];

}

#pragma mark- 商品高度
-(void)ShangPin_XQ_V_Delegate_H{
    
//    PinTuan.mj_y = self.Web_MS.bottom;
    view_XQ.height = PinTuan.bottom;
    
    scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );

}

-(TC_PTXZ_V *)PTXZ{
    if (!_PTXZ) {
        TC_PTXZ_V* PTXZ = [TC_PTXZ_V init_Xib];
        [self.view addSubview:PTXZ];
        _PTXZ = PTXZ;
        _PTXZ.frame = self.window.bounds;
    }
    return _PTXZ;
}

#pragma mark- 拼团须知
-(void)ShangPin_PinTuanXuZhi_V_Delegate_PTXZ{
    [self.window addSubview:self.PTXZ];
}

#pragma mark- 初始化
-(void)init_UI{
  
    scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - kStatusBarAndNavigationBarHeight  - 54 - kTabbarSafeBottomMargin)];
    if (@available(iOS 11.0, *)){
        scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:scrollV];
    
    TuPian = [[ShangPin_TuPian_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShangPin_TuPian_V get_H:nil])];
    [scrollV addSubview:TuPian];
    
    self.QH.frame =CGRectMake(0, TuPian.bottom, ScreenWidth, [QieHuan_V get_H:nil]);
    [scrollV addSubview:self.QH];
    
    view_XQ = [[UIView alloc]initWithFrame:CGRectMake(0, self.QH.bottom, ScreenWidth, 0)];
    
    tableV_SP = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth, view_XQ.top, ScreenWidth, scrollV.height)];
    tableV_SP.delegate = self;
    tableV_SP.dataSource = self;
    tableV_SP.estimatedRowHeight = 0;
    tableV_SP.estimatedSectionHeaderHeight = 0;
    tableV_SP.estimatedSectionFooterHeight = 0;
    
    tableV_SP.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableV_SP registerNib:[UINib nibWithNibName:@"SPSP_Cell" bundle:nil] forCellReuseIdentifier:@"SPSP_Cell"];
    
    [scrollV addSubview:view_XQ];
    [scrollV addSubview:tableV_SP];
    
    
    NSString *str_Title = @"";
    self.XinXi.frame = CGRectMake(0, 0, ScreenWidth, [ShangPin_XinXi_V get_H:str_Title]);
    self.XinXi.str_Title = str_Title;
    [view_XQ addSubview:self.XinXi];
    
    //下单模块
    XiaDan = [[ShangPin_XiaDan_V alloc]initWithFrame:CGRectMake(0, self.XinXi.bottom, ScreenWidth, [ShangPin_XiaDan_V get_H:nil])];
    [view_XQ addSubview:XiaDan];
    
    self.PJ.frame = CGRectMake(0, XiaDan.bottom, ScreenWidth, [SPPJ_V get_H:nil]);
    [view_XQ addSubview:self.PJ];
    
    NSString    *str_MS = @"";
    MS = [[ShangPin_MS_V alloc]initWithFrame:CGRectMake(0, self.PJ.bottom, ScreenWidth, [ShangPin_MS_V get_H:str_MS])];
    MS.backgroundColor = [UIColor whiteColor];
    [view_XQ addSubview:MS];
    
//    self.Web_MS.top = MS.bottom;
//    [view_XQ addSubview:self.Web_MS];
    
    
    PinTuan = [[ShangPin_PinTuanXuZhi_V alloc]initWithFrame:CGRectMake(0, MS.bottom, ScreenWidth, [ShangPin_PinTuanXuZhi_V get_H:nil])];
    PinTuan.delegate = self;
    [view_XQ addSubview:PinTuan];
  
    view_XQ.height = PinTuan.bottom;
    scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );
    
    btn_GM = [[UIButton alloc]initWithFrame:CGRectMake(0, scrollV.bottom, ScreenWidth / 2, 54)];
    btn_GM.backgroundColor = UIColorFromHex(0xff9333);
    [btn_GM addTarget:self action:@selector(btn_GM_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_GM];
    lbl_GM = [[UILabel alloc]initWithFrame:btn_GM.bounds];
    lbl_GM.numberOfLines = 2;
    lbl_GM.textAlignment = 1;
    lbl_GM.text = @"加入购物车";
    lbl_GM.textColor = [UIColor whiteColor];
    lbl_GM.font = [UIFont systemFontOfSize:17];
    [btn_GM addSubview:lbl_GM];
    
    btn_PT = [[UIButton alloc]initWithFrame:CGRectMake(lbl_GM.right, scrollV.bottom, ScreenWidth / 2, 54)];
    btn_PT.backgroundColor = UIColorFromHex(0xff7800);
    [btn_PT addTarget:self action:@selector(btn_PT_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_PT];
    lbl_PT = [[UILabel alloc]initWithFrame:btn_GM.bounds];
    lbl_PT.numberOfLines = 2;
    lbl_PT.textAlignment = 1;
    lbl_PT.text = @"￥0\n马上参团";
    lbl_PT.textColor = [UIColor whiteColor];
    lbl_PT.font = [UIFont systemFontOfSize:17];
    [btn_PT addSubview:lbl_PT];
    
    if (!iOS11) {
        scrollV.height = ScreenHeight - kStatusBarAndNavigationBarHeight ;
    }
    
}


#pragma mark- 拼团btn_PT_Action
- (void)btn_PT_Action{
//    QueRenDingDan_PT_VC *VC = [[QueRenDingDan_PT_VC alloc]init];
//    [self.navigationController pushViewController:VC animated:YES];
    
//
//    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
//        [self QuDeLu];
//        return;
//    }
//
//    NSDictionary *dic = @{@"token":[MyHelper toToken],@"goods_id":[NSString stringWithFormat:@"%li",model_SPXQ.data.productId],@"num":@"1"};
//
//    [NetRequest postWithUrl:goodscar_addGoodsToCar params:dic showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
//
//
//        NSLog(@"添加购物车 = = =%@",dict);
//        if ([dict[@"code"] integerValue] == 1) {
//
//            [MyHelper showMessage:@"添加购物车成功"];
//
//            [MyHelper UP_GWCSL];
//        }
//    } fail:^(id error) {
//
//
//    }];
    
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSMutableArray  *arr_Data = [[NSMutableArray alloc]init];
    
    NSMutableDictionary *dic_DDDDDD = [[NSMutableDictionary alloc]init];
    [dic_DDDDDD setObject:[NSString stringWithFormat:@"%li",model_SPXQ.data.productId] forKey:@"goodsid"];
    [dic_DDDDDD setObject:model_SPXQ.data.productSprice forKey:@"price"];
    [dic_DDDDDD setObject:[NSString stringWithFormat:@"1"] forKey:@"num"];
    
    [arr_Data addObject:[MyHelper toJson:dic_DDDDDD]];
    
    //       type 商品类型 1 拼团 2 开团 3 单独购买 4今日团购 5兑换 6接龙
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"car":arr_Data,@"type":@"1"};
    [NetRequest postWithUrl:order_getOrderDesc params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"确认订单 == %@",dict);
        model_QRDD = [[QueRenDingDan_Model_RootClass alloc]initWithDictionary:dict];
        if (model_QRDD.code == 1 && model_QRDD.data.arr.count > 0) {
            QueRenDingDan_PT_VC *VC= [[QueRenDingDan_PT_VC alloc]init];
            VC.model = model_QRDD;
            [self.navigationController pushViewController:VC animated:YES];
        }
    } fail:^(id error) {
        
    }];

}

#pragma mark- 购买btn_GM_Action
-(void)btn_GM_Action{
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSMutableArray  *arr_Data = [[NSMutableArray alloc]init];
   
    NSMutableDictionary *dic_DDDDDD = [[NSMutableDictionary alloc]init];
    [dic_DDDDDD setObject:[NSString stringWithFormat:@"%li",model_SPXQ.data.productId] forKey:@"goodsid"];
    [dic_DDDDDD setObject:model_SPXQ.data.productSprice forKey:@"price"];
    [dic_DDDDDD setObject:[NSString stringWithFormat:@"1"] forKey:@"num"];
    
    [arr_Data addObject:[MyHelper toJson:dic_DDDDDD]];

    //       type 商品类型 1 拼团 2 开团 3 单独购买 4今日团购 5兑换 6接龙
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"car":arr_Data,@"type":@"3"};
    [NetRequest postWithUrl:order_getOrderDesc params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"确认订单 == %@",dict);
        model_QRDD = [[QueRenDingDan_Model_RootClass alloc]initWithDictionary:dict];
        if (model_QRDD.code == 1 && model_QRDD.data.arr.count > 0) {
            QueRenDingDan_VC *VC= [[QueRenDingDan_VC alloc]init];
            VC.model = model_QRDD;
            [self.navigationController pushViewController:VC animated:YES];
        }
    } fail:^(id error) {
        
    }];
    
 
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SPSP_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SPSP_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"SPSP_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SPSP_Cell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}









@end
