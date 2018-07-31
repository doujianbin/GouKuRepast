//
//  StandardsEntity.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"

@interface StandardsEntity: BaseEntity

@property (nonatomic ,strong)NSNumber         *sku;
@property (nonatomic ,strong)NSNumber         *skuId;
@property (nonatomic ,strong)NSString         *name;
@property (nonatomic ,strong)NSString         *desc;
@property (nonatomic ,strong)NSString         *pictures;
@property (nonatomic ,strong)NSNumber         *weight;
@property (nonatomic ,strong)NSString         *weightNnit;
@property (nonatomic ,assign)BOOL              stockType;
@property (nonatomic ,strong)NSNumber         *stock;
@property (nonatomic ,assign)BOOL              storeUsing;
@property (nonatomic ,assign)BOOL              onlineStoreUsing;
@property (nonatomic ,assign)double            storePrice;
@property (nonatomic ,assign)double            onlineStorePrice;
@property (nonatomic ,assign)double            dispatchingPrice;
@property (nonatomic ,strong)NSNumber         *dispatchingCount;

+ (NSArray *)parseStandardsEntityListWithJson:(id)json;
+ (StandardsEntity *)parseStandardsEntityWithJson:(id)json;

@end

/*
"sku":<number>,        //标准商品sku
"name":<String>,       //规格名称
"description":<String>,//规格描述
"pictures":<String>,   //规格图片
"weight":<number>,     //重量
"weightNnit":<String>, //重量单位
"stockType":<Boolean>, //库存是否无限
"stock":<number>,      //库存数目
"storeUsing":<Boolean>,//是否支持堂食
"onlineStoreUsing":<Boolean>,//是否支持外卖
"storePrice":<Decimal>, //堂食价格
"onlineStorePrice":<Decimal>,//外卖价格
"dispatchingPrice":<Decimal>,//包装费用
"dispatchingCount":<number>//包装数量
*/
