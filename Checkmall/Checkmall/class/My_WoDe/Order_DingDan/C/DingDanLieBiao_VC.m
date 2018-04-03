//
//  DingDanLieBiao_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DingDanLieBiao_VC.h"
#import "SlideButtonView.h"//头部
#import "DingDan_Cell.h"//订单cell
#import "DingDanLieBiao_Model_RootClass.h"
#import "KBY_View.h"//空白页
#import "WeiXinZhiFu_Model_RootClass.h"//微信支付文件
#import "ZhiFuWenJian.h"//支付文件
#import "ZFJG_Model_RootClass.h"//支付结果

@interface DingDanLieBiao_VC ()<SlideButtonViewDelegate,UITableViewDelegate,UITableViewDataSource,DingDan_Cell_Delegate>{
    SlideButtonView * slide;
    DingDanLieBiao_Model_RootClass *model_DD;//model
    WeiXinZhiFu_Model_RootClass     *model_WX;
    NSString                    *str_DDID;//id
}

@property (nonatomic,weak)  KBY_View        *KBY;

@end

@implementation DingDanLieBiao_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex = 1;
    self.title = @"我的订单";
    [self init_UI];
    [self init_Data:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ZFHD) name:@"ZFHD" object:nil];

}

-(void)backAction:(UIButton *)sender{
//    if (self.navigationController.viewControllers.count >= 2) {
//        [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
//        
//    }else{
//        [self.navigationController popViewControllerAnimated:YES];
//    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)ZFHD{
    [self UP_DD];
}


#pragma mark- 刷新订单
-(void)UP_DD{
    if (str_DDID) {
        WeakSelf(ws);
        [NetRequest postWithUrl:Order_returnStatus params:@{@"order_sn":str_DDID,@"paytype":@"2",@"token":[MyHelper toToken]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"支付状态 == %@",dict);
            ZFJG_Model_RootClass    *model = [[ZFJG_Model_RootClass alloc]initWithDictionary:dict];

            if (model.data.sta == 1) {
                
                [MyHelper showMessage:@"付款成功！"];
                ws.pageIndex = 1;
                ws.tableV.contentOffset = CGPointMake(0, 0);
                [ws init_Data:YES];
              
            }else{
                [MyHelper showMessage:model.msg];
            }
        } fail:^(id error) {
            
        }];
    }
}

-(KBY_View *)KBY{
    if (!_KBY) {
        _KBY = [KBY_View init_Xib];
        _KBY.hidden = YES;
        _KBY.frame = self.tableV.bounds;
        _KBY.lbl_Title.text = @"亲，订单是空的哦！";
        [self.tableV addSubview:_KBY];
    }
    return _KBY;
}

#pragma mark- 初始化
-(void)init_Data:(BOOL)Y_N{
    
//    类型 1全部 2代付款3未发货4待收货5待评价
    NSString *str = @"1";
    if (slide.tag == 1) {
        str = @"2";
    }else if (slide.tag == 2){
        str = @"3";
    }else if (slide.tag == 3){
        str = @"4";
    }else if (slide.tag == 4){
        str = @"5";
    }
    
    WeakSelf(ws);
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"order_status":str,@"page":[NSString stringWithFormat:@"%li",self.pageIndex]};
    [NetRequest postWithUrl:order_orderList params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        if (Y_N) {
            model_DD = [[DingDanLieBiao_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model_DD Add_Dictionary:dict];
        }
        
        [ws.tableV reloadData];

        [ws UP_KBY];
        NSLog(@"订单列表 == %@",dict);
    } fail:^(id error) {
        
    }];
}

-(void)UP_KBY{
    if (model_DD.data.count == 0) {
        self.KBY.hidden = NO;
    }else{
        self.KBY.hidden = YES;
    }
    
}

-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        self.pageIndex = 1;
        self.tableV.contentOffset = CGPointMake(0, 0);
        [self init_Data:YES];
    }
}

#pragma mark- 操作按钮1
-(void)DingDan_Cell_Delegate_Action1:(NSInteger)tag{
    DingDanLieBiao_Model_Data   *MMMM = model_DD.data[tag];
    if (MMMM.og_status == 1) {
        // @"待付款";
        NSLog(@"去付款");
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"支付方式" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮的响应事件；
            NSDictionary *dic = @{@"order_sn":MMMM.orderSn,@"gid":[NSString stringWithFormat:@"%li",MMMM.gid],@"token":[MyHelper toToken],@"paytype":@"2",@"paymode":@"1"};
            str_DDID =MMMM.orderSn;
            [NetRequest postWithUrl:Order_goToPayment params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
                NSLog(@"取消订单 == %@",dict);
                model_WX = [[WeiXinZhiFu_Model_RootClass alloc]initWithDictionary:dict];
                if (model_WX.code == 1) {
                    
                    [ZhiFuWenJian WeiXinZhiFu_partnerId:model_WX.data.partnerid prepayId:model_WX.data.prepayid nonceStr:model_WX.data.noncestr timeStamp:model_WX.data.timestamp package:model_WX.data.packageField sign:model_WX.data.sign];
                    str_DDID = model_WX.data.out_trade_no;
                }
            } fail:^(id error) {
                
            }];
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"余额" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮的响应事件；
            NSDictionary *dic = @{@"order_sn":MMMM.orderSn,@"gid":[NSString stringWithFormat:@"%li",MMMM.gid],@"token":[MyHelper toToken],@"paytype":@"2",@"paymode":@"3"};
            str_DDID =MMMM.orderSn;
            [NetRequest postWithUrl:Order_goToPayment params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
                NSLog(@"支付回调 == %@",dict);
                if ([dict[@"code"] integerValue] == 1) {
                    NSLog(@"支付成功！");
                    [MyHelper showMessage:@"支付成功!"];
                    self.pageIndex = 1;
                    self.tableV.contentOffset = CGPointMake(0, 0);
                    [self init_Data:YES];
                }else{
                    [MyHelper showMessage:dict[@"msg"]];

                }
            } fail:^(id error) {
                
            }];
        }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
            
            
        
    }else if (MMMM.og_status == 3) {
        //@"待收货";
        NSLog(@"确认收货");
        NSDictionary *dic = @{@"order_sn":MMMM.orderSn,@"gid":[NSString stringWithFormat:@"%li",MMMM.gid],@"token":[MyHelper toToken],@"status":@"5"};
        [NetRequest postWithUrl:Order_saveOrderStatus params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            if ([dict[@"code"] integerValue] == 0) {
                self.pageIndex = 1;
                self.tableV.contentOffset = CGPointMake(0, 0);
                [self init_Data:YES];
            }else{
                [MyHelper showMessage:dict[@"msg"]];
            }
            
        } fail:^(id error) {
            
        }];
    }
}


#pragma mark- 操作按钮2
-(void)DingDan_Cell_Delegate_Action2:(NSInteger)tag{
    DingDanLieBiao_Model_Data   *MMMM = model_DD.data[tag];
    if (MMMM.og_status == 1) {
        // @"待付款";
        NSLog(@"取消订单");
//        商品状态 1 待付款 2 代发货 3待收货 4 已退款 5 交易成功 6 已取消

        NSDictionary *dic = @{@"order_sn":MMMM.orderSn,@"gid":[NSString stringWithFormat:@"%li",MMMM.gid],@"token":[MyHelper toToken],@"status":@"6"};
        [NetRequest postWithUrl:Order_saveOrderStatus params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
            NSLog(@"取消订单 == %@",dict);
            if ([dict[@"code"] integerValue] == 0) {
                self.pageIndex = 1;
                self.tableV.contentOffset = CGPointMake(0, 0);
                [self init_Data:YES];
            }else{
                [MyHelper showMessage:dict[@"msg"]];
            }
         
        } fail:^(id error) {
            
        }];
        
    }
}

#pragma mark- 初始化
-(void)init_UI{
    slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    slide.arr_Title = @[@"全部",@"代付款",@"代发货",@"待收货"];
    slide.Font_Size = 14;
    slide.No_Color = UIColorFromHex(0x333333);
    slide.Yes_Color = UIColorFromHex(0x5db851);
    slide.No_backgroundColor = UIColorFromHex(0xffffff);
    slide.Yes_backgroundColor = UIColorFromHex(0xffffff);
    slide.bool_SlideBar = YES;
    slide.SlideBar_Color = UIColorFromHex(0x5db851);
    slide.delegate = self;
    slide.tag = self.int_Tag;
    slide.init_Selected = self.int_Tag;
    [self.view addSubview:slide];
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.estimatedRowHeight = 0;
    self.tableV.estimatedSectionHeaderHeight = 0;
    self.tableV.estimatedSectionFooterHeight = 0;
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableV registerNib:[UINib nibWithNibName:@"DingDan_Cell" bundle:nil] forCellReuseIdentifier:@"DingDan_Cell"];

    if (@available(iOS 11.0, *)){
        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.tableV_H.constant = ScreenHeight -kStatusBarAndNavigationBarHeight - kTabbarSafeBottomMargin - slide.height ;
    if (!iOS11) {
        self.tableV_H.constant = ScreenHeight - kTabbarHeight - 5 ;
    }
    
    //    tableV下拉刷新
    WeakSelf(ws);
    self.tableV.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [ws.tableV.mj_header endRefreshing];

        //  结束刷新
        ws.pageIndex =1;
        [ws init_Data:YES];
    }];
    // 设置自动切换透明度(在导航栏下面自动隐藏)
//    self.tableV.mj_header.automaticallyChangeAlpha = YES;
    // tableV上拉加载
    self.tableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [ws.tableV.mj_footer endRefreshing];

        ws.pageIndex += 1;
        [ws init_Data:NO];
    }];
    
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"几个 ==  %li",model_DD.data.count);
    return model_DD.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [DingDan_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DingDan_Cell *cell = (DingDan_Cell *)[tableView dequeueReusableCellWithIdentifier:@"DingDan_Cell"];
    if (cell == nil) {
//        cell= (DingDan_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"DingDan_Cell" owner:self options:nil]  lastObject];
//        cell = [[NSBundle mainBundle] loadNibNamed:@"DingDan_Cell" owner:nil options:nil].firstObject;
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DingDan_Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    DingDanLieBiao_Model_Data   *MMMM = model_DD.data[indexPath.row];
    cell.tag = indexPath.row;
    cell.delegate = self;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
