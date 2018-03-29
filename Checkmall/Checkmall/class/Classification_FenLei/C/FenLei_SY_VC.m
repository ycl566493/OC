//
//  FenLei_SY_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/28.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "FenLei_SY_VC.h"
#import "SlideButtonView.h"
#import "ShangPinXiangQing_VC.h"
#import "ShouYe_Cell.h"
#import "CollectionReusableView_H.h"
#import "FenLeiShangPin_Model_RootClass.h"//Model

@interface FenLei_SY_VC ()<SlideButtonViewDelegate,ShouYe_Cell_Delegate_GWC>{
   
    
    FenLeiShangPin_Model_RootClass  *model_FLSP;
    NSString            *str_ID;//分类id
}
@property (nonatomic,strong) NSArray             *arr_ID;
@property (nonatomic,strong) SlideButtonView     *slide;


@end

@implementation FenLei_SY_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"分类";
    self.pageIndex =  1;

    [self init_UI];
    
    [self setLeftItemWithIcon:[UIImage imageNamed:@"FanHui"] title:@"" selector:@selector(backAction)];

}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSArray *)arr_ID{
    if (!_arr_ID) {
        _arr_ID = @[@"7",@"5",@"4",@"8",@"9",@"1",@"2",@"10",@"6",@"3"];
    }
    return _arr_ID;
}

-(SlideButtonView *)slide{
    if (!_slide) {
        _slide = [[SlideButtonView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        _slide.arr_Title = @[@"蔬菜",@"水果",@"水产",@"肉蛋",@"粮油",@"乳品",@"酒饮",@"零食",@"熟食",@"速食"];
        _slide.Font_Size = 14;
        _slide.No_Color = UIColorFromHex(0x333333);
        _slide.Yes_Color = UIColorFromHex(0x5db851);
        _slide.No_backgroundColor = UIColorFromHex(0xffffff);
        _slide.Yes_backgroundColor = UIColorFromHex(0xffffff);
        _slide.bool_SlideBar = YES;
        _slide.SlideBar_Color = UIColorFromHex(0x5db851);
        _slide.delegate = self;
        _slide.tag = -1;
        [self.view addSubview:_slide];
    }
    return _slide;
}

- (void)refresh{
    //下拉请求
    [self endRefreshing];
    self.pageIndex = 1;
    [self init_data_SP:YES];

}
- (void)loadMore{
    //加载更多
    [self endRefreshing];
    self.pageIndex ++;
    [self init_data_SP:NO];

}

-(void)init_UI{
    
    
  
    //注册重用View
    [self.collectionView registerClass:[ShouYe_Cell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.collectionView.top = self.slide.bottom;
    self.collectionView.height = ScreenHeight - self.slide.height  - kTabbarSafeBottomMargin ;
    self.collectionView.backgroundColor = UIColorFromHex(0xf2f2f2);
    if (!iOS11) {
        self.collectionView.height = ScreenHeight ;
    }
}

-(void)setSelect_Row:(NSInteger)select_Row{
    _select_Row = select_Row;
    self.slide.init_Selected = select_Row;
}

#pragma mark- 添加商品到购物车
- (void)add_SP:(NSInteger)tag{
    
    FenLeiShangPin_Model_Data *MMMM = model_FLSP.data[tag];
    
    NSDictionary *dic = @{@"token":[MyHelper toToken],@"goods_id":[NSString stringWithFormat:@"%li",MMMM.idField],@"num":@"1"};
    
    [NetRequest postWithUrl:goodscar_addGoodsToCar params:dic showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {

        NSLog(@"添加购物车 = = =%@",dict);
        if ([dict[@"code"] integerValue] == 1) {
            [MyHelper showMessage:@"添加购物车成功！"];
            [MyHelper UP_GWCSL];
        }
    } fail:^(id error) {
        
        
    }];
}

-(void)init_data_SP:(BOOL)Y_N{
    
    [NetRequest postWithUrl:Category_getCategoryName params:@{@"page":[NSString stringWithFormat:@"%li",self.pageIndex],@"pid":str_ID} showAnimate:YES showMsg:YES vc:self success:^(NSDictionary *dict) {

        NSLog(@"分类商品 == %@",dict);
        if (Y_N) {
            self.collectionView.contentOffset = CGPointMake(0, 0);
            model_FLSP = [[FenLeiShangPin_Model_RootClass alloc]initWithDictionary:dict];
        }else{
            [model_FLSP Add_Dictionary:dict];
        }
        if (model_FLSP.code == 1) {
            [self.collectionView reloadData];
        }
        
    } fail:^(id error) {
        
    }];
}

#pragma mark- 选择条代理
-(void)SlideButtonViewDelegate_Acion:(NSInteger)btn_Tag{
    if (self.slide.tag != btn_Tag) {
        self.slide.tag = btn_Tag;
    }
    self.pageIndex =  1;
    str_ID = self.arr_ID[btn_Tag];
    [self init_data_SP:YES];
}

#pragma mark- 购物车
-(void)ShouYe_Cell_Delegate_GWC:(NSInteger)tag{
    [self add_SP:tag];
}

#pragma mark- collectionviewcollection代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return model_FLSP.data.count;
}

//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"cell";
    ShouYe_Cell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    FenLeiShangPin_Model_Data *MMMM = model_FLSP.data[indexPath.row];
    cell.model_FL = MMMM;
    
    cell.tag = indexPath.row;
    cell.delegate =self;
    
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
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
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
    
        return header;
    }
    //如果底部视图
    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        return footer;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ShangPinXiangQing_VC    *vc = [[ShangPinXiangQing_VC alloc]init];
    
    FenLeiShangPin_Model_Data *MMMM = model_FLSP.data[indexPath.row];
    vc.Str_ID = [NSString stringWithFormat:@"%li",MMMM.idField];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self FGX:NO];
}

@end
