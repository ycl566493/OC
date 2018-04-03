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
#define address_delAddress [NSString stringWithFormat:@"%@%@",URL_LJ,@"address/delAddress"]//删除地址
#define address_updateAddressIsFirst [NSString stringWithFormat:@"%@%@",URL_LJ,@"address/updateAddressIsFirst"]//默认地址
#define Category_getCategoryName [NSString stringWithFormat:@"%@%@",URL_LJ,@"Category/getCategoryName"]//分类商品列表
#define product_bulkDetail [NSString stringWithFormat:@"%@%@",URL_LJ,@"product/bulkDetail"]//分类商品列表
#define goodscar_addGoodsToCar [NSString stringWithFormat:@"%@%@",URL_LJ,@"goodscar/addGoodsToCar"]//添加购物车
#define goodscar_getGoodsCarData [NSString stringWithFormat:@"%@%@",URL_LJ,@"goodscar/getGoodsCarData"]//购物车列表

#define goodscar_getCarCount [NSString stringWithFormat:@"%@%@",URL_LJ,@"goodscar/getCarCount"]//获取购物车数量
#define goodscar_addAndReduce [NSString stringWithFormat:@"%@%@",URL_LJ,@"goodscar/addAndReduce"]//修改购物车数量
#define goodscar_clearShopCar [NSString stringWithFormat:@"%@%@",URL_LJ,@"goodscar/clearShopCar"]//清空购物车
#define order_getOrderDesc [NSString stringWithFormat:@"%@%@",URL_LJ,@"order/getOrderDesc"]//确认订单
#define order_getMessage [NSString stringWithFormat:@"%@%@",URL_LJ,@"order/getMessage"]//下单
#define order_orderList [NSString stringWithFormat:@"%@%@",URL_LJ,@"order/orderList"]//订单列表
#define coupon_getmycoin [NSString stringWithFormat:@"%@%@",URL_LJ,@"coupon/getmycoin"]//购物车列表
#define Advertisement_getBannerList [NSString stringWithFormat:@"%@%@",URL_LJ,@"Advertisement/getBannerList"]//广告
#define login_wxLogin [NSString stringWithFormat:@"%@%@",URL_LJ,@"login/wxLogin"]//微信登录 
#define login_bindingUser [NSString stringWithFormat:@"%@%@",URL_LJ,@"login/bindingUser"]//微信绑定手机号
#define Group_getGroupGoodsListByid [NSString stringWithFormat:@"%@%@",URL_LJ,@"Group/getGroupGoodsListByid"]//团购商品列表
#define Search_goodsSearch [NSString stringWithFormat:@"%@%@",URL_LJ,@"Search/goodsSearch"]//搜索列表
#define Wxpay_wxPay [NSString stringWithFormat:@"%@%@",URL_LJ,@"Wxpay/wxPay"]//充值
#define Order_returnStatus [NSString stringWithFormat:@"%@%@",URL_LJ,@"Order/returnStatus"]//返回订单状态
#define Coupon_getcoin_warn [NSString stringWithFormat:@"%@%@",URL_LJ,@"Coupon/getcoin_warn"]//更新优惠劵送礼品
#define Coupon_receiveCoin [NSString stringWithFormat:@"%@%@",URL_LJ,@"Coupon/receiveCoin"]//领取兑换券

#define Order_saveOrderStatus [NSString stringWithFormat:@"%@%@",URL_LJ,@"Order/saveOrderStatus"]//取消订单
#define Order_goToPayment [NSString stringWithFormat:@"%@%@",URL_LJ,@"Order/goToPayment"]//去支付





#endif /* URL_Connect_h */
