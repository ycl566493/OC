//
//  ShouYe_VC.m
//  车客生鲜
//
//  Created by 杨成龙MAC on 2018/3/3.
//  Copyright © 2018年 YCL. All rights reserved.
//

#import "ShouYe_VC.h"
#import "Image_Lunbo.h"//轮播
#import "ShouYe_H_BZ_V.h"//质量保证
#import "ShouYe_H_FL_V.h"//分类
#import "ShouYe_H_KB_V.h"//快报
#import "ShouYe_H_PTTJ_V.h"//拼团推荐
#import "ShouYe_H_RX_V.h"//热销
#import "ShouYe_Cell.h"//首页商品数据
#import "ZhuanXiang_VC.h"//专享
#import "DengLu_Vc.h"//登录
#import "ShangPinXiangQing_VC.h"//商品详情
#import "CollectionReusableView_H.h"
#import "JieLong_VC.h"//接龙
#import "SouSuo_VC.h"//搜索页面
#import "ShouYe_Model_RootClass.h"//首页model

@interface ShouYe_VC ()<ShouYe_H_PTTJ_V_delegate>{
    UIView          *view_Nav;//顶部视图
    Image_Lunbo     *LB;//轮播
    ShouYe_H_BZ_V   *BZ;//质量保证
    ShouYe_H_FL_V   *FL;//分类
    ShouYe_H_KB_V   *KB;//快报
    ShouYe_H_PTTJ_V *PTTJ;//拼团推荐
    ShouYe_H_RX_V   *RX;//热销
    
    ShouYe_Model_RootClass  *model;//首页model
}

@end

@implementation ShouYe_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.mj_y = -kStatusBarHeight;
    [self init_UI];

    //注册重用View
    [self.collectionView registerClass:[ShouYe_Cell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[CollectionReusableView_H class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];

    [self init_Data];
    
//    DengLu_VC *vc = [[DengLu_VC alloc]init];
//    BaseNavigationController    *nVc = [[BaseNavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:nVc animated:YES completion:^{
//        
//    }];
    
}

#pragma mark- 请求数据
-(void)init_Data{
    [NetRequest postWithUrl:product_getRecommendProduct params:@{@"page":@"1"} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"%@",dict);
        model = [[ShouYe_Model_RootClass alloc]initWithDictionary:dict];
        [self.collectionView reloadData];
        
    } fail:^(id error) {
        
    }];
}


- (void)init_UI{
    
    view_Nav = [[UIView alloc]initWithFrame:CGRectMake(0, 0 + kStatusLiu, ScreenWidth , 64)];
    view_Nav.backgroundColor = RGBA(0, 0, 0, 0);
    [self.view addSubview:view_Nav];
    
    //定位
    UIButton    *btn_DW = [[UIButton alloc]initWithFrame:CGRectMake(15, 20 + 6, 30, 30)];
    [btn_DW setImage:[UIImage imageNamed:@"DingWei"] forState:UIControlStateNormal];
    [view_Nav addSubview:btn_DW];
    
    //消息
    UIButton    *btn_XX = [[UIButton alloc]initWithFrame:CGRectMake(ScreenWidth  - 15 - 30, 20 + 6, 30, 30)];
    [btn_XX setImage:[UIImage imageNamed:@"XiaoXi"] forState:UIControlStateNormal];
    [view_Nav addSubview:btn_XX];
    
    //搜索
    UIButton    *btn_SS = [[UIButton alloc]initWithFrame:CGRectMake( btn_DW.right + 27, 20 + 6, btn_XX.left  - 27*2 - btn_DW.right , 30)];
    [btn_SS setImage:[UIImage imageNamed:@"ShouHuoDiZhi"] forState:UIControlStateNormal];
    [btn_SS addTarget:self action:@selector(btn_SS_Action) forControlEvents:UIControlEventTouchUpInside];
    [view_Nav addSubview:btn_SS];
    
    LB = [[Image_Lunbo alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 155)];
    LB.arr_data = @[@"http://pic29.photophoto.cn/20131204/0034034499213463_b.jpg",@"http://pic29.photophoto.cn/20131204/0034034499213463_b.jpg",@"http://pic29.photophoto.cn/20131204/0034034499213463_b.jpg",@"http://pic29.photophoto.cn/20131204/0034034499213463_b.jpg"];
    
    //质量保证
    BZ = [[ShouYe_H_BZ_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShouYe_H_BZ_V get_H:nil])];
    
    //首页分类
    FL = [[ShouYe_H_FL_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShouYe_H_FL_V get_H:nil])];
    
    //今日快报
    KB =[[ShouYe_H_KB_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShouYe_H_KB_V get_H:nil])];
    
    //拼团推荐
    PTTJ = [[ShouYe_H_PTTJ_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShouYe_H_PTTJ_V get_H:nil])];
    PTTJ.delegate = self;
    
    //热销
    RX = [[ShouYe_H_RX_V alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, [ShouYe_H_RX_V get_H:nil])];
    
    self.collectionView.backgroundColor = UIColorFromHex(0xf2f2f2);
    self.collectionView.height = ScreenHeight  - kTabbarHeight;
    
    if (!iOS11) {
        self.collectionView.top = -20;
        self.collectionView.height = ScreenHeight  + kStatusBarAndNavigationBarHeight - kTabbarHeight;
    }

}

#pragma mark- 拼团特价回调
- (void)ShouYe_H_PTTJ_V_delegate_Action:(NSInteger)tag{
    if (tag == 1) {
//        ZhuanXiang_VC *vc = [[ZhuanXiang_VC alloc]init];
//        vc.bool_TZ = YES;
        JieLong_VC  *vc = [[JieLong_VC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (tag == 2){
        
    }
}

#pragma mark- 搜索
- (void)btn_SS_Action{
    SouSuo_VC *vc = [[SouSuo_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark- collectionviewcollection代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 3) {
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
        return CGSizeMake(ScreenWidth, 155);
    }
    if (section == 1) {
        return CGSizeMake(ScreenWidth, FL.height);
    }
    if (section == 2) {
        return CGSizeMake(ScreenWidth, PTTJ.height);
    }
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(ScreenWidth, BZ.height);
    }
    if (section == 1) {
        return CGSizeMake(ScreenWidth, KB.height);
    }
    if (section == 2) {
        return CGSizeMake(ScreenWidth, RX.height);
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
            [header addSubview:LB];
        }
        if (indexPath.section == 1) {
            [header addSubview:FL];
        }
        if (indexPath.section == 2) {
            [header addSubview:PTTJ];
        }
        return header;
    }
    //如果底部视图
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [footer addSubview:BZ];
        }
        if (indexPath.section == 1) {
            [footer addSubview:KB];
        }
        if (indexPath.section == 2) {
            [footer addSubview:RX];
        }
        return footer;
    }
    return nil;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return BZ;
    }
    if (section == 1) {
        return KB;
    }
    if (section == 2) {
        return RX;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
    
    ShouYe_Model_Data *MMMM = model.data[indexPath.row];
    vc.Str_ID = [NSString stringWithFormat:@"%li",MMMM.productId];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView.contentOffset.y < 100) {
//        view_Nav.backgroundColor = RGBA(255, 255, 255, ((int)scrollView.contentOffset.y) %100 * .01);
//    }else{
//        view_Nav.backgroundColor = RGBA(255, 255, 255, 1);
//    }
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self FGX:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"yinchangtabbarviewcontroller" object:@"3" userInfo:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self FGX:NO];


}


@end
