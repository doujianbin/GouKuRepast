//
//  MaterialsEntity.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"

@interface MaterialsEntity : BaseEntity

@property (nonatomic ,strong)NSNumber         *attrId;
@property (nonatomic ,strong)NSString         *materialId;
@property (nonatomic ,strong)NSString         *name;
@property (nonatomic ,strong)NSString         *content;

+ (NSArray *)parseMaterialsEntityListWithJson:(id)json;
+ (MaterialsEntity *)parseMaterialsEntityWithJson:(id)json;

@end

/*
"materialId":<number>,          //原料ID
"name":<String>,                //原料名称
"value":<String>                //原料描述
*/
