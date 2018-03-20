//
//  ZhiFuChengGong_JL_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhiFuChengGong_JL_VC.h"
#import "JL_SPXX_V.h"//接龙商品数据
#import "JL_ZFCG_V.h"//接龙支付成功
#import "ShangPin_XiaDan_Cell.h"

@interface ZhiFuChengGong_JL_VC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) JL_SPXX_V *SPXX;//商品信息

@property (nonatomic,weak) JL_ZFCG_V        *JLXX;///接龙信息
@end

@implementation ZhiFuChengGong_JL_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"支付成功";
    [self init_UI];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark- 接龙信息
-(JL_ZFCG_V *)JLXX{
    if (!_JLXX) {
        JL_ZFCG_V *JLXX = [JL_ZFCG_V init_Xib];
        _JLXX = JLXX;
        _JLXX.frame = CGRectMake(0, 0, ScreenWidth, [JL_ZFCG_V get_H:nil]);
    }
    return _JLXX;
}

#pragma mark- 商品信息
-(JL_SPXX_V *)SPXX{
    if (!_SPXX) {
        JL_SPXX_V *SPXX = [JL_SPXX_V init_Xib];
        _SPXX = SPXX;
        _SPXX.backgroundColor = [UIColor whiteColor];
        _SPXX.frame = CGRectMake(0, 0, ScreenWidth, [JL_SPXX_V get_H:nil]);
    }
    return _SPXX;
}

-(void)init_UI{
    
    self.tableview.delegate  =self;
    self.tableview.dataSource = self;
    self.tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableview.height = ScreenHeight - kTabbarSafeBottomMargin ;
    self.tableview.backgroundColor = [UIColor whiteColor];
    if (!iOS11) {
        self.tableview.height = ScreenHeight ;
    }
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 20;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ShangPin_XiaDan_Cell get_H:nil];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShangPin_XiaDan_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ShangPin_XiaDan_Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.tag = indexPath.row;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.SPXX.height;
    }
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.SPXX;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return self.JLXX.height;
    }
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return self.JLXX;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
