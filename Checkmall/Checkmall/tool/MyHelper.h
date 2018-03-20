//
//  MyHelper.h
//  NewKnowledge
//
//  Created by  on 15/6/25.
//  Copyright (c) 2015年 vct. All rights reserved.
//  简便小东西~

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

#import "SBJSON.h"
#import "NK_Base64.h"

@interface MyHelper : NSObject

//图片变灰
+(UIImage *)Image_Hui:(UIImage *)sourceImage;


+(NSString*)str_Null:(NSString*)str;

/**
 加入购物车的动画效果
 
 @param goodsImage 商品图片
 @param startPoint 动画起点
 @param endPoint   动画终点
 @param completion 动画执行完成后的回调
 */
+ (void)addToShoppingCartWithGoodsImage:(UIImage *)goodsImage
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                             completion:(void (^)(BOOL finished))completion;


//跳转到地图
+(void)go_GaoDe:(NSString*)lat lot:(NSString*)lot name:(NSString*)name;

//当前系统版本
+ (float)Get_BanBenHao;
//判断定位权限
+(BOOL)if_DingWei;

//修改行间距
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font Spacing:(CGFloat)spacing;
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font Spacing:(CGFloat)spacing alignment:(NSTextAlignment)alignment;
//修改行间距后的高
+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width  Spacing:(CGFloat)spacing;

+ (NSString*)toToken;//获取token


//身份证验证
+ (BOOL) shenfenzheng:(NSString *)value;

//手机号验证
//判断是否是手机号码
+(BOOL) isPhone:(NSString *)string;

//#pragma mark - 高斯模糊 image图片 blur模糊度
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

#pragma mark 2.浮点形判断：
+ (BOOL)isPureFloat:(NSString *)string;

#pragma mark //获取当前时间
+(NSString*)getCurrentTime;

#pragma mark //颜色转成图片
+(UIImage*) createImageWithColor:(UIColor*) color;

//点赞放大动画
+ (void)DongHua_Image:(UIImageView*)image_View;

+ (NSString*)Url_String:(NSString*)str;

+ (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize;

//存缓存
+ (void)CunShuJu:(NSDictionary *)dic_data URL_LuJing:(NSString*)str_URL;
//取缓存
+ (NSDictionary*)QuShuJu:(NSString*)str_URL;
//删除数据
+ (void)ShanShuJu:(NSString*)str_URL;

//提示语
+(void)showMessage:(NSString *)message;

+(void)showTopMessage:(NSString *)message;

//判断是否为汉字
+(BOOL)isChinesecharacter:(NSString *)string;
//计算汉字的个数
+(NSInteger)chineseCountOfString:(NSString *)string;
//计算字母的个数
+(NSInteger)characterCountOfString:(NSString *)string;
//一个汉字长度为1,两个字母长度为1
+(NSUInteger)unicodeLengthOfString:(NSString *)text;

//时间戳转时间
+(NSString *)dateChangeToTime:(NSString *)string;

+(NSString *)dateChangeToTimeRemind:(NSString *)string; //查看提醒用
//时间转时间戳
+ (NSString *)timeChangeToTimeStamp:(NSString *)string;

//时间转多少天前等等
+ (NSString *)getUTCFormateDate:(NSString *)newsDate;

//判断字符串为空或只为空格
+(BOOL)isBlankString:(NSString *)string;

+(NSString *)md5:(NSString *)str;

+(NSString*)stringToBase64:(NSString*)string;

+(NSString*)toJson:(NSDictionary*)dict;

+ (NSString *)base64EncodedStringFrom:(NSData *)data;

//截图
+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size;

+ (CGFloat)strHeight:(NSString *)str andFont:(UIFont * )font andWidth:(CGFloat )width;
+ (CGFloat)strWidth:(NSString *)str andFont:(UIFont * )font andHeight:(CGFloat )height;


@end
