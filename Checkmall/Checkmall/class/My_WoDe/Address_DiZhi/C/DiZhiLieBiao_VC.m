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

@interface DiZhiLieBiao_VC ()<SlideButtonViewDelegate,DiZhi_Add_V_Delegate,DiZhi_Cell_Delegate,SongHuoDiZhi_Cell_Delegate>{
    SlideButtonView     *slide;//利用其tag来区分第一第二列
    DiZhi_Add_V         *TJ;//添加地址
    BOOL                bool_MD;//是否是门店
    
}

@property(nonatomic,weak)TC_TJDZ_V *  TJDZ;
@property(nonatomic,weak)TC_KDDZ *  KDDZ;

@end

@implementation DiZhiLieBiao_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    bool_MD = YES;
    
    self.title = @"管理收货地址";
    [self init_UI];
    [self init_Data];
}

#pragma mark-data
-(void)init_Data{
    [NetRequest postWithUrl:address_getAddressList params:@{@"token":[MyHelper toToken],@"type":bool_MD?@"1":@"2"} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"获取地址列表 == = %@",dict);
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
    
    if (!iOS11) {
    self.tableview.height = ScreenHeight ;
        
    }
    
    
//    [self.tableview registerNib:[UINib nibWithNibName:@"DiZhi_Cell" bundle:nil] forCellReuseIdentifier:@"DiZhi_Cell"];
//    [self.tableview registerNib:[UINib nibWithNibName:@"DiZhi_Cell"bundle:[NSBundlemainBundle]]forCellReuseIdentifier:@"DiZhi_Cell"];
//    NewTableViewCell *newcell = [tableViewdequeueReusableCellWithIdentifier:@"DiZhi_Cell"];
    TJ = [[DiZhi_Add_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [DiZhi_Add_V get_H:nil])];
    TJ.delegate = self;
    
}

#pragma mark- 门店cell代理
-(void)DiZhi_Cell_Delegate_SC{
    //删除
}
-(void)DiZhi_Cell_Delegate_BJ{
    //编辑
}
-(void)DiZhi_Cell_Delegate_MR{
    //默认
}

#pragma mark- 快递地址代理
-(void)SongHuoDiZhi_Cell_Delegate_SC{
    //删除
}
-(void)SongHuoDiZhi_Cell_Delegate_BJ{
    //编辑
}
-(void)SongHuoDiZhi_Cell_Delegate_MR{
    //默认
}

-(TC_TJDZ_V *)TJDZ{
    if (!_TJDZ) {
        TC_TJDZ_V * TJDZ = [TC_TJDZ_V init_Xib];
        _TJDZ = TJDZ;
        _TJDZ.frame = self.window.bounds;
    }
    return _TJDZ;
}

-(TC_KDDZ *)KDDZ{
    if (!_KDDZ) {
        TC_KDDZ * KDDZ = [TC_KDDZ init_Xib];
        _KDDZ = KDDZ;
        _KDDZ.frame = self.window.bounds;
    }
    return _KDDZ;
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
        [self.tableview reloadData];
    }
}


#pragma mark- tableview代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

#define ssssss @"阿凡达了解啦可视对讲弗兰克斯剪短发垃圾收代理费卡吉林省打飞机阿拉山口"
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   if (slide.tag == 0) {
       return [DiZhi_Cell get_H:ssssss];
       
   }else{
       return [SongHuoDiZhi_Cell get_H:ssssss];

   }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (slide.tag == 0) {
        DiZhi_Cell *cell = (DiZhi_Cell *)[tableView dequeueReusableCellWithIdentifier:@"DiZhi_Cell"];
        if (cell == nil) {
            cell= (DiZhi_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"DiZhi_Cell" owner:self options:nil]  lastObject];
        }
        [cell set_title:ssssss];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegete = self;
        return cell;
    }else{
        SongHuoDiZhi_Cell *cell = (SongHuoDiZhi_Cell *)[tableView dequeueReusableCellWithIdentifier:@"SongHuoDiZhi_Cell"];
        if (cell == nil) {
            cell= (SongHuoDiZhi_Cell *)[[[NSBundle  mainBundle]  loadNibNamed:@"SongHuoDiZhi_Cell" owner:self options:nil]  lastObject];
        }
        [cell set_title:ssssss];
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
    
}




@end
