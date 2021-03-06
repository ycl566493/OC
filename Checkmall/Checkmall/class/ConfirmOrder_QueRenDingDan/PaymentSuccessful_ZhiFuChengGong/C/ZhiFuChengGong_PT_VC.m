//
//  ZhiFuChengGong_PT_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/16.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhiFuChengGong_PT_VC.h"
#import "ShangPinXiangQing_VC.h"//商品详情
#import "ShouYe_Cell.h"//cell
#import "ShouYe_H_RX_V.h"//热销
#import "ShangPinXinXi_Cell.h"//商品信息
#import "PinTuan_ZFCG_V.h"//拼团
#import "CollectionReusableView_H.h"
#import "PinTuanXuZhi_V.h"//拼团须知
#import "PTZFCG_Model_RootClass.h"//model

#import "ShouYe_Model_RootClass.h"//商品列表
#import "CGFX_Model_RootClass.h"//分享model

@interface ZhiFuChengGong_PT_VC ()<ShouYe_Cell_Delegate_GWC,PinTuan_ZFCG_V_Delegate>{
    ShouYe_H_RX_V           *RX;
//    UIButton                *btn_GWC;
    PTZFCG_Model_RootClass  *model_PTCG;
    ShouYe_Model_RootClass  *model_SP;
    
    CGFX_Model_RootClass      *model_FX;
}

@property (nonatomic,weak)ShangPinXinXi_Cell *SP;//商品信息

@property (nonatomic,weak)PinTuan_ZFCG_V    *ZFXX;//支付信息

@property (nonatomic,weak)PinTuanXuZhi_V        *PTXZ;//拼团须知

@end

@implementation ZhiFuChengGong_PT_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pageIndex = 1;
    self.title = @"支付成功";
    [self init_UI];
    
    [self init_Data];
    [self init_Data:YES];
    
    [self init_FX];
}

- (void)init_FX{
    NSDictionary *dic = @{@"order_sn":self.str_DDID};
    [NetRequest postWithUrl:Order_paySuccessShare params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"接龙分享 = =%@",dict);
        model_FX = [[CGFX_Model_RootClass alloc]initWithDictionary:dict];
    } fail:^(id error) {
        
    }];
}

- (void)PinTuan_ZFCG_V_Delegate_FX{
    if (!model_FX) {
        return;
    }
    [FenXiang_Object Shar:model_FX.data.name str_NR:model_FX.data.promotion image_URL:model_FX.data.image str_LJ:model_FX.data.path];
    
}


- (void)init_Data{
    NSDictionary *dic = @{@"order_sn":self.str_DDID,@"gid":self.str_SPID};
    [NetRequest postWithUrl:Order_groupBuyReturn params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"订单信息成功 = =%@",dict);
        model_PTCG = [[PTZFCG_Model_RootClass alloc]initWithDictionary:dict];
        if (model_PTCG.code == 1) {
            [self UP_UI];
        }
    } fail:^(id error) {

    }];
}

#pragma mark- 更新视图
- (void)UP_UI{
    self.SP.Model_PTCG = model_PTCG;
    
    self.ZFXX.height = [PinTuan_ZFCG_V get_H:[NSString stringWithFormat:@"%li",model_PTCG.data.group.count]];
    self.ZFXX.index_Row = model_PTCG.data.group.count;
    self.ZFXX.model = model_PTCG;
    self.PTXZ.height = [PinTuanXuZhi_V get_H:nil];

    [self.collectionView reloadData];
}

#pragma mark- 商品列表
- (void)init_Data:(BOOL)Y_N{
    [NetRequest postWithUrl:product_getRecommendProduct params:@{@"page":[NSString stringWithFormat:@"%li",self.pageIndex]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if (Y_N) {
            model_SP = [[ShouYe_Model_RootClass alloc]initWithDictionary:dict];
            
        }else{
            [model_SP Add_Dictionary:dict];;
        }
        [self.collectionView reloadData];
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 初始化
- (void)init_UI{
    
    //热销
    RX = [[ShouYe_H_RX_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShouYe_H_RX_V get_H:nil])];
    
    self.collectionView.height = ScreenHeight - kTabbarSafeBottomMargin;
    if (!iOS11) {
        self.collectionView.height = ScreenHeight + kNavigationBarHeight;
    }
    self.collectionView.backgroundColor = UIColorFromHex(0xf2f2f2);
    
    [self.collectionView registerClass:[ShouYe_Cell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[CollectionReusableView_H class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
    
//    btn_GWC = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 50 - 15, ScreenHeight - kTabbarSafeBottomMargin - kStatusBarAndNavigationBarHeight - 15 - 50, 50, 50)];
//    [btn_GWC setImage:[UIImage imageNamed:@"GouWuCheYuan"] forState:UIControlStateNormal];
//    [self.view addSubview:btn_GWC];
}

- (void)refresh{
    //下拉请求
    [self endRefreshing];
    self.pageIndex = 1;
    [self init_Data:YES];
}
- (void)loadMore{
    //加载更多
    [self endRefreshing];
    self.pageIndex  += 1;

    [self init_Data:NO];
}


-(PinTuanXuZhi_V *)PTXZ{
    if (!_PTXZ) {
        PinTuanXuZhi_V *PTXZ = [PinTuanXuZhi_V init_Xib];
        PTXZ.width = self.view.width;
        [self.view addSubview:PTXZ];
        _PTXZ = PTXZ;
        _PTXZ.height = [PinTuanXuZhi_V get_H:nil];
        _PTXZ.width = ScreenWidth;
        [_PTXZ.btn_PT setImage:[UIImage imageNamed:@"YaoQingChanTuan"] forState:UIControlStateNormal];
    }
    _PTXZ.height = [PinTuanXuZhi_V get_H:nil];

    return _PTXZ;
}

#pragma mark- 支付信息
-(PinTuan_ZFCG_V *)ZFXX{
    if (!_ZFXX) {
        PinTuan_ZFCG_V *ZFXX = [PinTuan_ZFCG_V init_Xib];
        ZFXX.width = self.view.width;
        [self.view addSubview:ZFXX];
        _ZFXX = ZFXX;
        _ZFXX.delegate = self;
        _ZFXX.height = [PinTuan_ZFCG_V get_H:@"4"];
        _ZFXX.width = ScreenWidth;
        _ZFXX.index_Row = 4;
        
    }
    return _ZFXX;
}

#pragma mark- 商品信息
-(ShangPinXinXi_Cell *)SP{
    if (!_SP) {
        ShangPinXinXi_Cell *SP = [ShangPinXinXi_Cell init_Xib];
        SP.width = self.view.width;
        [self.view addSubview:SP];
        _SP = SP;

        _SP.height = [ShangPinXinXi_Cell get_H];
        _SP.width = ScreenWidth ;
    }
    return _SP;
}

-(void)ShouYe_Cell_Delegate_GWC:(NSInteger)tag{
    ShouYe_Model_Data *MMMM = model_SP.data[tag];
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"goods_id":[NSString stringWithFormat:@"%li",MMMM.productId],@"num":@"1"};
    
    [NetRequest postWithUrl:goodscar_addGoodsToCar params:dic showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        
        NSLog(@"添加购物车 = = =%@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [MyHelper showMessage:@"添加购物车成功！"];
            [MyHelper UP_GWCSL];
        }
    } fail:^(id error) {
        
        
    }];
}

#pragma mark- collectionviewcollection代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 2) {
        return model_SP.data.count;
    }
    return 0;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"cell";
    ShouYe_Cell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ShouYe_Model_Data *mmmm = model_SP.data[indexPath.row];
    cell.ShouYe_Model = mmmm;
    cell.tag = indexPath.row;
    cell.delegate = self;
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth - 3) / 2, [ShouYe_Cell get_H:nil]);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(1, 0, 1, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(ScreenWidth, self.SP.height);
    }else if (section == 1){
        return CGSizeMake(ScreenWidth, self.PTXZ.height);
    }
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(ScreenWidth, self.ZFXX.height);
    }else if (section == 1){
        return CGSizeMake(ScreenWidth, [ShouYe_H_RX_V get_H:nil]);
    }
    return CGSizeMake(0, 0);
}

//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        CollectionReusableView_H *header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        //添加头视图的内容
        //头视图添加view
        if (indexPath.section == 0) {
            [header addSubview:self.SP];
        }
        if (indexPath.section == 1) {
            [header addSubview:self.PTXZ];
        }
        
        return header;
    }
    //如果底部视图
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [footer addSubview:self.ZFXX];
        }
        if (indexPath.section == 1) {
            [footer addSubview:RX];
        }
        return footer;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
