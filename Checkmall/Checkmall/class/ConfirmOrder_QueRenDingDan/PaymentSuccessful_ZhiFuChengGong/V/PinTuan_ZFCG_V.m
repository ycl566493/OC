//
//  PinTuan_ZFCG_V.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "PinTuan_ZFCG_V.h"
#import "ShangPin_XiaDan_Cell.h"


@interface PinTuan_ZFCG_V()<UITableViewDelegate,UITableViewDataSource>{
    
}
@end

@implementation PinTuan_ZFCG_V

-(void)awakeFromNib{
    [super awakeFromNib];
    [self init_UI];
}

#pragma mark- 初始化
-(void)init_UI{
    
    
    self.Btn_YQ.layer.masksToBounds = YES;
    self.Btn_YQ.layer.cornerRadius = 5;
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableV.backgroundColor = [UIColor whiteColor];
//    if (@available(iOS 11.0, *)){
//        self.tableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    }
    

    
}

-(void)setModel:(PTZFCG_Model_RootClass *)model{
    _model = model;
    
    for (UIView *vvvv in self.View_TX.subviews) {
        [vvvv removeFromSuperview];
    }
    
    for (NSInteger i = 0 ; i < (model.data.group.count > 6 ? 6 : model.data.group.count ); i++) {
        PTZFCG_Model_Group * mmmm = model.data.group[i];
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(9 + (9 + 45)*i, 5, 45, 45)];
        imageV.backgroundColor = [UIColor yellowColor];
        imageV.layer.masksToBounds = YES;
        imageV.layer.cornerRadius = imageV.width / 2;
//        imageV.layer.borderColor = UIColorFromHex(0xc2c2c2).CGColor;
        [imageV sd_setImageWithURL:[MyHelper imaeg_URL:mmmm.path view:imageV] placeholderImage:[UIImage imageNamed:@"MoRenTu"]];
        imageV.layer.borderWidth = .5;
        [self.View_TX addSubview:imageV];
        self.View_TX_W.constant = imageV.right +9;
        
        //        GengDuoTouXiang.png
        
        if (i == 0) {
            UILabel *lbL_TZ = [[UILabel alloc]initWithFrame:CGRectMake(imageV.left, imageV.top, 25, 12)];
            lbL_TZ.text = @"团长";
            lbL_TZ.textAlignment =1;
            lbL_TZ.font = [UIFont systemFontOfSize:8];
            lbL_TZ.backgroundColor = UIColorFromHex(0xff7800);
            lbL_TZ.textColor = [UIColor whiteColor];
            lbL_TZ.layer.borderWidth = .5;
            lbL_TZ.layer.borderColor = [UIColor whiteColor].CGColor;
            lbL_TZ.layer.masksToBounds = YES;
            lbL_TZ.layer.cornerRadius = lbL_TZ.height / 2;
            [self.View_TX addSubview:lbL_TZ];
        }
        
    }
    
    self.lbl_XDTS.text = [NSString stringWithFormat:@"第%li人下单，分享给好友，成功率会更高哦~",model.data.group.count];
    self.lbl_JSSJ.text= [NSString  stringWithFormat:@"距结束%@",[MyHelper time_SFM:[NSString stringWithFormat:@"%li",model.data.agotime]]];
    self.lbl_XDE.text = [NSString stringWithFormat:@"已经下单的%li人",model.data.group.count];
    [self.tableV reloadData];
}

-(void)setIndex_Row:(NSInteger)index_Row{
    _index_Row = index_Row;
    if (self.index_Row >=2 ) {
        self.tableV_H.constant = [ShangPin_XiaDan_Cell get_H:nil] * 2 ;
    }else{
        self.tableV_H.constant = [ShangPin_XiaDan_Cell get_H:nil] * self.index_Row;
    }
//    [self.tableV reloadData];
}

#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.index_Row;
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
    PTZFCG_Model_Group * mmmm = self.model.data.group[indexPath.row];
    cell.model_PT = mmmm;
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
    if ([data integerValue] >= 2) {
        return 204.5 + [ShangPin_XiaDan_Cell get_H:nil] * 2;
    }else{
        return 204.5 + [ShangPin_XiaDan_Cell get_H:nil] * [data integerValue] ;
    }
}

@end
