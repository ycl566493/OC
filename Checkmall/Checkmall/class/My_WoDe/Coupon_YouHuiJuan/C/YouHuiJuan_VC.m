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

@interface YouHuiJuan_VC ()<SlideButtonViewDelegate>{
    SlideButtonView * slide;
    

}

@end

@implementation YouHuiJuan_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠券";

    [self init_UI];
    

}

-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        
    }
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
    self.tableview.backgroundColor = [UIColor redColor];
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
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [YouHuiJuanCell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YouHuiJuanCell *cell = (YouHuiJuanCell *)[tableView dequeueReusableCellWithIdentifier:@"YouHuiJuanCell"];
    if (cell == nil) {
        cell= (YouHuiJuanCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"YouHuiJuanCell" owner:self options:nil]  lastObject];
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

@end
