//
//  StandardsEntity.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "StandardsEntity.h"

@implementation StandardsEntity

+ (NSArray *)parseStandardsEntityListWithJson:(id)json
{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (StandardsEntity *)parseStandardsEntityWithJson:(id)json
{
    return [self parseObjectWithKeyValues:json];
}

- (id)copyWithZone:(NSZone *)zone {
    
    StandardsEntity *entity = [[[self class] allocWithZone:zone] init];
    entity.sku = self.sku;
    entity.name = self.name;
    entity.desc = self.desc;
    entity.pictures = self.pictures;
    entity.weight = self.weight;
    entity.weightNnit = self.weightNnit;
    entity.stockType = self.stockType;
    entity.stock = self.stock;
    entity.storeUsing = self.storeUsing;
    entity.onlineStoreUsing = self.onlineStoreUsing;
    entity.storePrice = self.storePrice;
    entity.onlineStorePrice = self.onlineStorePrice;
    entity.dispatchingPrice = self.dispatchingPrice;
    entity.dispatchingCount = self.dispatchingCount;

    return entity;
    
}

@end
