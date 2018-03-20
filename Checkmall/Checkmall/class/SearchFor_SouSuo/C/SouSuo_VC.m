//
//  SouSuo_VC.m
//  Checkmall
//
//  Created by 杨成龙MAC on 2018/3/20.
//  Copyright © 2018年 CKJY. All rights reserved.
//

#import "SouSuo_VC.h"
#import "SS_Top_V.h"//搜索头部
#import "SS_SJ_V.h"//搜索数据
#import "SouSuoJieGuo_VC.h"//结果

@interface SouSuo_VC ()<SS_Top_V_Delegate,SS_SJ_V_Delegate>{
    UIButton    *btn_QKSSJL;//清空搜索记录
}


@property (nonatomic,weak)SS_Top_V  *SSTB;//搜索头部

@property (nonatomic,weak)SS_SJ_V  *RMTJ;//热门推荐
@property (nonatomic,weak)SS_SJ_V  *LSJL;//历史记录

@end

@implementation SouSuo_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setLeftItemWithIcon:nil title:nil selector:nil];
    [self init_UI];

}

#pragma mark- 初始化
- (void)init_UI{
    [self.scrollV addSubview:self.RMTJ];
    [self.scrollV addSubview:self.LSJL];
    
    btn_QKSSJL = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - 125) / 2, 0, 125, 30)];
    btn_QKSSJL.layer.masksToBounds = YES;
    btn_QKSSJL.layer.cornerRadius = 5;
    btn_QKSSJL.layer.borderColor = UIColorFromHex(0xff7800).CGColor;
    btn_QKSSJL.layer.borderWidth = .5;
    [btn_QKSSJL setTitleColor:UIColorFromHex(0xff7800) forState:UIControlStateNormal];
    [btn_QKSSJL setTitle:@"清空历史记录" forState:UIControlStateNormal];
    btn_QKSSJL.titleLabel.font = font13;
    [btn_QKSSJL addTarget:self action:@selector(btn_QKSSJL_Action) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollV addSubview:btn_QKSSJL];
    
    [self UP_UI];
}


#pragma mark- 清空历史记录
- (void)btn_QKSSJL_Action{
    [MyHelper CunShuJu:@{@"data":@[]} URL_LuJing:@"SPSS"];
    [self UP_UI];
}

#pragma mark- 按钮点击事件
-(void)SS_SJ_V_Delegate_Action:(NSInteger)tag VC:(UIView *)vc Name:(NSString *)str{
    if (vc == self.RMTJ) {
        NSLog(@"热门 ==  %li  = = = %@",tag,str);
    }else{
        NSLog(@"搜索 ==  %li  = = = %@",tag,str);

    }
    SouSuoJieGuo_VC *vvv =[[SouSuoJieGuo_VC alloc]init];
    [self.navigationController pushViewController:vvv animated:YES];
}

#pragma mark- 搜索按钮
-(void)SS_Top_V_Delegate_SS:(NSString *)str{
    NSLog(@"搜索");
    SouSuoJieGuo_VC *vc =[[SouSuoJieGuo_VC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    NSDictionary *dic;
    if ([MyHelper QuShuJu:@"SPSS"]) {
        dic = [MyHelper QuShuJu:@"SPSS"];
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:dic[@"data"]];
        
        BOOL  bool_CZ = NO;//是否存在
        for (NSString *ssss in arr) {
            if ([ssss isEqualToString:str]) {
                bool_CZ = YES;
            }
        }
        
        if (!bool_CZ) {
            if (arr.count == 10) {
  
                [arr removeObjectAtIndex:9];
                [arr insertObject:str atIndex:0];
            }else{
                [arr insertObject:str atIndex:0];
            }
            dic = @{@"data":arr};
            [MyHelper CunShuJu:dic URL_LuJing:@"SPSS"];
            [self UP_UI];

        }
        
       
    }else{
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        [arr addObject:str];
        dic = @{@"data":arr};
        [MyHelper CunShuJu:dic URL_LuJing:@"SPSS"];
        [self UP_UI];
    }

    NSLog(@"存= = = =%@",[MyHelper QuShuJu:@"SPSS"]);
}

#pragma mark- 刷新页面
- (void)UP_UI{
    
    NSArray*arr = @[@"鸡蛋鸡蛋鸡蛋",@"鸡蛋鸡蛋",@"鸡蛋",@"鸡蛋",@"鸡积极",@"鸡",@"鸡蛋鸡蛋鸡蛋",@"鸡蛋",@"鸡蛋鸡蛋",@"鸡蛋蛋",@"鸡蛋",@"鸡蛋",@"鸡蛋鸡蛋鸡蛋鸡蛋鸡蛋鸡蛋",@"鸡蛋蛋",@"鸡蛋鸡蛋鸡蛋",@"鸡蛋",@"鸡蛋鸡蛋",@"鸡蛋蛋"];
    self.RMTJ.arr_Data = arr;
    
    NSDictionary *dic;
    NSArray *arr_data;
    if ([MyHelper QuShuJu:@"SPSS"]) {
        dic = [MyHelper QuShuJu:@"SPSS"];
        arr_data = dic[@"data"];
    }else{
        arr_data = [[NSArray alloc]init];
    }
    if (arr_data.count == 0) {
        self.LSJL.hidden = YES;
    }else{
        self.LSJL.hidden = NO;
    }
    self.LSJL.arr_Data = arr_data;
    
    self.LSJL.top = self.RMTJ.bottom;
    btn_QKSSJL.top = self.LSJL.bottom+ 30;
    self.scrollV.contentSize = CGSizeMake(0, btn_QKSSJL.bottom + 30);
}

#pragma mark- 搜索内容更新视图
-(void)SS_SJ_V_Delegate_UP{
    
    self.LSJL.top = self.RMTJ.bottom;
    btn_QKSSJL.top = self.LSJL.bottom+ 30;
    self.scrollV.contentSize = CGSizeMake(0, btn_QKSSJL.bottom + 30);
}

#pragma mark- 搜索头部
-(SS_Top_V *)SSTB{
    if (!_SSTB) {
        SS_Top_V *SSTB = [SS_Top_V init_Xib];
        _SSTB = SSTB;
        _SSTB.delegate = self;
        _SSTB.frame = CGRectMake(0, 0, ScreenWidth , 44);
        [self.navigationController.navigationBar addSubview:_SSTB];
    }
    return _SSTB;
}
#pragma mark- 热门推荐
-(SS_SJ_V *)RMTJ{
    if (!_RMTJ) {
        SS_SJ_V *RMTJ = [SS_SJ_V init_Xib];
        _RMTJ = RMTJ;
        _RMTJ.delegate = self;
        _RMTJ.frame = CGRectMake(0, 0, ScreenWidth , 100);
    }
    return _RMTJ;
}
#pragma mark- 历史记录
-(SS_SJ_V *)LSJL{
    if (!_LSJL) {
        SS_SJ_V *LSJL = [SS_SJ_V init_Xib];
        _LSJL = LSJL;
        _LSJL.delegate = self;
        _LSJL.lbl_Title.text = @"最近搜索";
        _LSJL.frame = CGRectMake(0, 0, ScreenWidth , 44);
    }
    return _LSJL;
}

#pragma mark- 取消按钮
-(void)SS_Top_V_Delegate_QX{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.SSTB.hidden = NO;
}

-(void)dealloc{
    for (UIView *view in self.SSTB.subviews) {
        [view removeFromSuperview];
    }
    [self.SSTB removeFromSuperview];
}

//将要消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.SSTB.hidden = YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    self.SSTB.hidden = YES;

}

@end
