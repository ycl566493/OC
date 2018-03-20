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
#import "TC_JL_V.h"//接龙弹出
#import "QueRenDingDan_JL_VC.h"//接龙确认订单页

@interface JieLong_VC ()<UITableViewDelegate,UITableViewDataSource,SlideButtonViewDelegate,TC_JL_V_Delegate>{
    SlideButtonView   * slide;
}
@property (nonatomic,weak)TC_JL_V       *JLTC;//接龙弹出窗口

@end

@implementation JieLong_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self init_UI];
    self.title = @"车客接龙";

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    [self.JLTC layoutIfNeeded];
    self.JLTC.alpha = 0;
    self.JLTC.hidden = NO;
    [UIView animateWithDuration:.6 animations:^{
        self.JLTC.alpha = 1;
        [self.JLTC layoutIfNeeded];

    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.JLTC.hidden = YES;
}

-(void)init_UI{
    slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    slide.arr_Title = @[@"推荐",@"蔬菜",@"水果",@"禽蛋",@"肉类",@"蔬菜",@"水果",@"禽蛋",@"肉类",@"蔬菜",@"水果",@"禽蛋",@"肉类"];
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
    
    self.tableview.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.tableview.top = slide.bottom;
    self.tableview.height = ScreenHeight - slide.height  - kTabbarSafeBottomMargin ;
    self.tableview.backgroundColor = UIColorFromHex(0xf2f2f2);
    if (!iOS11) {
        self.tableview.height = ScreenHeight ;
    }
}

#pragma mark- 提交订单
-(void)TC_JL_V_Delegate_TJ{
    QueRenDingDan_JL_VC *vc = [[QueRenDingDan_JL_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 接龙弹出
-(TC_JL_V *)JLTC{
    if (!_JLTC) {
        TC_JL_V *JLTC = [TC_JL_V init_Xib];
        _JLTC = JLTC;
        _JLTC.frame = self.window.bounds;
        _JLTC.delegate = self;
    }
    return _JLTC;
}

#pragma mark- 选择条代理
-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        
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
    return [JieLong_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JieLong_Cell *cell = (JieLong_Cell *)[tableView dequeueReusableCellWithIdentifier:@"JieLong_Cell"];
    if (cell == nil) {
        cell= (JieLong_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"JieLong_Cell" owner:self options:nil]  lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
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
    self.JLTC.View_BJ_Y.constant = self.JLTC.height;
    [self.window addSubview:self.JLTC];
    
    [self.JLTC layoutIfNeeded];

    [UIView animateWithDuration:.4 animations:^{
        self.JLTC.View_BJ_Y.constant = 0;
        [self.JLTC layoutIfNeeded];
    } completion:^(BOOL finished) {
    }];
    
    
    
}


@end
