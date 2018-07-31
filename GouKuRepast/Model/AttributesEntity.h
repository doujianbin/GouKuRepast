//
//  AttributesEntity.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"

@interface AttributesEntity : BaseEntity

@property (nonatomic ,strong)NSString         *name;
@property (nonatomic ,strong)NSString         *attribute;
@property (nonatomic ,strong)NSArray          *contents;

+ (NSArray *)parseAttributesEntityListWithJson:(id)json;
+ (AttributesEntity *)parseAttributesEntityWithJson:(id)json;


@end


/*
 "name":<String>,        //属性名称
 "value":<String>        //属性值(多属性值以逗号隔开)
 */
