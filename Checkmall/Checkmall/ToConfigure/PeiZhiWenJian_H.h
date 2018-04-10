//
//  PeiZhiWenJian_H.h
//  同文同书
//
//  Created by 杨成龙MAC on 2017/6/25.
//  Copyright © 2017年 XC. All rights reserved.
//  配置文件

#ifndef PeiZhiWenJian_H_h
#define PeiZhiWenJian_H_h

//服务器选择
//#define FuWuQi @"" //正式
#define FuWuQi @"http://www.jingchengcaidian.com"  //测试地址：
#define FuWuQi @"http://www.jingchengcaidian.com"  //测试地址：

//http://192.168.48.129/

//https://api.jingchengcaidian.com/api/product/getRecommendProduct
//路径选择
#define LuJing @"/app/"

//最后的请求路径
#define URL_LJ [NSString stringWithFormat:@"%@%@",FuWuQi,LuJing]


//UI颜色控制
#define kUIToneBackgroundColor [UIColor whiteColor] //UI整体背景色调 与文字颜色一一对应
#define kUIToneTextColor UIColorFromHex(0x000000) //UI整体文字色调 与背景颜色对应
#define kStatusBarStyle UIStatusBarStyleLightContent //状态栏样式
#define kViewBackgroundColor UIColorFromHex(0xFFFFFF) //界面View背景颜色

#endif /* PeiZhiWenJian_H_h */
