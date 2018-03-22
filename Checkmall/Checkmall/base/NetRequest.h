//
//  NetRequest.h
//  ArtToGo_Artist
//
//  Created by  on 2017/6/13.
//
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

/**
 *  请求超时的时间
 **/
#define kTimeOutInterval 30

typedef void (^SuccessBlock)(NSDictionary *dict); // 访问成功block

typedef void (^ErrorBlock)(id error); // 访问失败block

typedef void (^UploadProgress)(int64_t bytesProgress,int64_t totalBytesProgress); // 进度


@interface NetRequest : NSObject



/**
 *  get请求方法
 *
 *  url    url
 *  success 成功返回数据
 *  fail    失败
 *  showAnimate 是否显示HUD
  *  showMsg 是否显示返回提示
 */
+(void )getWithUrl:(NSString *)url
            params:(NSDictionary *)params
           success:(SuccessBlock)success
              fail:(ErrorBlock)fail
       showAnimate:(BOOL)show
           showMsg:(BOOL)showMsg;


/**
 *  post请求方法
 *  url    
 *  success 成功数据
 *  fail    失败
 *  showAnimate 是否显示HUD
 *  showMsg 是否显示返回提示
 */
+(void )postWithUrl:(NSString *)url
             params:(NSDictionary *)params
        showAnimate:(BOOL)showAnimate
            showMsg:(BOOL)showMsg
                 vc:(UIViewController *)viewcontroller
            success:(SuccessBlock)success
               fail:(ErrorBlock)fail;


/**
 *  上传图片方法
 *
 *  image      上传的图片
 *   url        请求连接
 *   filename   图片的名称(如果不传则以当时间命名)
 *   name       上传图片时图片对应的参数
 *   progress   上传进度
 *  success    成功返回
 *   fail      失败
 *   showHUD    是否显示HUD
 */
+ (void)uploadWithImage:(UIImage *)image
                    url:(NSString *)url
               filename:(NSString *)filename
                   name:(NSString *)name
                 params:(NSDictionary *)params
               progress:(UploadProgress)progress
                success:(SuccessBlock)success
                   fail:(ErrorBlock)fail;


/**
 *  取消请求
 **/
+ (void)cancelNetRequest;


@end
