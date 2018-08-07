//
//  APIConfig.h
//  DocChat
//
//  Created by SeanLiu on 15/8/4.
//  Copyright (c) 2015年 juliye. All rights reserved.
//

#ifndef DocChat_APIConfig_h
#define DocChat_APIConfig_h
/*
 http://47.97.174.40:9001
 http://47.97.174.40:9000
 */

//1:正式网 2:测试打包
#define SERVER_TYPE  1

#if (SERVER_TYPE == 1)
    //appstore环境
    #define API_Login                   @"https://passport.goukugogo.com"
    #define API_OrderAndPay             @"https://trade.goukugogo.com"
    #define API_Other                   @"https://shop.goukugogo.com"
    #define KEY_JPUSH                   @"830270bcca5d93d0be9b6a1e"
    #define Jpush                       @"YES"
    #define SERVER_HOST                 @"47.97.174.40:9001"

#elif (SERVER_TYPE == 2)
    //测试打包
    #define API_Login                   @"http://47.97.174.40:9000"
    #define API_OrderAndPay             @"http://47.97.174.40:9002"
    #define API_Other                   @"http://47.97.174.40:9001"
    #define KEY_JPUSH                   @"830270bcca5d93d0be9b6a1e"
    #define Jpush                       @"NO"
    #define SERVER_HOST                 @"47.97.174.40:9001"
#endif

//HTTP_PROTOCOL 用来区分 http与https
//#define HTTPS_PROTOCOL
#if (SERVER_TYPE == 2)
#define SERVER_PROTOCOL @"http://"
#else
#define SERVER_PROTOCOL @"https://"
#endif
    #define SERVER_HOST                 @"47.97.174.40:9001"
//JPUSH
#define JPushAppKey @"a39c6215cc0d16b9dd42db44"

//API VERSION
#define API_VERSION @""
//头像前缀
#define HeadQZ @"https://gouku-ware.oss-cn-zhangjiakou.aliyuncs.com/"

/*
     商品API
 */

//上传图片
#define API_POST_uploadPic @"/common/upload"

//店内分类列表
#define API_GET_ShopCommodityCategory @"/shop/ware/category/all/"
//分类下店内商品列表
#define API_GET_CommodityInformation @"/shop/ware/item/list"
//商品类目列表
#define API_GET_CommodityCatahory @"/ware/category/list/%@"
//通过商品分类获取商品规格值
#define API_GET_Standard @"/ware/standard/list/%@"
//通过条形码获取商品信息
#define API_GET_CommodityInformationFromBarCode @"/ware/"
//获取店内分类
#define API_GET_ShopCatagory @"/shop/category/list"
//添加店内分类
#define API_GET_AddShopCatagory @"/shop/ware/category/add"
//删除店内分类
#define API_GET_DelShopCatagory @"/shop/ware/category/delete"
//修改店内分类
#define API_GET_UdpShopCatagory @"/shop/ware/category/update"
//新增商品
#define API_GET_AddCommodity @"/wareSku/shop/addList/"
//新增自定义商品
#define API_POST_AddCustomizeCommodity @"/wareSku/shop/add"
//商品查询
#define API_GET_CommodityList @"/wareSku/manage/list"
//搜索商品
#define API_GET_SearchCommodity @"/shop/ware/stock/search"
//获取门店 网店  店内分类
#define API_POST_ShopWareCategory @"/shop/ware/category/all"

//商品库商品删除
#define API_GET_CommodityDelete @"/wareSku/manage/delete/"
//门店商品编辑
#define API_GET_CommodityEdit @"/wareSku/shop/update"
//商品发布
#define API_POST_CommodityRelease @"/wareSku/shop/release"
//商品批量发布
#define API_POST_ReleaseList @"/wareSku/shop/releaseList"
//商品库商品批量删除
#define API_POST_DeleteList @"/wareSku/shop/deleteWareList"
//门店/网店  商品修改
#define API_POST_WareSkuRelease @"/wareSku/shop/release"
//门店。网店  单个 商品上、下架
#define API_POST_WareSkuUpdateStatus @"/wareSku/shop/updateStatus"
//门店.网店  商品 单个 移除
#define API_POST_WareSkuRemoveWare @"/wareSku/shop/removeWare"
//门店。网店  批量 商品上、下架
#define API_POST_WareSkuUpdateStatusList @"/wareSku/shop/updateStatusList"
//门店或网店  商品批量移除
#define API_POST_WareSkuRemoveWareList @"/wareSku/shop/removeWareList"


/*
 供应商商品API
 */
//供应商商品列表查询  查询所有商品(后台管理)
#define API_POST_SupplierCommodityList @"/wareSku/manage/list"

//供应商新增商品
#define API_POST_AddSupplierCommdity @"/wareSku/manage/addOrUpdate"
//供应商商品修改
#define API_POST_UpdateSupplierCommodity @"/wareSku/manage/addOrUpdate"
//供应商修改商品状态
#define API_POST_UpdateSupplierCommodityStatus @"/wareSku/manage/updateStatus"
//供应商商品删除
#define API_POST_SupplierCommodityDelete @"/wareSku/manage/delete/"
//获取商品详情
#define API_POST_GETSupplierCommodityInformation @"/wareSku/show/get/"
//供应商添加关注
#define API_POST_SupplierAttentionAdd @"/shop/supplier/attention/add"
//供应商取消关注
#define API_POST_SupplierAttentionCancel @"/shop/supplier/attention/cancel"
//设置运费起送费
#define API_POST_SetSupplierPrice @"/supplier/set/price"
//获取配送费和起送费
#define API_POST_GetSupplierPrice @"/supplier/get/price"

/*
 活动API
 */
// 添加活动
#define API_POSTactivityAdd @"/act/addOrUpdate"
//查询所有活动
#define API_POST_AllActList  @"/act/list"
//停止活动
#define API_POST_STOPACTIVE @"/act/stop/"
//查看活动详情
#define API_GET_SELECTACTIVE @"/act/detail/"


/*
 结算API
 */
//结算信息 （结算首页）
#define API_POST_AccountShow @"/account/show"
//余额明细
#define API_POST_AccountDetails @"/account/details"
//获取银行列表
#define API_POST_bankMessage @"/account/bank/message"
//添加银行卡获取验证码
#define API_POST_AccountCode @"/account/get/code"
//添加银行卡
#define API_POST_addBankCard @"/account/add/bankCard"
//提现校验密码
#define API_POST_checkPassword @"/account/checkPassword"
//提现详情
#define API_POST_CashDetail @"/account/cash/detail"
//微信充值
#define API_POST_WEIXINchongzhi @"/account/recharge/weixin"
//账单查询
#define API_POST_OutOrderDetail @"/outOrder/detail"

/*
 收银API
 */
//扫码添加商品到购物车
#define API_POST_CommodityCashier @"/shop/ware/stock"
//提交订单
#define API_POST_AddOrder @"/order/add"
//扫描用户付款吗上传
#define API_POST_ScanUserCashCode @"/order/f2fpay"
//查询满减活动金额
#define API_POST_SelectManJianPrice @"/shop/act/order"
//现金收银
#define API_POST_PayInCash @"/order/pay/cash/"

/*
 订单API
 */
//订单列表查询
#define API_POST_OrderList @"/order/list"
//订单详情查询
#define API_POST_OrderDetail @"/order/details"
//订单搜索
#define API_POST_OrderSearch @"/order/search"

//商机门店列表
#define API_POST_MINEShoplist @"/mine/shoplist"
#endif

/*
 工作台API
 */
// 经营数据
#define API_GET_GetToday @"/operate/getToday"
//app版本号（是否需要强制更新）
#define API_GET_AppVersion @"/common/app-version"
//设置是否自动打印
#define API_POST_PrinterAuto @"/shop/printer/auto"
//设置打印联数
#define API_POST_SetPrintNum @"/shop/set/printer"

/*
 采购API
 */
//所有类目
#define API_GET_ALLCATEGORY @"/common/industry/list"
//类目搜索供应商
#define API_GET_SUPPLIERWITHCATEGORY @"/shop/supplier/search/industry"
//名字搜索供应商
#define API_POST_SearchSupplier @"/shop/supplier/search"
//供应商详情查询
#define API_POST_SelectSupplierDetail @"/shop/supplier/detail"
//查询所有商品
#define API_GET_WARE @"/wareSku/show/list"
//购物车列表
#define API_GET_SHOPPINGLIST @"/shopping/get"
//添加购物车
#define API_POST_AddShoppingCar @"/shopping/add"
//清空购物车
#define API_GET_DeleteShoppingCar @"/shopping/delete"
//删除一个购物车商品
#define API_POST_DeleteShoppingInfo @"/shopping/delete/info"
//删除多个购物车商品
#define API_POST_DeleteMoreShoppingInfo @"/shopping/delete/list"
//清空失效商品
#define API_GET_ShoppingRemove @"/shopping/remove"
//结算生成新订单
#define API_POST_NewOrder @"/shopOrder/new"
//查询采购订单列表
#define API_POST_ShopOrderList @"/shopOrder/user/list"
//查询采购订单详情
#define API_GET_ShopOrderDetail @"/shopOrder/user/get/"
//取消采购订单
#define API_GET_CancelShopOrder @"/shopOrder/user/close/"
//采购订单确认收货
#define API_GET_ConfirmShopOrder @"/shopOrder/user/confirm/"
//获取购物车中商品个数
#define API_GET_GetCountInShopCart @"/shopping/getCount"
//用户支付订单(单个订单)
#define API_POST_UserPayOrder @"/shopOrder/payOrder"
//用户支付订单(多个订单)
#define API_POST_UserPayOrderMore @"/shopOrder/payOrderList"

/*
 地址管理API
 */
//查看所有地址
#define API_POST_SelectAddressList @"/shop/address/list"
//添加新的地址
#define API_POST_AddNewAddress @"/shop/add/address"
//设置默认地址
#define API_GET_SettingDefaultAddress @"/shop/default/address"
//获取默认地址
#define API_POST_SelectDefaultAddress @"/shop/get/default/address"
//删除地址
#define API_GET_DeleteAddress @"/shop/delete/address"
//获取省市区
#define API_GET_SSQ @"/common/province/city/district/list"
//编辑地址
#define API_POST_UpdateAddress @"/shop/update/address"

/*
 客户管理API
 */
//获取客户管理列表
#define API_POST_GetCustomerList @"/supplier/customer/list"
//搜索客户
#define API_POST_SearchCustomer @"/supplier/search/customer"


/*
 盘点API
 */
//查询盘点列表
#define API_GET_InventroyList @"/inventory/list/"
//通过条形码查询商品库存
#define API_POST_SelectInventoryInformation @"/inventory/ware/"
//盘点记录新增
#define API_POST_AddInventory @"/inventory/addOrUpdate"
//删除一条盘点记录
#define API_GET_DeleteInventory @"/inventory/delete/"
//查询一条盘点记录
#define API_GET_SelectInventoryDetail @"/inventory/detail/"
//盘点记录修改
#define API_POST_InventoryUpdate @"/inventory/addOrUpdate"
//删除单个盘点商品
#define API_GET_DeleteInventoryWare @"/inventory/ware/delete/"

/*
 供应商订单API
 */
//供应商订单列表查询
#define API_POST_SupplierOrderList @"/shopOrder/shop/list"
//供应商修改订单价格
#define API_POST_SupplierChangePrice @"/shopOrder/shop/updatePrice"
//供应商发货
#define API_GET_SupplierSend @"/shopOrder/shop/send/"
//供应商取消订单
#define API_GET_SupplierCancelOrder @"/shopOrder/shop/close/"
//获取待处理订单数量
#define API_GET_SupplierOrderCount @"/shopOrder/shop/getCount"

/*
 外部订单(美团、饿了么) API
 */
//查询待处理订单
#define API_GET_OutOrderManager @"/outOrder/handle/"    //status：1新订单2带配送3取消订单
//商户接单
#define API_GET_OutOrderTaking @"/outOrder/shop/taking/"
//商户同意用户取消订单
#define API_GET_OutOrderShopRefund @"/outOrder/shop/refund/"
//商户查询订单
#define API_POST_OutOrderListSearch @"/outOrder/list/search"
//查询待处理订单数量
#define API_GET_OutOrderCount @"/outOrder/handle/getCount"
//获取订单详情
#define API_GET_ShopGetOutOrderDetail @"/shopOrder/shop/get/"

/*
 餐饮端商品 API
 */

//图片上传获取Secruity-Token
#define API_GET_SecruityToken @"/common/secruity-token"

//获取一级原料分类
#define API_GET_MaterialFirstCategory @"/material/first/category"
//获取二级原料分类
#define API_GET_MaterialSecondCategory @"/material/second/category"
//获取三级原料分类
#define API_GET_MaterialThriedCategory @"/material/get"
//搜索原料
#define API_POST_MaterialSearch @"/material/search"
//搜索品牌
#define API_POST_BrandSearch @"/shop/brand/search"
//获取所有商品
#define API_POST_RepastCommodityList @"/catering/show/list"
//新建商品(编辑商品)
#define API_POST_AddRepastCommodity @"/catering/manage/addOrUpdate"
//餐饮商品上下架
#define API_POST_RepastUpdateStatus @"/catering/manage/updateStatus"
//餐饮商品批量上下架
#define API_POST_RepastUpdateStatusList @"/catering/manage/updateStatusList"
//餐饮商品删除
#define API_GET_RepastDelete @"/catering/manage/delete/"
//餐饮商品批量删除
#define API_POST_RepastDeleteList @"/catering/manage/deleteList"
//条码搜索餐饮商品
#define API_GET_RepastWithBarcode @"/catering/ware/"







