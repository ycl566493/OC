//
//  DiZhiLieBiao_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/12.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "DiZhiLieBiao_VC.h"
#import "SlideButtonView.h"
#import "DiZhi_Cell.h"//cell自提
#import "SongHuoDiZhi_Cell.h"//送货地址
#import "DiZhi_Add_V.h"//添加地址
#import "TC_TJDZ_V.h"//自提地址
#import "TC_KDDZ.h"//快递地址
#import "DiZhiLieBiao_Model_RootClass.h"//地址列表

@interface DiZhiLieBiao_VC ()<SlideButtonViewDelegate,DiZhi_Add_V_Delegate,DiZhi_Cell_Delegate,SongHuoDiZhi_Cell_Delegate,TC_TJDZ_V_Delegate,TC_KDDZ_Delegate>{
    SlideButtonView     *slide;//利用其tag来区分第一第二列
    DiZhi_Add_V         *TJ;//添加地址
    BOOL                bool_MD;//是否是门店
    
    DiZhiLieBiao_Model_RootClass    *model;
    
}

@property(nonatomic,weak)TC_TJDZ_V *  TJDZ;
@property(nonatomic,weak)TC_KDDZ *  KDDZ;

@end

@implementation DiZhiLieBiao_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"管理收货地址";
    [self init_UI];
    [self init_Data];
}

#pragma mark-data
-(void)init_Data{
    NSDictionary *dic =@{@"token":[MyHelper toToken],@"type":slide.tag == 0?@"1":@"2"};
    [NetRequest postWithUrl:address_getAddressList params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"获取地址列表 == = %@",dict);
        model = [[DiZhiLieBiao_Model_RootClass alloc]initWithDictionary:dict];
        if (model.code == 1) {
            [self.tableview reloadData];
        }
    } fail:^(id error) {
        
    }];
}

-(void)init_UI{
    
    self.view.backgroundColor = UIColorFromHex(0xf3f3f3);
    
    slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    slide.arr_Title = @[@"门店地址",@"送货上门"];
    slide.Font_Size = 14;
    slide.No_Color = UIColorFromHex(0x333333);
    slide.Yes_Color = UIColorFromHex(0x8c8c8c);
    slide.No_backgroundColor = UIColorFromHex(0xf3f3f3);
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
    [self removedRefreshing];
    if (!iOS11) {
    self.tableview.height = ScreenHeight ;
        
    }
    
    TJ = [[DiZhi_Add_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [DiZhi_Add_V get_H:nil])];
    TJ.delegate = self;
    
}

#pragma mark- 门店cell代理
-(void)DiZhi_Cell_Delegate_SC:(NSInteger)tag{
    //删除
    [self data_SC:tag];
}
-(void)DiZhi_Cell_Delegate_BJ:(NSInteger)tag{
    //编辑
    
    [self.window addSubview:self.TJDZ];
    
    DiZhiLieBiao_Model_Data *MMMM = model.data[tag];

    self.TJDZ.model = MMMM;
}
-(void)DiZhi_Cell_Delegate_MR:(NSInteger)tag{
    //默认
    [self data_MR:tag];
}

#pragma mark- 快递地址代理
-(void)SongHuoDiZhi_Cell_Delegate_SC:(NSInteger)tag{
    //删除
    [self data_SC:tag];
}

-(void)SongHuoDiZhi_Cell_Delegate_BJ:(NSInteger)tag{
    //编辑
    [self.window addSubview:self.KDDZ];
    
    DiZhiLieBiao_Model_Data *MMMM = model.data[tag];
    
    self.KDDZ.model = MMMM;
}
-(void)SongHuoDiZhi_Cell_Delegate_MR:(NSInteger)tag{
    //默认
    [self data_MR:tag];

}

#pragma mark- 删除接口
- (void)data_SC:(NSInteger)tag{
    //删除
    DiZhiLieBiao_Model_Data *MMMM = model.data[tag];
    [NetRequest postWithUrl:address_delAddress params:@{@"id":[NSString stringWithFormat:@"%li",(long)MMMM.idField]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        
        NSLog(@"删除接口 ==  %@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [self init_Data];
        }
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 默认地址
- (void)data_MR:(NSInteger)tag{
    DiZhiLieBiao_Model_Data *MMMM = model.data[tag];
    [NetRequest postWithUrl:address_updateAddressIsFirst params:@{@"id":[NSString stringWithFormat:@"%li",(long)MMMM.idField]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        if ([dict[@"code"] integerValue] == 1) {
            [self init_Data];
        }
    } fail:^(id error) {
        
    }];
}

-(TC_TJDZ_V *)TJDZ{
    if (!_TJDZ) {
        TC_TJDZ_V * TJDZ = [TC_TJDZ_V init_Xib];
        _TJDZ = TJDZ;
        _TJDZ.delegate = self;
        _TJDZ.frame = self.window.bounds;
    }
    return _TJDZ;
}

-(TC_KDDZ *)KDDZ{
    if (!_KDDZ) {
        TC_KDDZ * KDDZ = [TC_KDDZ init_Xib];
        _KDDZ = KDDZ;
        _KDDZ.delegate = self;
        _KDDZ.frame = self.window.bounds;
    }
    return _KDDZ;
}

#pragma mark- 添加地址成功
- (void)TC_TJDZ_V_Delegate_CG{
    [self init_Data];
}

-(void)TC_KDDZ_Delegate_CG{
    [self init_Data];
}

#pragma mark- 添加地址
-(void)DiZhi_Add_V_Delegate_ADD{
    if (slide.tag == 0) {
        [self.window addSubview:self.TJDZ];
    }else{
        [self.window addSubview:self.KDDZ];
    }
}

#pragma mark- 滑动代理
-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (slide.tag != btn_Tag) {
        slide.tag = btn_Tag;
        
        [self init_Data];
    }
}


#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return model.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   if (slide.tag == 0) {
       DiZhiLieBiao_Model_Data *MMMM = model.data[indexPath.row];
       return [DiZhi_Cell get_H:MMMM.address];
       
   }else{
       DiZhiLieBiao_Model_Data *MMMM = model.data[indexPath.row];

       return [SongHuoDiZhi_Cell get_H:MMMM.address];
   }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (slide.tag == 0) {
        DiZhi_Cell *cell = (DiZhi_Cell *)[tableView dequeueReusableCellWithIdentifier:@"DiZhi_Cell"];
        if (cell == nil) {
            cell= (DiZhi_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"DiZhi_Cell" owner:self options:nil]  lastObject];
        }
        DiZhiLieBiao_Model_Data *MMMM = model.data[indexPath.row];
        cell.model = MMMM;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tag = indexPath.row;
        cell.delegete = self;
        return cell;
    }else{
        SongHuoDiZhi_Cell *cell = (SongHuoDiZhi_Cell *)[tableView dequeueReusableCellWithIdentifier:@"SongHuoDiZhi_Cell"];
        if (cell == nil) {
            cell= (SongHuoDiZhi_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"SongHuoDiZhi_Cell" owner:self options:nil]  lastObject];
        }
        DiZhiLieBiao_Model_Data *MMMM = model.data[indexPath.row];
        cell.model = MMMM;

        cell.tag = indexPath.row;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegete = self;
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return TJ.height;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return TJ;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(DiZhiLieBiao_VC_Delegate_DZ:)]) {
        DiZhiLieBiao_Model_Data *MMMM = model.data[indexPath.row];
        [self.delegate DiZhiLieBiao_VC_Delegate_DZ:MMMM];
    }
}




@end
