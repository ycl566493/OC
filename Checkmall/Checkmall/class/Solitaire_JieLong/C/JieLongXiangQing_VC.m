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
#import "TC_PTXZ_V.h"//拼团须知
#import "JLXQ_Model_RootClass.h"
#import "QieHuan_V.h"//切换
#import "SPSP_Cell.h"
#import "SPPJ_V.h"
#import "PingJia_VC.h"//评价列表

@interface JieLongXiangQing_VC ()<ShangPin_PinTuanXuZhi_V_Delegate,QieHuan_V_Delegate,UITableViewDataSource,UITableViewDelegate,SPPJ_V_Delegate>{
    ShangPin_TuPian_V       *TuPian;
    ShangPin_XiaDan_V       *XiaDan;//商品下单信息
    ShangPin_MS_V           *MS;//商品描述
    ShangPin_PinTuanXuZhi_V *PinTuan;//拼团
    
    
    JLXQ_Model_RootClass    *model_SPXQ;//商品详情model
    
    UIView                      *view_XQ;//详情
    UITableView                      *tableV_SP;//视频
    
}

@property (nonatomic,weak) QieHuan_V                 *QH;//切换选择
@property (nonatomic,weak) SPPJ_V                 *PJ;//评价

@property (nonatomic , assign) ShangPin_XinXi_V        *XinXi;//商品信息

@property(weak,nonatomic)TC_PTXZ_V          *PTXZ;//拼团须知

@end

@implementation JieLongXiangQing_VC

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = @"商品详情";
    [self init_UI];
    
    [self init_Data];
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
        _PJ.backgroundColor = [UIColor yellowColor];
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
    
    self.PJ.mj_y = XiaDan.bottom;
    self.PJ.height = [SPPJ_V get_H:nil];
    MS.mj_y = self.PJ.bottom;
    MS.model_JL = model_SPXQ;
    MS.height = [ShangPin_MS_V get_H:model_SPXQ.data.details];
    
    
    PinTuan.mj_y = MS.bottom;
    view_XQ.height = PinTuan.bottom;
    
    self.scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );
    

    
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

    if (@available(iOS 11.0, *)){
        self.scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    
    TuPian = [[ShangPin_TuPian_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShangPin_TuPian_V get_H:nil])];
    [self.scrollV addSubview:TuPian];
    
    self.QH.frame =CGRectMake(0, TuPian.bottom, ScreenWidth, [QieHuan_V get_H:nil]);
    self.QH.backgroundColor = [UIColor redColor];
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
    XiaDan.backgroundColor = [UIColor redColor];
    [view_XQ addSubview:XiaDan];
    
    self.PJ.frame = CGRectMake(0, XiaDan.bottom, ScreenWidth, [SPPJ_V get_H:nil]);
    [view_XQ addSubview:self.PJ];
    
    NSString    *str_MS = @"";
    MS = [[ShangPin_MS_V alloc]initWithFrame:CGRectMake(0, self.PJ.bottom, ScreenWidth, [ShangPin_MS_V get_H:str_MS])];
    MS.backgroundColor = [UIColor whiteColor];
    [view_XQ addSubview:MS];
    
    PinTuan = [[ShangPin_PinTuanXuZhi_V alloc]initWithFrame:CGRectMake(0, MS.bottom, ScreenWidth, [ShangPin_PinTuanXuZhi_V get_H:nil])];
    PinTuan.delegate = self;
    [view_XQ addSubview:PinTuan];
    
    view_XQ.height = PinTuan.bottom;
    self.scrollV.contentSize = CGSizeMake(0, view_XQ.bottom );

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



#pragma mark- 接龙列表
- (IBAction)btn_JL:(id)sender {
    
}

@end
