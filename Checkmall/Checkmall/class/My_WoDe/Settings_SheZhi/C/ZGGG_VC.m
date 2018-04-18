//
//  ZGGG_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/4/18.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZGGG_VC.h"
#import "SheZhi_Cell.h"
#import <ShareSDK/ShareSDK.h>//sharSDK

@interface ZGGG_VC ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL            bool_BD;//是否绑定
}
@end

@implementation ZGGG_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"账号绑定";
    [self init_UI];
 
    [self init_Data];
}
- (void)init_Data{
    [NetRequest postWithUrl:User_wxBindStatus params:@{@"token":[MyHelper toToken]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"获取绑定状态 == %@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            bool_BD = [dict[@"data"] boolValue];
            [self.tableV reloadData];
        }
    } fail:^(id error) {
        
    }];
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
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
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
   
    cell.lbl_NR.textColor = UIColorFromHex(0xff7800);
    [cell SetTitle:@"绑定微信" NR:bool_BD == YES ? @"已绑定" : @"绑定" ImageV:YES];
    
    
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
    if (!bool_BD) {
        [self btn_WXDL_Action];
    }
}
#pragma mark- 微信登录
- (void)btn_WXDL_Action{
    //例如QQ的登录
    [ShareSDK cancelAuthorize:SSDKPlatformTypeWechat];
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             //             NSLog(@"uid=%@",user.uid);
             //             NSLog(@"%@",user.credential);
             //             NSLog(@"token=%@",user.credential.token);
             //             NSLog(@"nickname=%@",user.nickname);
             //             NSLog(@"unionid == %@",user.rawData[@"unionid"]);
             [self WeiXinDL:user.rawData[@"unionid"] name:user.nickname image_TX:user.icon];
         }
         
         else
         {
             [MyHelper showMessage:@"微信授权登录失败！"];
             NSLog(@"%@",error);
         }
         
     }];
    
}

- (void)WeiXinDL:(NSString *)unionid name:(NSString *)name image_TX:(NSString*)image{
    
//    NSString *deviceUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"unionid":unionid};
    [NetRequest postWithUrl:User_wxToBind params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"微信登录 == %@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [MyHelper showMessage:@"绑定成功！"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    } fail:^(id error) {
        
    }];
}

@end
