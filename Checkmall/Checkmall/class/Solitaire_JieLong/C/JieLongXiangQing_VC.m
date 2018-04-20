//
//  JieLongXiangQing_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JieLongXiangQing_VC.h"
#import "ShangPin_TuPian_V.h"//商品图片详情
#import "ShangPin_XinXi_V.h"//商品信息
#import "ShangPin_XiaDan_V.h"//商品下单
#import "ShangPin_MS_V.h"//商品描述
#import "ShangPin_PinTuanXuZhi_V.h"//拼团须知
#import "JieLongWanFa_V.h"//拼团须知
#import "JLXQ_Model_RootClass.h"
#import "QieHuan_V.h"//切换
#import "SPSP_Cell.h"
#import "SPPJ_V.h"
#import "PingJia_VC.h"//评价列表
#import "ShiPinLieBiao_Model_RootClass.h"//视频model
#import "SPBF_V.h"//视频播放背景
#import "SelVideoPlayer.h"//视频播放器
#import "SelPlayerConfiguration.h"//视频播放配置参数
#import "QueRenDingDan_Model_RootClass.h"//确认订单
#import "QueRenDingDan_JL_VC.h"//确认订单

@interface JieLongXiangQing_VC ()<ShangPin_PinTuanXuZhi_V_Delegate,QieHuan_V_Delegate,UITableViewDataSource,UITableViewDelegate,SPPJ_V_Delegate,ShangPin_TuPian_V_Delegate,ShangPin_XinXi_V_Delegate>{
    ShangPin_TuPian_V       *TuPian;
    ShangPin_XiaDan_V       *XiaDan;//商品下单信息
    ShangPin_MS_V           *MS;//商品描述
    
    
    JLXQ_Model_RootClass    *model_SPXQ;//商品详情model
    ShiPinLieBiao_Model_RootClass   *model_SP;
    QueRenDingDan_Model_RootClass   *model_QRDD;
    
    UIView                      *view_XQ;//详情
    UITableView                      *tableV_SP;//视频
    
}
@property (nonatomic, strong) SelVideoPlayer *player;//视频播放器

@property (nonatomic,weak) QieHuan_V                 *QH;//切换选择
@property (nonatomic,weak) SPPJ_V                 *PJ;//评价

@property (nonatomic , weak) ShangPin_XinXi_V        *XinXi;//商品信息

@property(weak,nonatomic)JieLongWanFa_V          *JLXZ;//拼团须知

@end

@implementation JieLongXiangQing_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromHex(0xeeeeee);

    self.title = @"商品详情";
    [self init_UI];
    
    [self init_Data];
    [self init_Data_SP];
}


- (void)init_Data_SP{
    NSDictionary *dic = @{@"gid":self.str_SPID,@"token":[MyHelper toToken]};
    [NetRequest postWithUrl:Product_videoList params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"视频列表 == %@",dict);
        model_SP = [[ShiPinLieBiao_Model_RootClass alloc]initWithDictionary:dict];
        if (model_SP.code ==1) {
            if (model_SP.data.count == 0) {
                self.QH.hidden = YES;
                self.QH.height = 0;
            }else{
                self.QH.hidden = NO;
                self.QH.height = [QieHuan_V get_H:nil];
            }
            [tableV_SP reloadData];
        }else{
            self.QH.hidden = YES;
            self.QH.height = 0;
        }
        view_XQ.top = self.QH.bottom;
        tableV_SP.top = self.QH.bottom;
    } fail:^(id error) {
        
    }];
}

-(void)dealloc{
    [TuPian removeFromSuperview];
    TuPian  = nil;
}

-(void)init_Data{
    [NetRequest postWithUrl:Solitaire_goodsdetails params:@{@"sid":self.Str_JLID,@"gid":self.str_SPID} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"接龙详情= ==  =%@",dict);
        model_SPXQ = [[JLXQ_Model_RootClass alloc]initWithDictionary:dict];
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
        _QH.height = [QieHuan_V get_H:nil];
    }
    return _QH;
}

-(void)ShangPin_XinXi_V_Delegate_FX{
    [FenXiang_Object Shar:model_SPXQ.data.share.title str_NR:model_SPXQ.data.share.content image_URL:model_SPXQ.data.share.image str_LJ:model_SPXQ.data.share.path];

}

#pragma mark- 商品信息
-(ShangPin_XinXi_V *)XinXi{
    if (!_XinXi) {
        ShangPin_XinXi_V *XinXi = [ShangPin_XinXi_V init_Xib];
        _XinXi = XinXi;
        _XinXi.width =ScreenHeight;
        _XinXi.delegate = self;
        
    }
    return _XinXi;
}

-(SPPJ_V *)PJ{
    if (!_PJ) {
        SPPJ_V *pj = [SPPJ_V init_Xib];
        _PJ = pj;
        _PJ.backgroundColor = [UIColor whiteColor];
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
            self.scrollV.contentSize = CGSizeMake(0, view_XQ.bottom);
        }];
        
    }else{
        //视频
        [UIView animateWithDuration:.4 animations:^{
            view_XQ.mj_x = -ScreenWidth;
            tableV_SP.mj_x = 0;
            self.scrollV.contentSize = CGSizeMake(0, tableV_SP.bottom);
        }];
    }
}

#pragma mark- 更新视图
-(void)UP_UI{
    TuPian.model_JL = model_SPXQ;
    self.QH.height =[QieHuan_V get_H:nil];

    self.XinXi.model_JL = model_SPXQ;
    self.XinXi.height = [ShangPin_XinXi_V get_H:model_SPXQ.data.name];
    XiaDan.mj_y = self.XinXi.bottom;
    XiaDan.model_JL = model_SPXQ;
    XiaDan.height = [ShangPin_XiaDan_V get_H:[NSString stringWithFormat:@"%li",model_SPXQ.data.buyuser.count]];
    
    self.PJ.model_JL = model_SPXQ;
    self.PJ.mj_y = XiaDan.bottom;
    self.PJ.height = [SPPJ_V get_H:nil];
    
    if (model_SPXQ.data.comment.comNum == 0) {
        self.PJ.hidden = YES;
        self.PJ.height = 0;
    }
    
    MS.mj_y = self.PJ.bottom;
    MS.model_JL = model_SPXQ;
    MS.height = [ShangPin_MS_V get_H:model_SPXQ.data.promotion];
    
    self.JLXZ.model = model_SPXQ;
    self.JLXZ.mj_y = MS.bottom;
    self.JLXZ.height = [JieLongWanFa_V get_H:nil];
    view_XQ.height = self.JLXZ.bottom;
    
    self.scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );
    

    
}

-(JieLongWanFa_V *)JLXZ{
    if (!_JLXZ) {
        JieLongWanFa_V* JLXZ = [JieLongWanFa_V init_Xib];
        [self.view addSubview:JLXZ];
        _JLXZ = JLXZ;
        _JLXZ.frame = CGRectMake(0, 0, ScreenWidth, [JieLongWanFa_V get_H:nil]);
    }
    return _JLXZ;
}

#pragma mark- 初始化
-(void)init_UI{

    if (@available(iOS 11.0, *)){
        self.scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    
    TuPian = [[ShangPin_TuPian_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShangPin_TuPian_V get_H:nil])];
    TuPian.delegate = self;
    [self.scrollV addSubview:TuPian];
    
    self.QH.frame =CGRectMake(0, TuPian.bottom, ScreenWidth, [QieHuan_V get_H:nil]);
    [self.scrollV addSubview:self.QH];
    
    view_XQ = [[UIView alloc]initWithFrame:CGRectMake(0, self.QH.bottom, ScreenWidth, 0)];
    
    tableV_SP = [[UITableView alloc]initWithFrame:CGRectMake(ScreenWidth, view_XQ.top, ScreenWidth, self.scrollV.height)];
    tableV_SP.delegate = self;
    tableV_SP.dataSource = self;
    tableV_SP.estimatedRowHeight = 0;
    tableV_SP.estimatedSectionHeaderHeight = 0;
    tableV_SP.estimatedSectionFooterHeight = 0;
    
    tableV_SP.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableV_SP registerNib:[UINib nibWithNibName:@"SPSP_Cell" bundle:nil] forCellReuseIdentifier:@"SPSP_Cell"];
    
    [self.scrollV addSubview:view_XQ];
    [self.scrollV addSubview:tableV_SP];
    
    
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
    
    [view_XQ addSubview:self.JLXZ];
    
    view_XQ.height = self.JLXZ.bottom;
    self.scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );

}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model_SP.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SPSP_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SPSP_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"SPSP_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SPSP_Cell" owner:self options:nil] lastObject];
    }
    ShiPinLieBiao_Model_Data *MMMM = model_SP.data[indexPath.row];
    cell.model = MMMM;
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
    ShiPinLieBiao_Model_Data *MMM = model_SP.data[indexPath.row];
    
    [_player _deallocPlayer];
    _player = nil;
    
    SelPlayerConfiguration *configuration = [[SelPlayerConfiguration alloc]init];
    configuration.shouldAutoPlay = YES;
    configuration.supportedDoubleTap = YES;
    configuration.shouldAutorotate = YES;
    configuration.repeatPlay = YES;
    configuration.statusBarHideState = SelStatusBarHideStateFollowControls;
    configuration.sourceUrl = [NSURL URLWithString:MMM.path];
    configuration.videoGravity = SelVideoGravityResizeAspect;
    _player = [[SelVideoPlayer alloc]initWithFrame:TuPian.bounds configuration:configuration];
    [TuPian addSubview:_player];
}

- (void)ShangPin_TuPian_V_Delegate_PF{
    [_player _deallocPlayer];
    _player = nil;
    
    SelPlayerConfiguration *configuration = [[SelPlayerConfiguration alloc]init];
    configuration.shouldAutoPlay = YES;
    configuration.supportedDoubleTap = YES;
    configuration.shouldAutorotate = YES;
    configuration.repeatPlay = YES;
    configuration.statusBarHideState = SelStatusBarHideStateFollowControls;
    configuration.sourceUrl = [NSURL URLWithString:model_SPXQ.data.video];
    configuration.videoGravity = SelVideoGravityResizeAspect;
    _player = [[SelVideoPlayer alloc]initWithFrame:TuPian.bounds configuration:configuration];
    [TuPian addSubview:_player];
}



#pragma mark- 接龙列表
- (IBAction)btn_JL:(id)sender {
    
    
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSMutableArray  *arr_Data = [[NSMutableArray alloc]init];

    NSMutableDictionary *dic_DDDDDD = [[NSMutableDictionary alloc]init];
    [dic_DDDDDD setObject:[NSString stringWithFormat:@"%@",self.str_SPID] forKey:@"goodsid"];
    [dic_DDDDDD setObject:model_SPXQ.data.price forKey:@"price"];
    [dic_DDDDDD setObject:[NSString stringWithFormat:@"1"] forKey:@"num"];
    [arr_Data addObject:[MyHelper toJson:dic_DDDDDD]];

    if (arr_Data.count == 0) {
        return;
    }
    //       type 商品类型 1 拼团 2 开团 3 单独购买 4今日团购 5兑换 6接龙
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"car":arr_Data,@"type":@"6"};
    [NetRequest postWithUrl:order_getOrderDesc params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"确认订单 == %@",dict);
        model_QRDD = [[QueRenDingDan_Model_RootClass alloc]initWithDictionary:dict];
        if (model_QRDD.code == 1) {
            QueRenDingDan_JL_VC    *VC = [[QueRenDingDan_JL_VC alloc]init];
            VC.model = model_QRDD;
            VC.str_JLID = self.Str_JLID;
            [self.navigationController pushViewController:VC animated:YES];
            
        }
    } fail:^(id error) {
        
    }];
}

@end
