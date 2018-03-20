//
//  ZhiFuChengGong_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/15.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "ZhiFuChengGong_VC.h"
#import "ShangPinXiangQing_VC.h"//商品详情
#import "ShouYe_Cell.h"//cell
#import "ShouYe_H_RX_V.h"//热销
#import "DanPin_V.h"//单品成功
#import "CollectionReusableView_H.h"

@interface ZhiFuChengGong_VC (){
    ShouYe_H_RX_V           *RX;
    UIButton                *btn_GWC;//购物车
}

@property (weak,nonatomic)DanPin_V      *DP;

@end

@implementation ZhiFuChengGong_VC

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

- (DanPin_V *)DP {
    if (!_DP) {
        DanPin_V *DP = [DanPin_V init_Xib];
        [self.view addSubview:DP];
        _DP = DP;
        _DP.width = ScreenWidth;
        _DP.height = [DanPin_V get_H:nil];
    }
    return _DP;
}

#pragma mark- collectionviewcollection代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
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
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(ScreenWidth, [DanPin_V get_H:nil]);
    }
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
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
            [header addSubview:self.DP];
        }
        return header;
    }
    //如果底部视图
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [footer addSubview:RX];
        }
        return footer;
    }
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
