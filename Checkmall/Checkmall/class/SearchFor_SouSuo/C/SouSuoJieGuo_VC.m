//
//  SouSuoJieGuo_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SouSuoJieGuo_VC.h"
#import "ShouYe_Cell.h"
#import "ShangPinXiangQing_VC.h"
#import "SouSuo_Model_RootClass.h"//model

@interface SouSuoJieGuo_VC ()<ShouYe_Cell_Delegate_GWC>{
    SouSuo_Model_RootClass  *model;
}

@end

@implementation SouSuoJieGuo_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"商品搜索";
    self.view.backgroundColor = [UIColor whiteColor];
    self.pageIndex = 1;
    [self init_UI];
    
    
}

-(void)ShouYe_Cell_Delegate_GWC:(NSInteger)tag{
    SouSuo_Model_Data *MMMM = model.data[tag];
    if (![kUserDefaults boolForKey:DengLuZhuangTai]) {
        [self QuDeLu];
        return;
    }
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"goods_id":[NSString stringWithFormat:@"%li",MMMM.idField],@"num":@"1"};
    
    [NetRequest postWithUrl:goodscar_addGoodsToCar params:dic showAnimate:NO showMsg:NO vc:self success:^(NSDictionary *dict) {
        
        
        NSLog(@"添加购物车 = = =%@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [MyHelper showMessage:@"添加购物车成功！"];
            [MyHelper UP_GWCSL];
        }
    } fail:^(id error) {
        
        
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    
    [self init_Data_SS:YES];
}

- (void)init_Data_SS:(BOOL)Y_N{
   
    [NetRequest postWithUrl:Search_goodsSearch params:@{@"goodsname":self.str_Name,@"page":[NSString stringWithFormat:@"%li",self.pageIndex]} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {
        NSLog(@"搜索历史 = = %@",dict);
        
        if (Y_N) {
            model = [[SouSuo_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model Add_Dictionary:dict];
        }
        if (model.code == 1) {
            [self.collectionView reloadData];
        }
    } fail:^(id error) {
        
    }];
}

- (void)refresh{
    //下拉请求
    [self endRefreshing];
    self.pageIndex = 1;
    [self init_Data_SS:YES];
    
}
- (void)loadMore{
    //加载更多
    [self endRefreshing];
    self.pageIndex ++ ;
    [self init_Data_SS:NO];
}


-(void)init_UI{
    self.collectionView.height = ScreenHeight - kTabbarSafeBottomMargin;
    if (!iOS11) {
        self.collectionView.height = ScreenHeight + kNavigationBarHeight;
    }
    self.collectionView.backgroundColor = UIColorFromHex(0xf2f2f2);
    
    [self.collectionView registerClass:[ShouYe_Cell class] forCellWithReuseIdentifier:@"cell"];
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
    
    SouSuo_Model_Data   *MMMMM = model.data[indexPath.row];
    cell.model_SS = MMMMM;
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
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

//  返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
    SouSuo_Model_Data *MMMMM = model.data[indexPath.row];
    vc.Str_ID = [NSString stringWithFormat:@"%li",MMMMM.idField];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
