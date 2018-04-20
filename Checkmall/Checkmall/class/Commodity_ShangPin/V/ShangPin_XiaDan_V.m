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
    lbl_XDR.textColor = UIColorFromHex(0x333333);
    lbl_XDR.text = @"已有0人下单,可以直接参与";
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

-(void)setModel:(ShangPin_Model_RootClass *)model{
    _model = model;
    lbl_XDR.text = [NSString stringWithFormat:@"已有%ld人下单,可以直接参与",(long)model.data.groupSum];
    
    lbl_JSSJ.text = [NSString stringWithFormat:@"距离结束 %@",[MyHelper time_SFM:[NSString stringWithFormat:@"%li",model.data.surplusTime]]];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JSSJ.text];
    NSRange range = NSMakeRange(4, [MyHelper time_SFM:[NSString stringWithFormat:@"%li",model.data.surplusTime]].length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0xff7800) range:range];
    lbl_JSSJ.attributedText = attributedStr;
    

    [tableV reloadData];
}

-(void)setModel_JL:(JLXQ_Model_RootClass *)model_JL{
    _model_JL = model_JL;
    
    lbl_XDR.text = [NSString stringWithFormat:@"已有%@人下单,可以直接参与",model_JL.data.sumnum];
    
    lbl_JSSJ.text = [NSString stringWithFormat:@"距离结束 %@",[MyHelper time_SFM:[NSString stringWithFormat:@"%li",model_JL.data.surplusTime]]];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:     lbl_JSSJ.text];
    NSRange range = NSMakeRange(4, [MyHelper time_SFM:[NSString stringWithFormat:@"%li",model_JL.data.surplusTime]].length + 1);
    // 设置颜色
    [attributedStr addAttribute:NSForegroundColorAttributeName value:UIColorFromHex(0xff7800) range:range];
    lbl_JSSJ.attributedText = attributedStr;
    
    
    [tableV reloadData];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.model) {
        return self.model.data.groupUserInfo.count;
    }else{
        return self.model_JL.data.buyuser.count;
    }
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
    if (self.model) {
        ShangPin_Model_GroupUserInfo *mmm = self.model.data.groupUserInfo[indexPath.row];
        cell.model = mmm;
    }else{
        JLXQ_Model_Buyuser *mmm = self.model_JL.data.buyuser[indexPath.row];
        cell.model_JLXQ = mmm;
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
    
    return [ShangPin_XiaDan_Cell get_H:nil] * ([data integerValue] > 2 ? 2 : [data integerValue]) + 45 + .5;
}



@end
