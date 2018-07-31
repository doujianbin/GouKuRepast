//
//  RepastCommodityHandler.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseHandler.h"

@interface RepastCommodityHandler : BaseHandler

//图片上传获取Secruity-Token
+ (void)getSecruityTokenPrepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//获取一级原料分类
+ (void)getFirstMaterialCategoryWithPage:(int)page prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//获取二级原料分类
+ (void)getSecondMaterialCategoryWithPage:(int)page materialId:(NSString *)materialId prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//获取三级原料分类
+ (void)getThiredMaterialCategoryWithPage:(int)page materialId:(NSString *)materialId prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//搜索原料
+(void)materialSearchWithpage:(int)page material:(NSString *)material prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//搜索品牌
+ (void)brandSearchWithPage:(int)page brand:(NSString *)brand prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//新建商品
+ (void)addRepastCommodityWithDic:(NSDictionary *)dic prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//获取所有商品
+ (void)repastCommodityListWithKeyWord:(NSString *)keyWord categoryId:(NSNumber *)categoryId status:(NSNumber *)status prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//餐饮商品上下架
+ (void)repastCommodityUpdateWithSpu:(NSNumber *)spu type:(NSNumber *)type prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//餐饮商品批量上下架
+ (void)repastCommodityUpdateListWithArr:(NSArray *)arr prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//餐饮商品删除
+ (void)repastCommodityDeleteWithSpu:(NSNumber *)spu prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//餐饮商品批量删除
+ (void)repastCommodityDeleteListWithArr:(NSArray *)arr prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;

//通过条形码查询商品信息
+ (void)getRepastInformationWithBarCode:(NSString *)barcode prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed;












@end
