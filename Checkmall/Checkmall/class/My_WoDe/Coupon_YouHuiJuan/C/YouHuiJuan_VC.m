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

@interface YouHuiJuan_VC ()<SlideButtonViewDelegate>{
    SlideButtonView * slide;
    NSString                *type;//优惠卷类型 0 未使用 1已使用 2已过期
    YouHuiJuan_Model_RootClass  *model_YHJ;

}

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
    }
}

#pragma mark- 购物车列表
- (void)init_Data:(BOOL)Y_N{
    
    
    NSError *error;
    NSString *dataStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"YHJ" ofType:@"txt"] encoding:NSUTF8StringEncoding error:&error];
    
    NSData *jsonData = [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jerror;
    
    NSDictionary*dicttttt = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jerror];
    
    
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"coupon_type":type,@"page":[NSString stringWithFormat:@"%li",self.pageIndex]};
    [NetRequest postWithUrl:coupon_getmycoin params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"优惠===  = = %@",dict);
        model_YHJ = [[YouHuiJuan_Model_RootClass alloc]initWithDictionary:dicttttt];
        [self.tableview reloadData];
    } fail:^(id error) {
        
    }];
}

- (void)refresh{
    //下拉请求
    [self endRefreshing];
    self.pageIndex = 0;
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
