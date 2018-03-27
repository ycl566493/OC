//
//  ShangPinLieBiao_QRDD_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/14.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ShangPinLieBiao_QRDD_V.h"
#import "ShangPinXinXi_Cell.h"

@interface ShangPinLieBiao_QRDD_V()<UITableViewDelegate,UITableViewDataSource>{
    
}
@end

@implementation ShangPinLieBiao_QRDD_V

-(void)awakeFromNib{
    [super awakeFromNib];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.bounces = NO;
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_Data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ShangPinXinXi_Cell get_H];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXinXi_Cell *cell = (ShangPinXinXi_Cell *)[tableView dequeueReusableCellWithIdentifier:@"ShangPinXinXi_Cell"];
    if (cell == nil) {
        cell= (ShangPinXinXi_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"ShangPinXinXi_Cell" owner:self options:nil]  lastObject];
        cell.TGR = nil;
    }
    cell.tag = indexPath.row;
    QueRenDingDan_Model_Arr *MMM = self.arr_Data[indexPath.row];
    cell.Model = MMM;
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

-(void)setArr_Data:(NSArray *)arr_Data{
    _arr_Data = arr_Data;
    [self.tableV reloadData];
}

-(void)setIndex_Row:(NSInteger)index_Row{
    _index_Row = index_Row;
    if (index_Row <3) {
        self.tableV_H.constant = [ShangPinXinXi_Cell get_H] * index_Row;
    }else{
        self.tableV_H.constant = [ShangPinXinXi_Cell get_H] *2.5;
    }
    [self.tableV reloadData];
}

+(CGFloat)get_H:(id)data{
    if ([data integerValue] <3) {
        return 55.5 + [ShangPinXinXi_Cell get_H] *[data integerValue];
    }else{
        return 55.5 + [ShangPinXinXi_Cell get_H] *2.5;
    }
}
@end
