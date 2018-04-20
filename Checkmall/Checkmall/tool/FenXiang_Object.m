//
//  FenXiang_Object.m
//  同文同书
//
//  Created by 信码互通 on 2017/7/24.
//  Copyright © 2017年 XC. All rights reserved.
//

#import "FenXiang_Object.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@implementation FenXiang_Object


+(void)Shar:(NSString*)str_Title str_NR:(NSString*)str_NR image_URL:(NSString*)image_URL str_LJ:(NSString*)str_LJ{
    //1、创建分享参数
    NSArray* imageArray;
    if (image_URL) {
        imageArray = @[[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_50",image_URL]];
    }else{
        imageArray = @[[UIImage imageNamed:@"icon_180"]];
    }
//    （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:str_NR
                                         images:imageArray
                                            url:[NSURL URLWithString:str_LJ]
                                          title:str_Title
                                           type:SSDKContentTypeAuto];
        //有的平台要客户端分享需要加此方法，例如微博
        [shareParams SSDKEnableUseClientShare];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:@[@(SSDKPlatformSubTypeQQFriend),
                                         @(SSDKPlatformSubTypeQZone),
                                         @(SSDKPlatformSubTypeWechatSession),
                                         @(SSDKPlatformSubTypeWechatTimeline)
//                                         @(SSDKPlatformTypeSinaWeibo),
//                                         @(SSDKPlatformTypeCopy)
                                         ]
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {

                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
//                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
//                                                                                   message:nil
//                                                                                  delegate:nil
//                                                                         cancelButtonTitle:@"确定"
//                                                                         otherButtonTitles:nil];
//                               [alertView show];
                               [MyHelper showMessage:@"分享成功"];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
//                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
//                                                                               message:[NSString stringWithFormat:@"%@",error]
//                                                                              delegate:nil
//                                                                     cancelButtonTitle:@"OK"
//                                                                     otherButtonTitles:nil, nil];
//                               [alert show];
                               [MyHelper showMessage:@"分享失败"];

                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}

@end
