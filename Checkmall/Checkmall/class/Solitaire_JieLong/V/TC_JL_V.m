//
//  TC_JL_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/19.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "TC_JL_V.h"
#import "TC_JL_Cell.h"

@interface TC_JL_V()<UITableViewDataSource,UITableViewDelegate>{
    
}
@end

@implementation TC_JL_V

#pragma mark- 关闭按钮
- (IBAction)btn_GB:(id)sender {
    
    [self layoutIfNeeded];
    [UIView animateWithDuration:.4 animations:^{
        self.View_BJ_Y.constant = self.height;

        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

#pragma mark- 提交按钮
- (IBAction)btn_TJ:(id)sender {
    if (self.delegate &&[self.delegate respondsToSelector:@selector(TC_JL_V_Delegate_TJ)]) {
        [self.delegate TC_JL_V_Delegate_TJ];
    }
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
}

-(void)init_UI{
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;

}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [TC_JL_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TC_JL_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"TC_JL_Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TC_JL_Cell" owner:self options:nil] lastObject];
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
    
}


@end
