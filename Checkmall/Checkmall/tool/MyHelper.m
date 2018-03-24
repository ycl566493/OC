//
//  MyHelper.m
//  NewKnowledge
//
//  Created by  on 15/6/25.
//  Copyright (c) 2015年 vct. All rights reserved.
//

#import "MyHelper.h"
#import <MapKit/MapKit.h>//导航高德

#define ShaHe_URL [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";


@implementation MyHelper

+(NSURL *)imaeg_URL:(NSString*)image_url view:(UIView *)view{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@?x-oss-process=image/resize,w_%.0f",image_url,view.width * 2]];
}

#pragma mark- 把秒速转换为
+(NSString *)time_SFM:(NSString *)str{
    NSInteger sj = [str integerValue];
    NSInteger SSS = sj / 60 /60;
    NSInteger FFF = sj % (60 * 60) / 60;
    NSInteger MMM = sj % 60;
    if (SSS == 0) {
        if (FFF == 0) {
            return [NSString stringWithFormat:@"%li",MMM];
        }
        return [NSString stringWithFormat:@"%li:%li",FFF,MMM];
    }
    return [NSString stringWithFormat:@"%li:%li:%li",SSS,FFF,MMM];
}

#pragma mark- 图片变灰
+(UIImage *)Image_Hui:(UIImage *)sourceImage
{
    int bitmapInfo = kCGImageAlphaNone;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

+ (void)addToShoppingCartWithGoodsImage:(UIImage *)goodsImage startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint completion:(void (^)(BOOL))completion{
    
    //------- 创建shapeLayer -------//
    CAShapeLayer *animationLayer = [[CAShapeLayer alloc] init];
    animationLayer.frame = CGRectMake(startPoint.x - 20, startPoint.y - 20, 40, 40);
    animationLayer.contents = (id)goodsImage.CGImage;
    
    // 获取window的最顶层视图控制器
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    UIViewController *parentVC = rootVC;
    while ((parentVC = rootVC.presentedViewController) != nil ) {
        rootVC = parentVC;
    }
    while ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC topViewController];
    }
    
    // 添加layer到顶层视图控制器上
    [rootVC.view.layer addSublayer:animationLayer];
    
    
    //------- 创建移动轨迹 -------//
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:startPoint];
    [movePath addQuadCurveToPoint:endPoint controlPoint:CGPointMake(200,100)];
    // 轨迹动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGFloat durationTime = 1; // 动画时间1秒
    pathAnimation.duration = durationTime;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.path = movePath.CGPath;
    
    
    //------- 创建缩小动画 -------//
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.duration = 1.0;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    
    // 添加轨迹动画
    [animationLayer addAnimation:pathAnimation forKey:nil];
    // 添加缩小动画
    [animationLayer addAnimation:scaleAnimation forKey:nil];
    
    
    //------- 动画结束后执行 -------//
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(durationTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [animationLayer removeFromSuperlayer];
        completion(YES);
    });
}

+(NSString*)str_Null:(NSString*)str{
    if ([str isKindOfClass:[NSNull class]] || !str) {
        return @"";
    }
    return str;
}

+(void)go_GaoDe:(NSString*)lat lot:(NSString*)lot name:(NSString*)name{
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake([lat floatValue], [lot floatValue]);
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:loc addressDictionary:nil]];
    toLocation.name = name;
    [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                   launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
                                   MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
}

#pragma mark- 获取版本号
+ (float)Get_BanBenHao{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

#pragma mark- //判断是否开启定位
+(BOOL)if_DingWei{
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
            //定位功能可用，开始定位
            return YES;
        }else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        NSLog(@"定位功能不可用，提示用户或忽略");
        return NO;
     }else{
        return YES;
    }
}

#pragma mark- 修改UILabel行间距
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font Spacing:(CGFloat)spacing{
    if (kStringIsEmpty(str)) {
        str = @"";
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
//    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = spacing; //设置行间距
//    paraStyle.hyphenationFactor = 1.0;
//    paraStyle.firstLineHeadIndent = 0.0;
//    paraStyle.paragraphSpacingBefore = 0.0;
//    paraStyle.headIndent = 0;
//    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
    label.lineBreakMode = NSLineBreakByTruncatingTail;

}

#pragma mark- 修改UILabel行间距
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font Spacing:(CGFloat)spacing alignment:(NSTextAlignment)alignment{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
        paraStyle.alignment = alignment;
    paraStyle.lineSpacing = spacing; //设置行间距
    //    paraStyle.hyphenationFactor = 1.0;
    //    paraStyle.firstLineHeadIndent = 0.0;
    //    paraStyle.paragraphSpacingBefore = 0.0;
    //    paraStyle.headIndent = 0;
    //    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
    label.lineBreakMode = NSLineBreakByTruncatingTail;

}

#pragma mark- //计算UILabel的高度(带有行间距的情况)
+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width  Spacing:(CGFloat)spacing{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
//    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = spacing;
//    paraStyle.hyphenationFactor = 1.0;
//    paraStyle.firstLineHeadIndent = 0.0;
//    paraStyle.paragraphSpacingBefore = 0.0;
//    paraStyle.headIndent = 0;
//    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, ScreenHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}


#pragma mark- 获取token 
+(NSString *)toToken{
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"token"]) {
        return [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
    }else{
        return @"";
    }
}

#pragma mark-  //身份证号验证标准
+ (BOOL)shenfenzheng:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

#pragma mark- //判断是否是手机号码
+(BOOL) isPhone:(NSString *)string{
    NSString *Regex = @"\\b(1)[345678][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\\b";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [phoneTest evaluateWithObject:string];
}

#pragma mark - 高斯模糊 image图片 blur模糊度
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur
{
//    ___start_log___
    
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"
                                  keysAndValues:kCIInputImageKey, inputImage,
                        @"inputRadius", @(blur), nil];
    CIImage *outputImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef outImage = [context createCGImage:outputImage fromRect:[inputImage extent]];
    return [UIImage imageWithCGImage:outImage];
}


#pragma mark 2.浮点形判断：
+ (BOOL)isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark //获取当前时间
+(NSString*)getCurrentTime{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.0f", a];//转为字符型
    NSLog(@"当前时间戳 == = = =%@",timeString);
    return timeString;
}

#pragma mark //颜色转成图片
+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark 转化url
+ (NSString *)Url_String:(NSString *)str{
    NSString *url = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return url;
}

#pragma mark  点赞放大动画
+ (void)DongHua_Image:(UIImageView*)image_View{
    //1.创建核心动画
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //平移
    keyAnima.keyPath=@"bounds";
    //1.1告诉系统要执行什么动画
    NSValue *value1 = [NSValue valueWithCGRect:CGRectMake(image_View.mj_x - image_View.width*.5/2, image_View.mj_y - image_View.height*.5/2,image_View.width*1.5, image_View.height*1.5)];
    NSValue *value2 = [NSValue valueWithCGRect:image_View.frame];
    keyAnima.values=@[value1,value2];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=YES;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=1.0;
    //1.5设置动画的节奏
    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //设置代理，开始—结束
    keyAnima.delegate=self;
    //2.添加核心动画
    [image_View.layer addAnimation:keyAnima forKey:nil];
}

#pragma mark 图片裁图 机构使用
+ (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize
{
    //    －－缩放比例
    CGAffineTransform scaleTransform;
    CGPoint origin;
    //    图片大小大于图片高度的情况
    if (image.size.width > image.size.height)
    {
        //image原始高度为200，缩放image的高度为400pixels，所以缩放比率为2
        
        //        计算缩放比例
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
        //        计算画笔的X轴
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else
    {
        //        图片的高度大于宽度的情况
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //        计算画笔的Y轴
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else
    {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将image原始图片(400x200)pixels缩放为(800x400)pixels
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [image drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    //    结束画板绘制
    UIGraphicsEndImageContext();
    
    return image;
}


#pragma mark 删除缓存
+ (void)ShanShuJu:(NSString*)str_URL{
//    [filemanager removeItemAtPath:[路径 stringByAppendingString:@“删除的目录”] error:nil];
//    判断文件是否存在（返回值bool）
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[ShaHe_URL stringByAppendingString:[NSString stringWithFormat:@""@"/%@.plist",str_URL]] ]) {
        NSLog(@"该文件已经存在！");
        [fileManager removeItemAtPath:[ShaHe_URL stringByAppendingString:[NSString stringWithFormat:@""@"/%@.plist",str_URL]] error:nil];
    }
    else{
        NSLog(@"该文件不存在");
    }
}

#pragma mark //存缓存
+ (void)CunShuJu:(NSDictionary *)dic_data URL_LuJing:(NSString*)str_URL{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    //判断是否存在文件否则创建
    if ([fileManager fileExistsAtPath:[ShaHe_URL stringByAppendingString:[NSString stringWithFormat:@""@"/%@.plist",str_URL]] ]) {
        NSLog(@"该文件已经存在！");
    }
    else{
        NSLog(@"该文件不存在");
        [fileManager createFileAtPath:[ShaHe_URL stringByAppendingString:[NSString stringWithFormat:@""@"/%@.plist",str_URL]] contents:nil attributes:nil];
    }
    //要写入的数据
    [dic_data writeToFile:[ShaHe_URL stringByAppendingString:[NSString stringWithFormat:@""@"/%@.plist",str_URL]] atomically:YES];
}

//取缓存
+ (NSDictionary*)QuShuJu:(NSString*)str_URL{
    
    NSMutableDictionary *dict =  [NSMutableDictionary dictionaryWithContentsOfFile:[ShaHe_URL stringByAppendingString:[NSString stringWithFormat:@""@"/%@.plist",str_URL]]];
    
    return dict;
}

+ (CGFloat)strHeight:(NSString *)str andFont:(UIFont * )font andWidth:(CGFloat )width{
    //屏幕宽
    //    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    //字体大小
    //    UIFont *font = [UIFont systemFontOfSize:kDetailedFont];
    //自适应后的uilabel大小
    CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
//    NSDictionary *attribute = @{NSFontAttributeName: font};
    //ios9自适应文字高度
//    CGSize size = [str boundingRectWithSize:CGSizeMake(width, 500) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    return  size.height;
}

+ (CGFloat)strWidth:(NSString *)str andFont:(UIFont * )font andHeight:(CGFloat )height{
    CGSize titleSize = [str sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, height)];
    return titleSize.width;
}

#pragma mark 提示语
+(void)showMessage:(NSString *)message
{
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1;
    showview.layer.cornerRadius = 4.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message sizeWithFont:font1 constrainedToSize:CGSizeMake(290, 9000)];
    //    CGSize LabelSize = [message sizeWithAttributes:@{NSForegroundColorAttributeName:[UIFont systemFontOfSize:18.0f]}];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = font1;
    label.numberOfLines = 0;
    [showview addSubview:label];
    showview.frame = CGRectMake((ScreenWidth - LabelSize.width - 20)/2, (ScreenHeight/2) + ( LabelSize.height+20)/2 , LabelSize.width+20, LabelSize.height+10);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.5 animations:^{
            showview.alpha = 0;
        } completion:^(BOOL finished) {
            [showview removeFromSuperview];
        }];
    });
    
}


#pragma mark 提示语
+(void)showTopMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 0.8f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message sizeWithFont:font1 constrainedToSize:CGSizeMake(180, 9000)];
//    CGSize LabelSize = [message sizeWithAttributes:@{NSForegroundColorAttributeName:[UIFont systemFontOfSize:18.0f]}];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = font2;
    label.numberOfLines = 0;
    [showview addSubview:label];
    showview.frame = CGRectMake((ScreenWidth - LabelSize.width - 20)/2, (ScreenHeight/2)-50 , LabelSize.width+20, LabelSize.height+10);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1.0 animations:^{
            showview.alpha = 0;
        } completion:^(BOOL finished) {
            [showview removeFromSuperview];
        }];
    });

}


#pragma mark  是否有汉字,汉字个数,字母个数
//判断是否有汉字
+(BOOL)isChinesecharacter:(NSString *)string{
    if (string.length == 0) {
        return NO;    }
    unichar c = [string characterAtIndex:0];
    if (c >=0x4E00 && c <=0x9FA5)     {
        return YES;//汉字
    }     else     {
        return NO;//英文
    }
}
//计算汉字的个数
+(NSInteger)chineseCountOfString:(NSString *)string{
    int ChineseCount = 0;
    if (string.length == 0) {
        return 0;
    }
    for (int i = 0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5)        {
            ChineseCount++ ;//汉字
        }
    }
    return ChineseCount;
}
//计算字母的个数
+(NSInteger)characterCountOfString:(NSString *)string{
    int characterCount = 0;
    if (string.length == 0) {
        return 0;
    }
    for (int i = 0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5)        {
        }        else        {
            characterCount++;//英文
        }
    }
    return characterCount;
}
//一个汉字长度为1,两个字母长度为1
+(NSUInteger)unicodeLengthOfString:(NSString *)text{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    NSUInteger unicodeLength = asciiLength / 2;
    if(asciiLength % 2) {
        unicodeLength++;
    }
    
    return unicodeLength;
}

#pragma mark 时间戳转时间
+(NSString *)dateChangeToTime:(NSString *)string{
    if (string.length < 9) {
        return string;
    }else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *theday = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
        NSString *day = [dateFormatter stringFromDate:theday];
        return day;
    }
}

#pragma mark 时间戳转时间
+(NSString *)dateChangeToTimeRemind:(NSString *)string{
    if (string.length < 9) {
        return string;
    }else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日H时"];
        NSDate *theday = [NSDate dateWithTimeIntervalSince1970:[string doubleValue]];
        NSString *day = [dateFormatter stringFromDate:theday];
        return day;
    }
}

+ (NSString *)timeChangeToTimeStamp:(NSString *)string{

//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH"];
//    NSDate *date = [dateFormatter dateFromString:string];
//    NSLog(@"%@", date);
//    return date;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd-H"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:string]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    return timeSp;

}
#pragma mark  时间转多少天前等等
+ (NSString *)getUTCFormateDate:(NSString *)newsDate
{
//    newsDate = @"2013-08-09 17:01";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSLog(@"newsDate = %@",newsDate);
    
    NSDate *newsDateFormatted = [dateFormatter dateFromString:newsDate];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    
    NSDate* current_date = [[NSDate alloc] init];
    NSTimeInterval time=[current_date timeIntervalSinceDate:newsDateFormatted];//间隔的秒数
    int month    = ((int)time)/(3600*24*30);
    int days     = ((int)time)/(3600*24);
    int hours    = ((int)time)%(3600*24)/3600;
    int minute   = ((int)time)%(3600*24)/60;

//    NSLog(@"time=%f",(double)time);
    
    NSString *dateContent;
    if(month!=0){
        dateContent = [NSString stringWithFormat:@"%i%@",month,@"个月前"];
    }else if(days!=0){
        dateContent = [NSString stringWithFormat:@"%i%@",days,@"天前"];
    }else if(hours!=0){
        dateContent = [NSString stringWithFormat:@"%i%@",hours,@"小时前"];
    }else if(minute > 1){
        dateContent = [NSString stringWithFormat:@"%i%@",minute,@"分钟前"];
    }else{
        dateContent = [NSString stringWithFormat:@"刚刚"];
    }

    return dateContent;
}


+ (NSString*)stringToBase64:(NSString*)string;
{
    return  [Base64codeFunc base64StringFromText:string];
}

+ (NSString *)md5:(NSString *)str{
    const char *original_str = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str,(CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    
    return [hash lowercaseString];//小写
    //    return [hash uppercaseString];//全部是大写
}

+(NSString*)toJson:(NSDictionary*)dict
{
    SBJSON *sb=[[SBJSON alloc]init];
    NSString *jsonStr=[sb stringWithObject:dict];
    return  jsonStr;
}

+ (NSString *)base64EncodedStringFrom:(NSData *)data
{
    if ([data length] == 0)
        return @"";
    char *characters = malloc((([data length] + 2) / 3) * 4);
    if (characters == NULL)
        return nil;
    NSUInteger length = 0;
    NSUInteger i = 0;
    while (i < [data length])
    {
        char buffer[3] = {0,0,0};
        short bufferLength = 0;
        while (bufferLength < 3 && i < [data length])
            buffer[bufferLength++] = ((char *)[data bytes])[i++];
        //  Encode the bytes in the buffer to four characters, including padding "=" characters if necessary.
        characters[length++] = encodingTable[(buffer[0] & 0xFC) >> 2];
        characters[length++] = encodingTable[((buffer[0] & 0x03) << 4) | ((buffer[1] & 0xF0) >> 4)];
        if (bufferLength > 1)
            characters[length++] = encodingTable[((buffer[1] & 0x0F) << 2) | ((buffer[2] & 0xC0) >> 6)];
        else characters[length++] = '=';
        if (bufferLength > 2)
            characters[length++] = encodingTable[buffer[2] & 0x3F];
        else characters[length++] = '=';
    }
    return [[NSString alloc] initWithBytesNoCopy:characters length:length encoding:NSASCIIStringEncoding freeWhenDone:YES];
}

#pragma mark 判断字符串为空.只为空格
+(BOOL)isBlankString:(NSString *)string{
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
//    if ([string isEqualToString:@"<null>"]) {
//        return YES;
//    }
//    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
//        return YES;
//    }
    return NO;
}

+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size
{
        /*如若centerBool为Yes则是由中心点取mCGRect范围的图片*/
        float imgwidth = originalImage.size.width;
        float imgheight = originalImage.size.height;
        float viewwidth = size.width;
        float viewheight = size.height;
        CGRect rect;
        //判断是否是特别扁的图
        if (imgheight > viewheight) {
            rect = CGRectMake((imgwidth-viewwidth)/2, (imgheight-viewheight)/2, viewwidth, viewheight);
        }else{
            CGFloat bili = viewwidth / viewheight;
            CGFloat  xiugaiWidth = imgheight*bili;
            rect = CGRectMake((imgwidth-xiugaiWidth)/2, 0, xiugaiWidth, imgheight);
        }
        CGImageRef subImageRef = CGImageCreateWithImageInRect(originalImage.CGImage, rect);
        CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
        
        UIGraphicsBeginImageContext(smallBounds.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextDrawImage(context, smallBounds, subImageRef);
        UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
        UIGraphicsEndImageContext();

    //    需要手动释放 否则内存泄漏
        CGImageRelease(subImageRef);
        UIGraphicsEndImageContext();

        return smallImage;
}


@end
