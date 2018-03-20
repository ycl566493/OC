//
//  ShangPin_XiaDan_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPin_XiaDan_V.h"
#import "ShangPin_XiaDan_Cell.h"

@interface ShangPin_XiaDan_V()<UITableViewDataSource,UITableViewDelegate>{
    UITableView         *tableV;//滑动列表
    UILabel             *lbl_XDR;//下单人数
    UILabel             *lbl_JSSJ;//结束时间
    
    UIView              *view_FGX;//分割线
    
}
@end

@implementation ShangPin_XiaDan_V

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self init_UI];
    }
    return self;
}

#pragma mark- 初始化
-(void)init_UI{
    lbl_XDR = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 250, 45)];
    lbl_XDR.font = font15;
    lbl_XDR.text = @"已有9999人下单,可以直接参与";
    [self addSubview:lbl_XDR];
    
    lbl_JSSJ = [[UILabel alloc]initWithFrame:CGRectMake(ScreenWidth - 215, 0, 200, 45)];
    lbl_JSSJ.font = font13;
    lbl_JSSJ.textColor = UIColorFromHex(0x666666);
    lbl_JSSJ.text = @"距离结束 222:22:33";
    lbl_JSSJ.textAlignment = 2;
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JSSJ.text];
    NSRange range = NSMakeRange(4, 10);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0xff7800) range:range];
    lbl_JSSJ.attributedText = attributedStr;
    
    [self addSubview:lbl_JSSJ];
    
    view_FGX  =[[UIView alloc]initWithFrame:CGRectMake(0, 45, ScreenWidth, .5)];
    view_FGX.backgroundColor = UIColorFromHex(0xececec);
    
    [self addSubview:view_FGX];
    
    tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, view_FGX.bottom, ScreenWidth, [ShangPin_XiaDan_Cell get_H:nil]*2)];
    tableV.delegate = self;
    tableV.dataSource = self;
    tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    table_V_FL.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableV.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)){
        tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self addSubview:tableV];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
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

+(CGFloat)get_H:(id)data{
    return [ShangPin_XiaDan_Cell get_H:nil] * 2 + 45 + .5;
}



@end
