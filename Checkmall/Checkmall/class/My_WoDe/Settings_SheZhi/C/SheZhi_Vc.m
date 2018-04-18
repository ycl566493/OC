//
//  SheZhi_Vc.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/17.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SheZhi_Vc.h"
#import "SheZhi_Cell.h"
#import "GRXX_VC.h"
#import "XiuGaiMiMa_VC.h"
#import "ZGGG_VC.h"

@interface SheZhi_Vc ()<UITableViewDelegate,UITableViewDataSource>{
    
}

@end

@implementation SheZhi_Vc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";


    [self init_UI];
}

-(void)init_UI{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    self.tableV.backgroundColor = UIColorFromHex(0xeeeeee);
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"SheZhi_Cell" bundle:nil] forCellReuseIdentifier:@"SheZhi_Cell"];
    
    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SheZhi_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SheZhi_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"SheZhi_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SheZhi_Cell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [cell SetTitle:@"个人资料" NR:@"" ImageV:NO];
        }else if (indexPath.row == 1){
            [cell SetTitle:@"账号管理" NR:@"" ImageV:NO];
        }else if (indexPath.row == 2){
            [cell SetTitle:@"修改密码" NR:@"" ImageV:NO];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            NSInteger tmpSize = [[SDImageCache sharedImageCache]getSize];
            NSString *clearCacheName = [NSString stringWithFormat:@"%.2fM",tmpSize / 1024.0 / 1024];
            
            [cell SetTitle:@"清除缓存" NR:clearCacheName ImageV:YES];
    
        }else if (indexPath.row == 1){
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            [cell SetTitle:@"当前版本号" NR:[NSString stringWithFormat:@"V%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]] ImageV:YES];
        }
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
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
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            GRXX_VC *vc = [[GRXX_VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row == 1){
            ZGGG_VC *vc = [[ZGGG_VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2){
            XiuGaiMiMa_VC *vc = [[XiuGaiMiMa_VC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            WeakSelf(ws);
            NSInteger tmpSize = [[SDImageCache sharedImageCache]getSize];
            NSString *clearCacheName = [NSString stringWithFormat:@"%.2fM",tmpSize / 1024.0 /1024.0];
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否要清除缓存" message:clearCacheName preferredStyle: UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"清除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
                [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
                [[SDImageCache sharedImageCache]clearMemory];
                [MyHelper showMessage:@"清除成功"];
                [ws.tableV reloadData];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
            
        }else if (indexPath.row == 1){
            
        }
    }else if (indexPath.row == 1){
            
    }
}

#pragma mark- 退出
- (IBAction)btn_TC:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否要退出登录？" message:@"" preferredStyle: UIAlertControllerStyleAlert];
    
    WeakSelf(ws);
    [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        NSDictionary *dic = @{@"token":[MyHelper toToken]};
        [NetRequest postWithUrl:User_exitLogin params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            if ([dict[@"code"] integerValue] == 1) {
                [MyHelper showMessage:@"退出成功！"];

                [kUserDefaults setBool:0 forKey:DengLuZhuangTai];
                [kUserDefaults setObject:@"" forKey:@"token"];
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"TCDL" object:nil];
                [ws.navigationController popToRootViewControllerAnimated:YES];

//                });
            }else{
                [MyHelper showMessage:@"退出失败！"];
            }
            
            
            NSLog(@"退出登录");
        } fail:^(id error) {
            
        }];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];

}




@end
