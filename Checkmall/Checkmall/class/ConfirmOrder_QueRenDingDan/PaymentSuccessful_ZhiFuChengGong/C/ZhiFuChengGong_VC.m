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
#import "ShouYe_Model_RootClass.h"//首页的数据modle
#import "DingDanLieBiao_VC.h"
#import "CGFX_Model_RootClass.h"

@interface ZhiFuChengGong_VC ()<ShouYe_Cell_Delegate_GWC,DanPin_V_Delegate>{
    ShouYe_H_RX_V           *RX;
    UIButton                *btn_GWC;//购物车
    ShouYe_Model_RootClass  *model;
    CGFX_Model_RootClass        *model_FX;
}

@property (weak,nonatomic)DanPin_V      *DP;

@end

@implementation ZhiFuChengGong_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付成功";
    [self init_UI];
    [self setLeftItemWithIcon:nil title:nil selector:nil];
    self.pageIndex = 1;
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


- (void)DanPin_V_Delegate_Action_FX{
    if (!model_FX) {
        return;
    }
    [FenXiang_Object Shar:model_FX.data.name str_NR:model_FX.data.promotion image_URL:model_FX.data.image str_LJ:model_FX.data.path];
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
    
//    btn_GWC = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth - 50 - 15, ScreenHeight - kTabbarSafeBottomMargin - kStatusBarAndNavigationBarHeight - 15 - 50, 50, 50)];
//    [btn_GWC setImage:[UIImage imageNamed:@"GouWuCheYuan"] forState:UIControlStateNormal];
//    [self.view addSubview:btn_GWC];

}
#pragma mark- 订单
-(void)DanPin_V_Delegate_Action_DD{
    DingDanLieBiao_VC *vc = [[DingDanLieBiao_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark- 返回
-(void)DanPin_V_Delegate_Action_FH{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)ShouYe_Cell_Delegate_GWC:(NSInteger)tag{
    ShouYe_Model_Data *MMMM = model.data[tag];
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

- (void)refresh{
    //下拉请求
    [self endRefreshing];
    self.pageIndex = 1;
    [self init_Data:YES];
}

- (void)loadMore{
    //加载更多
    [self endRefreshing];
    self.pageIndex += 1;
    [self init_Data:NO];
}

- (void)init_Data:(BOOL)Y_N{
    [NetRequest postWithUrl:product_getRecommendProduct params:@{@"page":[NSString stringWithFormat:@"%li",self.pageIndex]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        if (Y_N) {
            model = [[ShouYe_Model_RootClass alloc]initWithDictionary:dict];
            
        }else{
            [model Add_Dictionary:dict];;
        }
        [self.collectionView reloadData];
        
    } fail:^(id error) {
        
    }];
}

- (DanPin_V *)DP {
    if (!_DP) {
        DanPin_V *DP = [DanPin_V init_Xib];
        [self.view addSubview:DP];
        _DP = DP;
        _DP.delegate = self;
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
        return model.data.count;
    }
    return 0;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"cell";
    ShouYe_Cell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    ShouYe_Model_Data *MMMM = model.data[indexPath.row];
    cell.ShouYe_Model = MMMM;
    cell.tag = indexPath.row;
    cell.delegate =self;
    cell.is_DH = NO;
    return cell;
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth - 3) / 2, [ShouYe_Cell get_H:nil]);
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
            self.DP.lbl_JG.text = [NSString stringWithFormat:@"￥%@",self.str_JG];
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


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
    ShouYe_Model_Data *MMMM = model.data[indexPath.row];

    vc.Str_ID = [NSString stringWithFormat:@"%li",MMMM.productId];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
