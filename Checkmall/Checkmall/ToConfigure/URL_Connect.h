//
//  URL_Connect.h
//  同文同书
//
//  Created by 车客网 on 2017/6/29.
//  Copyright © 2017年 XC. All rights reserved.
//

#ifndef URL_Connect_h
#define URL_Connect_h

//首页
#define product_getRecommendProduct [NSString stringWithFormat:@"%@%@",URL_LJ,@"product/getRecommendProduct"]//首页
#define message_getIphone [NSString stringWithFormat:@"%@%@",URL_LJ,@"message/getIphone"]//发送验证码
#define login_getUserInfo [NSString stringWithFormat:@"%@%@",URL_LJ,@"login/getUserInfo"]//账号操作
#define Category_getCatelist [NSString stringWithFormat:@"%@%@",URL_LJ,@"Category/getCatelist"]//分类列表
#define address_getArea [NSString stringWithFormat:@"%@%@",URL_LJ,@"address/getArea"]//获取地区
#define address_getStoreInfo [NSString stringWithFormat:@"%@%@",URL_LJ,@"address/getStoreInfo"]//获取门店
#define address_addAdderssByNameId [NSString stringWithFormat:@"%@%@",URL_LJ,@"address/addAdderssByNameId"]//获取门店
#define address_getAddressList [NSString stringWithFormat:@"%@%@",URL_LJ,@"address/getAddressList"]//获取地址列表
#define user_getUserInfo [NSString stringWithFormat:@"%@%@",URL_LJ,@"user/getUserInfo"]//个人中心



#endif /* URL_Connect_h */
