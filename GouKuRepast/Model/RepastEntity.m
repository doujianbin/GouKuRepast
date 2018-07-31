//
//  RepastEntity.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "RepastEntity.h"

@implementation RepastEntity


+ (NSDictionary *)objectClassInArray
{
    return @{
             @"standards"  : [StandardsEntity class],
             @"materials"  : [MaterialsEntity class],
             @"attributes" : [AttributesEntity class],
             };
}

+ (NSArray *)parseRepastEntityListWithJson:(id)json{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (RepastEntity *)parseRepastEntityWithJson:(id)json{
    return [self parseObjectWithKeyValues:json];
}

- (id)copyWithZone:(NSZone *)zone {
    
    RepastEntity *entity = [[[self class] allocWithZone:zone] init];
    entity.barcodeType = self.barcodeType;
    entity.wareItemId = self.wareItemId;
    entity.name = self.name;
    entity.desc = self.desc;
    entity.brandId = self.brandId;
    entity.pictures = self.pictures;
    entity.categoryId = self.categoryId;
    entity.categoryName = self.categoryName;
    entity.storeUsing = self.storeUsing;
    entity.onlineStoreUsing = self.onlineStoreUsing;
    entity.standards = self.standards;
    entity.materials = self.materials;
    entity.attributes = self.attributes;
    entity.barcode = self.barcode;
    
    return entity;
    
}


@end
