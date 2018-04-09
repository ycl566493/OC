//
//  YouHuiJuan_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "YouHuiJuan_VC.h"
#import "SlideButtonView.h"
#import "YouHuiJuanCell.h"
#import "YouHuiJuan_Model_RootClass.h"
#import "KBY_View.h"//空白页
#import "DuiHuanShangPin_VC.h"

@interface YouHuiJuan_VC ()<SlideButtonViewDelegate,YouHuiJuanCell_Delegate>{
    SlideButtonView * slide;
    NSString                *type;//优惠卷类型 0 未使用 1已使用 2已过期
    YouHuiJuan_Model_RootClass  *model_YHJ;
    
}

@property (nonatomic,weak)KBY_View *KBY;//空白页

@end

@implementation YouHuiJuan_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠券";
    self.pageIndex = 1;
    type = @"0";
    [self init_UI];
    
    [self init_Data:YES];
}

-(KBY_View *)KBY{
    if (!_KBY) {
        KBY_View *kby = [KBY_View init_Xib];
        _KBY = kby;
        _KBY.hidden = YES;
        _KBY.frame = self.tableview.bounds;
        [self.tableview addSubview:_KBY];
    }
    return _KBY;
}

- (void)UP_KBY{
    if (model_YHJ.data.count == 0) {
        self.KBY.hidden = NO;
    }else{
        self.KBY.hidden = YES;
    }
}

-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        if (slide.tag == 0) {
            type = @"0";
        }else if (slide.tag == 1){
            type = @"1";
        }else if (slide.tag == 2){
            type = @"2";
        }
        self.tableview.contentOffset = CGPointMake(0, 0 );
        self.pageIndex = 1;
        [self init_Data:YES];
    }
}

#pragma mark- 购物车列表
- (void)init_Data:(BOOL)Y_N{
    
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"coupon_type":type,@"page":[NSString stringWithFormat:@"%li",self.pageIndex]};
    [NetRequest postWithUrl:coupon_getmycoin params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"优惠===  = = %@",dict);
        if (Y_N) {
            model_YHJ = [[YouHuiJuan_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model_YHJ Add_Dictionary:dict];
        }
        [self.tableview reloadData];
        
        [self UP_KBY];
    } fail:^(id error) {
        
    }];
}

- (void)refresh{
    //下拉请求
    [self endRefreshing];
    self.pageIndex = 1;
    [self init_Data:YES];
}
- (void)loadMore{
    //加载更多
    [self endRefreshing];
    self.pageIndex ++;
    [self init_Data:YES];
}


- (void)init_UI{
    
    slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    slide.arr_Title = @[@"未使用",@"已使用",@"已过期"];
    slide.Font_Size = 14;
    slide.No_Color = UIColorFromHex(0x333333);
    slide.Yes_Color = UIColorFromHex(0x5db851);
    slide.No_backgroundColor = UIColorFromHex(0xffffff);
    slide.Yes_backgroundColor = UIColorFromHex(0xffffff);
    slide.bool_SlideBar = YES;
    slide.SlideBar_Color = UIColorFromHex(0x5db851);
    slide.delegate = self;
    slide.tag = 0;
    slide.init_Selected = 0;
    [self.view addSubview:slide];
    
    self.tableview.top = slide.bottom;
    if (@available(iOS 11.0, *)){
        self.tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.tableview.height = ScreenHeight -kStatusBarAndNavigationBarHeight - kTabbarSafeBottomMargin - slide.height ;
    if (!iOS11) {
        self.tableview.height = ScreenHeight - kStatusBarAndNavigationBarHeight  - slide.height ;
    }
    
}

-(void)YouHuiJuanCell_Delegate_LJDH:(NSInteger)tag{
    YouHuiJuan_Model_Data   *MMMM = model_YHJ.data[tag];
    DuiHuanShangPin_VC * vc = [[DuiHuanShangPin_VC alloc]init];
    vc.str_ID = [NSString stringWithFormat:@"%li",MMMM.idField];
    vc.str_SPID = MMMM.goodsid;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model_YHJ.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [YouHuiJuanCell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YouHuiJuanCell *cell = (YouHuiJuanCell *)[tableView dequeueReusableCellWithIdentifier:@"YouHuiJuanCell"];
    if (cell == nil) {
        cell= (YouHuiJuanCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"YouHuiJuanCell" owner:self options:nil]  lastObject];
    }
    
    YouHuiJuan_Model_Data   *MMMM = model_YHJ.data[indexPath.row];
    
    cell.model = MMMM;
    cell.delegate = self;
    cell.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setZT:slide.tag + 1];
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
