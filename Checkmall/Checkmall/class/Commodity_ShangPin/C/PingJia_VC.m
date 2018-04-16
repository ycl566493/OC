//
//  PingJia_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "PingJia_VC.h"
#import "PingJia_Cell.h"
#import "PLLB_Model_RootClass.h"
#import "KBY_View.h"

@interface PingJia_VC ()<UITableViewDelegate,UITableViewDataSource>
{
    PLLB_Model_RootClass    *model_PLLB;//评论列表
    
}
@property (nonatomic,weak)  KBY_View                *kby;//空白页
@end

@implementation PingJia_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    self.title = @"评价";
    [self init_UI];
    
    [self init_Data:YES];
}

-(void)init_Data:(BOOL)Y_N{

    
    [NetRequest postWithUrl:Product_commentList params:@{@"gid":@"8423",@"page":[NSString stringWithFormat:@"%li",self.pageIndex]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"评论列表 ==  %@",dict);
        
        if (Y_N) {
            model_PLLB = [[PLLB_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model_PLLB Add_Dictionary:dict];
        }
        
        if (model_PLLB.code == 1) {
            [self.tableV reloadData];
            
        }
        
        [self if_KYB];
    } fail:^(id error) {
        
    }];
}

- (void)if_KYB{
    if (model_PLLB.data.count == 0) {
        self.kby.hidden = NO;
    }else{
        self.kby.hidden = YES;
    }
}

- (KBY_View *)kby{
    if (!_kby) {
        KBY_View *kby = [KBY_View init_Xib];
        _kby = kby;
    }
    return _kby;
}

-(void)init_UI{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"PingJia_Cell" bundle:nil] forCellReuseIdentifier:@"PingJia_Cell"];
    
    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    //    tableV下拉刷新
//    WeakSelf(ws);
    self.tableV.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableV.mj_header endRefreshing];
        self.pageIndex =1;
        [self init_Data:YES];
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    // tableV上拉加载
    self.tableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tableV.mj_footer endRefreshing];
        self.pageIndex += 1;
        [self init_Data:NO];
    }];

}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model_PLLB.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    PLLB_Model_Data *MMMM = model_PLLB.data[indexPath.row];

    return [PingJia_Cell get_H:MMMM.content row:MMMM.piclist.count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PingJia_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"PingJia_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"PingJia_Cell" owner:self options:nil] lastObject];
    }
    PLLB_Model_Data *MMMM = model_PLLB.data[indexPath.row];
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
    
}


@end
