//
//  NetRequest.m
//  ArtToGo_Artist
//
//  Created by  on 2017/6/13.
//
//

#import "NetRequest.h"
#import "dongHua.h"
#import "BaseNavigationController.h"
//#import "HWProgressHUD.h"
#import "SVProgressHUD.h"

@interface NetRequest ()

@property(nonatomic,assign)AFNetworkReachabilityStatus status;

@property (nonatomic,strong)AFHTTPSessionManager *manager ;


@end
@implementation NetRequest

static NetRequest * netequest;


+ (NetRequest *)sharedNetworking{

    static dispatch_once_t onceToken;

    if ( netequest == nil) {

        dispatch_once(&onceToken, ^{

            netequest = [[NetRequest alloc] init];

            //网络监测
            [[AFNetworkReachabilityManager sharedManager]startMonitoring];
            [[NSNotificationCenter defaultCenter]addObserver:netequest selector:@selector(net:) name:AFNetworkingReachabilityDidChangeNotification object:nil];
            AFNetworkReachabilityManager *ReachabilityManager = [AFNetworkReachabilityManager sharedManager];
            netequest.status =[ReachabilityManager networkReachabilityStatus];

            //HTTPS配置
//            netequest.manager = [[AFHTTPSessionManager manager]initWithBaseURL:[NSURL URLWithString:TheServer]];
//            netequest.manager.securityPolicy = [self customSecurityPolicy];

            netequest.manager = [AFHTTPSessionManager manager];
                                 
                                 
            [netequest.manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
            netequest.manager.responseSerializer = [AFJSONResponseSerializer serializer];//设置返回数据为json
            netequest.manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                                @"text/html",
                                                                                                @"text/json",
                                                                                                @"text/plain",
                                                                                                @"text/javascript",
                                                                                                @"text/xml",
                                                                                                @"image/*"]];


            //超时时间
            [netequest.manager.requestSerializer setTimeoutInterval:kTimeOutInterval];

        });
    }
    return netequest;
}

+ (NSString *)AFNetworkStatus{
    netequest = [NetRequest sharedNetworking];
    if (netequest.status==0) {
        return @"网络链接失败";
    }
    return nil;

}

-(void)net:(NSDictionary *)change{

    self.status =(AFNetworkReachabilityStatus)[[change valueForKey:@"userInfo"]valueForKey:AFNetworkingReachabilityNotificationStatusItem];
}




#pragma makr - 开始监听网络连接

#pragma mark --- post

+(void )postWithUrl:(NSString *)url params:(NSDictionary *)params showAnimate:(BOOL)showAnimate showMsg:(BOOL)showMsg vc:(UIViewController *)viewcontroller success:(SuccessBlock)success fail:(ErrorBlock)fail{


    if (url==nil) {
        return;
    }
    if (params==nil) {
        params = @{};
    };
//    dongHua *DH = [dongHua addDongHua];
    if (showAnimate==YES) {
//        [DH xianShi:nil];
        [SVProgressHUD show];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    }

    netequest = [NetRequest sharedNetworking];
    NSLog(@"请求链接 == %@",url);
    [netequest.manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        //返回的数据判断
        if ([[responseObject objectForKey:@"code"] integerValue] == 1) {


        }else if ([[responseObject objectForKey:@"code"] integerValue] == 10000) {
            NSLog(@"重新登录");
            [kUserDefaults setBool:0 forKey:DengLuZhuangTai];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ToLogIn" object:nil];
            
        }else{
            NSLog(@"dictdata === %@",[responseObject objectForKey:@"msg"]);
            if ([responseObject[@"msg"] length]>0) {
                [MyHelper showMessage:responseObject[@"msg"]];
            }
         
        }
        success(responseObject);
//        if (showMsg) {
//            if ([responseObject[@"msg"] length]>0) {
//                [MyHelper showMessage:responseObject[@"msg"]];
//            }
//        }

        if (showAnimate==YES) {
//            [DH yinChang];
            [SVProgressHUD dismiss];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"error=%@",error);
        if (fail) {
            NSLog(@"网络请求失败");
        }
        if (showAnimate==YES) {
//            [DH yinChang];
            [SVProgressHUD dismiss];
            [MyHelper showMessage:@"服务器开小差了~请稍后再试！"];
        }
    }];
}

#pragma mark --- get

+(void )getWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success fail:(ErrorBlock)fail showAnimate:(BOOL)show showMsg:(BOOL)showMsg{



    if (url==nil) {
        return;
    }
    if (params==nil) {
        params = @{};
    };
    dongHua *DH = [dongHua addDongHua];
    if (show==YES) {
        [DH xianShi:nil];
    }

    //检查地址中是否有中文
    NSString *urlStr=[NSURL URLWithString:url]?url:[self strUTF8Encoding:url];

    netequest.manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html",@"text/plain"]];

    [netequest.manager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //返回的数据判断
        if ([[responseObject objectForKey:@"code"] integerValue] == 1) {
            
            
        }else if ([[responseObject objectForKey:@"code"] integerValue] == -99) {
            NSLog(@"重新登录");
            [kUserDefaults setBool:0 forKey:DengLuZhuangTai];
            
        }else{
            NSLog(@"dictdata === %@",[responseObject objectForKey:@"Msg"]);
            if ([responseObject[@"Msg"] length]>0) {
                [MyHelper showMessage:responseObject[@"Msg"]];
            }
            
        }
        success(responseObject);
        if (showMsg) {
            if ([responseObject[@"Msg"] length]>0) {
                [MyHelper showMessage:responseObject[@"Msg"]];
            }
        }
        
        if (show==YES) {
            [DH yinChang];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"error=%@",error);
        if (fail) {
            NSLog(@"网络请求失败");
        }
        if (show==YES) {
            [DH yinChang];
        }
    }];
}

#pragma mark --- 图片上传

+ (void)uploadWithImage:(UIImage *)image url:(NSString *)url filename:(NSString *)filename name:(NSString *)name params:(NSDictionary *)params progress:(UploadProgress)progress success:(SuccessBlock)success
                   fail:(ErrorBlock)fail{

        [SVProgressHUD show];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    if (url==nil) {
        return ;
    }

    //检查地址中是否有中文
    NSString *urlStr=[NSURL URLWithString:url]?url:[self strUTF8Encoding:url];

    //    AFHTTPSessionManager *manager=[self getAFManager];



    [netequest.manager POST:urlStr parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //压缩图片
        NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
        // 上传图片，以文件流的格式
        [formData appendPartWithFormData:imageData name:name];


    } progress:^(NSProgress * _Nonnull uploadProgress) {

        //已经在主线程了 不需要单独处理
        if (progress) {

//            [self performSelectorOnMainThread:@selector(updateProgress:progresee:)
//                                   withObject:uploadProgress
//                                waitUntilDone:NO];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传图片成功=%@",responseObject);
        if (success) {
            success(responseObject);
        }
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error=%@",error);
        if (fail) {
            fail(error);
            NSLog(@"网络请求失败");
        }
        [SVProgressHUD dismiss];
    }];

}


+ (void)updateProgress:(NSProgress *)progress progresee:(UploadProgress)uploadProgress{

    NSLog(@"上传进度--%lld",progress.completedUnitCount);

    uploadProgress(progress.completedUnitCount, progress.totalUnitCount);

}


#pragma mark --- 中文字符串转码

+(NSString *)strUTF8Encoding:(NSString *)str{
    //return [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    return [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

#pragma mark --- 取消请求
+ (void)cancelNetRequest{
    //    AFHTTPSessionManager *manager=[self getAFManager];
    //    [manager  invalidateSessionCancelingTasks:YES];
}


#pragma mark- 配置https
+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];

    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = [[NSSet alloc]initWithObjects:certData, nil];
    
    return securityPolicy;
}

@end
