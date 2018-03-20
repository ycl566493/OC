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

@interface ZhiFuChengGong_PT_VC (){
    ShouYe_H_RX_V           *RX;
    UIButton                *btn_GWC;
}

@property (nonatomic,weak)ShangPinXinXi_Cell *SP;//商品信息

@property (nonatomic,weak)PinTuan_ZFCG_V    *ZFXX;//支付信息

@property (nonatomic,weak)PinTuanXuZhi_V        *PTXZ;//拼团须知

@end

@implementation ZhiFuChengGong_PT_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"支付成功";
    [self init_UI];
}

-(void)init_UI{
    
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
    
    btn_GWC = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 50 - 15, ScreenHeight - kTabbarSafeBottomMargin - kStatusBarAndNavigationBarHeight - 15 - 50, 50, 50)];
    [btn_GWC setImage:[UIImage imageNamed:@"GouWuCheYuan"] forState:UIControlStateNormal];
    [self.view addSubview:btn_GWC];
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
    return _PTXZ;
}

#pragma mark- 支付信息
-(PinTuan_ZFCG_V *)ZFXX{
    if (!_ZFXX) {
        PinTuan_ZFCG_V *ZFXX = [PinTuan_ZFCG_V init_Xib];
        ZFXX.width = self.view.width;
        [self.view addSubview:ZFXX];
        _ZFXX = ZFXX;

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

#pragma mark- collectionviewcollection代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 2) {
        return 10;
    }
    return 0;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"cell";
    ShouYe_Cell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth - 3) / 2, 273);
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
