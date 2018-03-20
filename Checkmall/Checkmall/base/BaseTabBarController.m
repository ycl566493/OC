//
//  BaseTabBarController.m
//  同文同书
//
//  Created by 信码互通 on 2017/12/12.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "ShouYe_VC.h"//首页
#import "WoDe_VC.h"//个人中心
#import "GouWuChe_VC.h"//消息列表
#import "FenLei_VC.h"//搜索
#import "ZhuanXiang_VC.h"//登录

@interface BaseTabBarController ()<UITabBarControllerDelegate,UINavigationControllerDelegate>{
    UIButton *btn_1;//第1个按钮
    UIButton *btn_2;//第2个按钮
    UIButton *btn_3;//第3个按钮 凸起按钮
    UIButton *btn_4;//第4个按钮
    UIButton *btn_5;//第5个按钮
    UILabel  *lbl_GWSL;//购物数量
}
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;

    
    [self initTabBar];
    
    [self initTabBarItem];

//    self.selectedIndex = 1;
    btn_1.selected = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(yinchangtabbarviewcontroller:) name:@"yinchangtabbarviewcontroller" object:nil];
//    [self removeTabarTopLine];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(GouWuCheShuLiang:) name:@"GouWuCheShuLiang" object:nil];
}

- (void)removeTabarTopLine {
    CGRect rect = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
}

#pragma mark- 购物车数量
- (void)GouWuCheShuLiang:(NSNotification*)tion{
    
//    NSInteger SL = [[kUserDefaults objectForKey:GWC_SL] integerValue];
//    SL += 1;
//    [kUserDefaults setObject:[NSString stringWithFormat:@"%li",SL] forKey:GWC_SL];
//    if (SL == 0) {
//        lbl_GWSL.hidden = YES;
//    }else{
//        lbl_GWSL.hidden = NO;
//    }
//    lbl_GWSL.text = SL < 100 ? [NSString stringWithFormat:@"%li",SL] : @"99+";
//    lbl_GWSL.width = [MyHelper strWidth:lbl_GWSL.text andFont:lbl_GWSL.font andHeight:lbl_GWSL.height] + 10;
//    lbl_GWSL.mj_x = btn_4.width - lbl_GWSL.width;
}
    
#pragma mark 隐藏tabbarviewcontroller
-(void)yinchangtabbarviewcontroller:(NSNotification*)tion{
        if ([tion.object isEqualToString:@"1"]) {
            [self showOrHiddenTabBar:YES];
        }else if ([tion.object isEqualToString:@"3"]){
            [self showOrHiddenTabBar20];
        }
        else{
            [self showOrHiddenTabBar:NO];
            
        }
}

- (void)initTabBar
{
    ShouYe_VC *attentionVC = [[ShouYe_VC alloc]init];
    
    FenLei_VC *nhvc = [[FenLei_VC alloc]init];

    GouWuChe_VC *searchVC = [[GouWuChe_VC alloc]init];
    
    WoDe_VC *personalCenterVC = [[WoDe_VC alloc]init];
    
    NSArray *array1 = @[attentionVC,nhvc,searchVC,personalCenterVC];
    NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:array1.count];
    
    for (BaseViewController *VC in array1) {
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:VC];
        [array2 addObject:nav];
    }
    self.viewControllers = array2;
}

#define btn_width ScreenWidth/5
- (void)initTabBarItem
{
    //tabbar
    self.tabBar.hidden = YES;
    self.tabBar.alpha = 0;
    [self.tabBar removeFromSuperview];
    
    UIImageView *tabBarView = [[UIImageView alloc]initWithFrame:CGRectMake(0, ScreenHeight - 49.5 - kTabbarSafeBottomMargin, ScreenWidth, 49.5 + kTabbarSafeBottomMargin)];
    tabBarView.backgroundColor = [UIColor whiteColor];
    tabBarView.image = [UIImage imageNamed:@"tabbarBJ"];
    tabBarView.userInteractionEnabled = YES;
    tabBarView.contentMode = UIViewContentModeTop;
    tabBarView.tag = 1001;
    [self.view addSubview:tabBarView];
    
    //buttons
    btn_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_1.frame = CGRectMake(0, .5,btn_width, 49);
    [btn_1 addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn_1.tag = 901;
    [tabBarView addSubview:btn_1];
    [btn_1 setImage:[UIImage imageNamed:@"ShouYe2"] forState:UIControlStateNormal];
    [btn_1 setImage:[UIImage imageNamed:@"ShouYe"] forState:UIControlStateSelected];
    [btn_1 setAdjustsImageWhenHighlighted:NO];
    
    btn_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_2.frame = CGRectMake(btn_1.right, btn_1.top,btn_width, btn_1.height);
    [btn_2 addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn_2.tag = 902;
    [btn_2 setImage:[UIImage imageNamed:@"FenLei2"] forState:UIControlStateNormal];
    [btn_2 setImage:[UIImage imageNamed:@"FenLei"] forState:UIControlStateSelected];
    [btn_2 setAdjustsImageWhenHighlighted:NO];
    [tabBarView addSubview:btn_2];
    
    btn_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_3.frame = CGRectMake(btn_2.right, -14, btn_width, 63.5);
    [btn_3 addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn_3.tag = 903;
    [btn_3 setImage:[UIImage imageNamed:@"XinRenZhuanXiang"] forState:UIControlStateNormal];
    [btn_3 setAdjustsImageWhenHighlighted:NO];
    [tabBarView addSubview:btn_3];
    
    btn_4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_4.frame = CGRectMake(btn_3.right , btn_1.top,btn_width, btn_1.height);
    [btn_4 addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn_4.tag = 904;
    [btn_4 setImage:[UIImage imageNamed:@"GouWuChe2"] forState:UIControlStateNormal];
    [btn_4 setImage:[UIImage imageNamed:@"GouWuChe"] forState:UIControlStateSelected];
    [btn_4 setAdjustsImageWhenHighlighted:NO];
    [tabBarView addSubview:btn_4];
    
//    //购物车坐标点
//    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
//    CGRect rect=[btn_4 convertRect: btn_4.bounds toView:window];
//
//    [kUserDefaults setObject:[NSString stringWithFormat:@"%f",rect.origin.x + rect.size.width / 2] forKey:@"GWCRECT_X"];
//    [kUserDefaults setObject:[NSString stringWithFormat:@"%f",rect.origin.y + rect.size.height / 2] forKey:@"GWCRECT_Y"];
//
//    lbl_GWSL = [[UILabel alloc]initWithFrame:CGRectMake(btn_4.width - 40, 0, 50, 15)];
//    lbl_GWSL.font = font12;
//    lbl_GWSL.backgroundColor = [UIColor redColor];
//    lbl_GWSL.textColor = [UIColor whiteColor];
//    lbl_GWSL.layer.masksToBounds = YES;
//    lbl_GWSL.layer.cornerRadius = 15 / 2;
//    lbl_GWSL.textAlignment = 1;
//    NSInteger SL = [[kUserDefaults objectForKey:GWC_SL] integerValue];
//    if (SL == 0) {
//        lbl_GWSL.hidden = YES;
//    }else{
//        lbl_GWSL.hidden = NO;
//    }
//    lbl_GWSL.text = SL < 100 ? [NSString stringWithFormat:@"%li",SL] : @"99+";
//    lbl_GWSL.width = [MyHelper strWidth:lbl_GWSL.text andFont:lbl_GWSL.font andHeight:lbl_GWSL.height] + 10;
//    lbl_GWSL.mj_x = btn_4.width - lbl_GWSL.width ;
//    [btn_4 addSubview:lbl_GWSL];
    
    btn_5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_5.frame = CGRectMake(btn_4.right, btn_1.top, btn_width, btn_1.height);
    [btn_5 addTarget:self action:@selector(selectViewController:) forControlEvents:UIControlEventTouchUpInside];
    btn_5.tag = 905;
    [btn_5 setImage:[UIImage imageNamed:@"WoDe2"] forState:UIControlStateNormal];
    [btn_5 setImage:[UIImage imageNamed:@"WoDe"] forState:UIControlStateSelected];
    [btn_5 setAdjustsImageWhenHighlighted:NO];
    [tabBarView addSubview:btn_5];
    

    
}

- (void)selectViewController:(UIButton *)item{
    // 页面切换
    switch (item.tag) {
        case 901:{
                btn_1.selected = YES;
                btn_2.selected = NO;
                btn_4.selected = NO;
                btn_5.selected = NO;
                self.selectedIndex = 0;
        }
            break;
        case 902:{
            btn_1.selected = NO;
            btn_2.selected = YES;
            btn_4.selected = NO;
            btn_5.selected = NO;
            self.selectedIndex = 1;
        }
            break;
        case 903:{
            NSLog(@"新人专享");
            ZhuanXiang_VC *VC= [[ZhuanXiang_VC alloc]init];
            BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:VC];
            VC.bool_TZ = NO;
            [self presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 904:{
                btn_1.selected = NO;
                btn_2.selected = NO;
                btn_4.selected = YES;
                btn_5.selected = NO;
                self.selectedIndex = 2;
        }
            break;
        case 905:{
//            if ([kUserDefaults boolForKey:DengLuZhuangTai]) {
                btn_1.selected = NO;
                btn_2.selected = NO;
                btn_4.selected = NO;
                btn_5.selected = YES;
                self.selectedIndex = 3;
//            }else{
//                UIViewController *vc = [[UIViewController alloc]init];
////                vc.delegate = self;
//                BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
//                [self presentViewController:nav animated:YES completion:nil];
//            }
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 显示或隐藏tabbar
- (void)showOrHiddenTabBar:(BOOL)visible
{
    UIImageView *tabBarView = [self.view viewWithTag:1001];
//    self.tabBar.hidden = YES;
//    [self.tabBar removeFromSuperview];
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.7];
    if (visible == YES) {
        tabBarView.top = ScreenHeight+63.5- kTabbarSafeBottomMargin;
//        self.view.height = ScreenHeight + 50- kTabbarSafeBottomMargin;

    }else {
        tabBarView.top = ScreenHeight-49.5 - kTabbarSafeBottomMargin;
    }

//    [UIView commitAnimations];
}
//首页特殊使用 高度多20
- (void)showOrHiddenTabBar20
{
    UIImageView *tabBarView = [self.view viewWithTag:1001];
//    self.tabBar.hidden = YES;
//    [self.tabBar removeFromSuperview];
        tabBarView.top = ScreenHeight-49.5 - kTabbarSafeBottomMargin;
}
@end
