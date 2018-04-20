//
//  JieLong_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "JieLong_VC.h"
#import "SlideButtonView.h"//上部滑动条
#import "JieLong_Cell.h"//接龙cell
//#import "TC_JL_V.h"//接龙弹出
#import "QueRenDingDan_JL_VC.h"//接龙确认订单页
#import "JLLB_Model_RootClass.h"
#import "JieLong_JG_VC.h"
#import "KBY_View.h"

@interface JieLong_VC ()<UITableViewDelegate,UITableViewDataSource>{
    JLLB_Model_RootClass    *model;
}
@property (nonatomic,weak)  KBY_View        *KBY;

//@property (nonatomic,weak)TC_JL_V       *JLTC;//接龙弹出窗口

@end

@implementation JieLong_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    [self init_UI];
    self.title = @"车客接龙";
    [self init_data:YES];
}



- (void)init_data:(BOOL)Y_N{
    
    [NetRequest postWithUrl:Solitaire_lists params:@{@"page":[NSString stringWithFormat:@"%li",self.pageIndex]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"接龙列表 ==  %@",dict);
        if (Y_N) {
            model = [[JLLB_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model Add_Dictionary:dict];
        }
        if (model.code == 1) {
            [self.tableview reloadData];
        }
        [self if_KBY];
    } fail:^(id error) {
        
    }];
}

- (void)if_KBY{
    if (model.data.count == 0) {
        self.KBY.hidden = 0;
    }else{
        self.KBY.hidden = 1;
    }
}

-(KBY_View *)KBY{
    if (!_KBY) {
        KBY_View *kby = [KBY_View init_Xib];
        _KBY = kby;
        _KBY.width = ScreenWidth;
        _KBY.hidden = YES;
        _KBY.height = self.view.height;
    }
    return _KBY;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
//    [self.JLTC layoutIfNeeded];
//    self.JLTC.alpha = 0;
//    self.JLTC.hidden = NO;
//    [UIView animateWithDuration:.6 animations:^{
//        self.JLTC.alpha = 1;
//        [self.JLTC layoutIfNeeded];
//
//    } completion:^(BOOL finished) {
//
//    }];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.JLTC.hidden = YES;
}

-(void)init_UI{
    self.tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableview.top = 0;
    self.tableview.height = ScreenHeight - kTabbarSafeBottomMargin ;
    self.tableview.backgroundColor = UIColorFromHex(0xf2f2f2);
    if (!iOS11) {
        self.tableview.height = ScreenHeight ;
    }
    WeakSelf(ws);
        self.tableview.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [ws.tableview.mj_header endRefreshing];
    
            //  结束刷新
            ws.pageIndex =1;
            [ws init_data:YES];
        }];
//     设置自动切换透明度(在导航栏下面自动隐藏)
//        self.tableV.mj_header.automaticallyChangeAlpha = YES;
//     tableV上拉加载
        self.tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [ws.tableview.mj_footer endRefreshing];
    
            ws.pageIndex += 1;
            [ws init_data:NO];
        }];

    self.KBY.frame = self.tableview.bounds;
    [self.tableview addSubview:self.KBY];
}

#pragma mark- 提交订单
-(void)TC_JL_V_Delegate_TJ{
    QueRenDingDan_JL_VC *vc = [[QueRenDingDan_JL_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 接龙弹出
//-(TC_JL_V *)JLTC{
//    if (!_JLTC) {
//        TC_JL_V *JLTC = [TC_JL_V init_Xib];
//        _JLTC = JLTC;
//        _JLTC.frame = self.window.bounds;
//        _JLTC.delegate = self;
//    }
//    return _JLTC;
//}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [JieLong_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JieLong_Cell *cell = (JieLong_Cell *)[tableView dequeueReusableCellWithIdentifier:@"JieLong_Cell"];
    if (cell == nil) {
        cell= (JieLong_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"JieLong_Cell" owner:self options:nil]  lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    JLLB_Model_Data *MMMM = model.data[indexPath.row];
    cell.model = MMMM;
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
//    self.JLTC.View_BJ_Y.constant = self.JLTC.height;
//    [self.window addSubview:self.JLTC];
//
//    [self.JLTC layoutIfNeeded];
//
//    [UIView animateWithDuration:.4 animations:^{
//        self.JLTC.View_BJ_Y.constant = 0;
//        [self.JLTC layoutIfNeeded];
//    } completion:^(BOOL finished) {
//    }];
    JLLB_Model_Data *MMMM = model.data[indexPath.row];

    JieLong_JG_VC *vc = [[JieLong_JG_VC alloc]init];
    vc.str_ID = [NSString stringWithFormat:@"%li",MMMM.idField];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
