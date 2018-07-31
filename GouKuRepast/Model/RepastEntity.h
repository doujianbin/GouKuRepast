//
//  RepastEntity.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"
#import "StandardsEntity.h"
#import "MaterialsEntity.h"
#import "AttributesEntity.h"

@interface RepastEntity : BaseEntity

@property (nonatomic ,assign)BOOL              barcodeType;
@property (nonatomic ,strong)NSString         *barcode;
@property (nonatomic ,strong)NSNumber         *wareItemId;
@property (nonatomic ,strong)NSNumber         *spu;
@property (nonatomic ,strong)NSString         *name;
@property (nonatomic ,strong)NSString         *desc;
@property (nonatomic ,strong)NSNumber         *brandId;
@property (nonatomic ,strong)NSString         *brandName;
@property (nonatomic ,strong)NSString         *pictures;
@property (nonatomic ,strong)NSNumber         *categoryId;
@property (nonatomic ,strong)NSString         *categoryName;
@property (nonatomic ,assign)BOOL              storeUsing;
@property (nonatomic ,assign)BOOL              onlineStoreUsing;
@property (nonatomic ,strong)NSArray          *standards;
@property (nonatomic ,strong)NSArray          *materials;
@property (nonatomic ,strong)NSArray          *attributes;

+ (NSArray *)parseRepastEntityListWithJson:(id)json;
+ (RepastEntity *)parseRepastEntityWithJson:(id)json;

@end


/*
 "barcodeType":<Boolean>,                    //是否有码
 "wareItemId":<number>,                      //标准商品项ID
 "spu":<number>,                             //标准商品SPU
 "name":<String>,                            //商品名称
 "description":<String>,                     //商品描述
 "brandId":<number>,                         //品牌ID
 "pictures":<String>,                        //商品图片
 "categoryId":<number>,                      //店内分类ID
 "standards":[                               //规格数组
 materials                                   //原料
 attributes                                  //属性
 */
