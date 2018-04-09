//
//  YinDaoYe_VC.m
//  Created by 杨成龙MAC on 2017/7/22.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "YinDaoYe_VC.h"
#import "BaseNavigationController.h"
#import "BaseTabBarController.h"

@interface YinDaoYe_VC ()<UIScrollViewDelegate>{
    UIScrollView    *scrV;//滑动背景
    UIPageControl   *page;
}

@end

@implementation YinDaoYe_VC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self init_UI];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.frame = [UIScreen mainScreen].bounds;

}

-(void)init_UI{
    
    
    NSArray *arr_data = @[@"QDT1",@"QDT2",@"QDT3",@"QDT4"];
    
    scrV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    scrV.contentSize = CGSizeMake(ScreenWidth * arr_data.count, 0);
    // 是否反弹
    scrV.bounces = NO;
    // 是否分页
    scrV.pagingEnabled = YES;
    scrV.delegate = self;
    scrV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrV];
    
    for (NSInteger i = 0; i < arr_data.count; i ++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenWidth * i, 0, scrV.width, scrV.height)];
        imageV.image = [UIImage imageNamed:arr_data[i]];
        imageV.userInteractionEnabled = YES;
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.clipsToBounds = YES;
        [scrV addSubview:imageV];
        
        if (i == arr_data.count - 1) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - 181) / 2, ScreenHeight - 101, 181, 41)];
            [btn setTitle:@"立即体验" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.layer.borderWidth = .5;
            btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 5;
            
//            [btn setImage:[UIImage imageNamed:@"引导页按钮"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btn_Action) forControlEvents:UIControlEventTouchUpInside];
            [imageV addSubview:btn];
        }
        
    }
    
    page = [[UIPageControl alloc] init];
    page.frame = CGRectMake((ScreenWidth - 100) / 2, ScreenHeight - 60, 100, 20);//指定位置大小
    page.numberOfPages = arr_data.count;//指定页面个数
    page.currentPage = 0;//指定pagecontroll的值，默认选中的小白点（第一个）
    //添加委托方法，当点击小白点就执行此方法
    
    page.pageIndicatorTintColor = [UIColor lightGrayColor];// 设置非选中页的圆点颜色
    
    page.currentPageIndicatorTintColor = [UIColor whiteColor]; // 设置选中页的圆点颜色
    [self.view addSubview:page];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int iii = scrollView.contentOffset.x / scrollView.frame.size.width;
    //    NSLog(@"%d", page);
    
    // 设置页码
    page.currentPage = iii;//指定pagecontroll的值，默认选中的小白点（第一个）
//    /page.currentPage = page;
}


+(BOOL)if_YD{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app build版本
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *str_BBh = [kUserDefaults objectForKey:@"banbenhao"];
    if ([app_build isEqualToString:str_BBh]) {
        return NO;
    }else{
        [kUserDefaults setObject:app_build forKey:@"banbenhao"];
        return YES;
    }
}

- (void)btn_Action{
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = [BaseTabBarController new];

}

@end
