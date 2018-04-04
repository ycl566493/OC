//
//  HongDingYi.h
//  同文同书
//
//  Created by 杨成龙MAC on 2017/6/25.
//  Copyright © 2017年 XC. All rights reserved.
//  常用宏定义

#ifndef HongDingYi_h
#define HongDingYi_h

#define ScreenHeight    [UIScreen mainScreen].bounds.size.height//视图高
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width//视图宽

#define view_Height self.frame.size.height  //视图高
#define view_Width self.frame.size.width //视图宽

#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 11.0) // 判断是不是ios10
#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 10.0) // 判断是不是ios9
#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 12.0) // 判断是不是ios11

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

#define WeakSelf(weakSelf)  __weak __typeof(&*self) weakSelf  = self;
//弱引用

//返回安全的字符串
#define kSafeString(str) str.length > 0 ? str : @""

//账户信息
#define DengLuZhuangTai @"DengLuZhuangTai"//登录状态
#define MYtoken @"token"//用户token
#define YongHuMing @"YongHuMing"//用户名
#define MiMa @"MiMa"//密码'
#define ShouChi @"ShouChi"//首次

#define TouXiang @"TouXiang"//头像
#define NiCheng @"NiCheng"//昵称
#define YuE @"YuE"//余额

//缓存路径
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define SSLS @"sousuolishi"//搜索历史

//经纬度
#define Klatitude @"latitude"//经度
#define Klongitude @"longitude"//纬度

//购物车坐标点
#define GWC_X @"GWCRECT_X"//购物车x
#define GWC_Y @"GWCRECT_Y"//购物车y
#define GWC_SL @"GWCShuLiang"//购物车数量

#define font1 [UIFont systemFontOfSize:15]
#define font2 [UIFont systemFontOfSize:13]

#define font18  [UIFont systemFontOfSize:18]
#define font12  [UIFont systemFontOfSize:12]
#define font15  [UIFont systemFontOfSize:15]
#define font13  [UIFont systemFontOfSize:13]
#define font14  [UIFont systemFontOfSize:14]
#define font17  [UIFont systemFontOfSize:17]

//状态栏高度
#define STATUS_BAR_HEIGHT 20
//NavBar高度
#define NAVIGATION_BAR_HEIGHT 44
//状态栏 ＋ 导航栏 高度
#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

//输出
#ifdef DEBUG
//#define NSLog(...) NSLog(__VA_ARGS__)
#define CLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif

//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

#define CONTENT_HEIGHT (kScreenHeight - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

//屏幕分辨率
#define SCREEN_RESOLUTION (kScreenWidth * kScreenHeight * ([UIScreen mainScreen].scale))

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)

//色调rgb
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


// 弱引用
#define MJWeakSelf __weak typeof(self) weakSelf = self;

// 日志输出
#ifdef DEBUG
#define MJRefreshLog(...) NSLog(__VA_ARGS__)
#else
#define MJRefreshLog(...)
#endif

//iPhon10适配///////////////////////////////////////////////////////////
// status bar height.
#define  kStatusBarHeight      (IS_iPhoneX ? 44.f : 20.f)

// status bar height.
#define  kStatusLiu     (IS_iPhoneX ? 22.f : 0.f)

// Navigation bar height.
#define  kNavigationBarHeight  44.f

// Tabbar height.
#define  kTabbarHeight        (IS_iPhoneX ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.
#define  kTabbarSafeBottomMargin       (IS_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.
#define  kStatusBarAndNavigationBarHeight  (IS_iPhoneX ? 88.f : 64.f)

//判断是否iPhone X
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
///////////////////////////////////////////////////////////


#endif /* HongDingYi_h */
