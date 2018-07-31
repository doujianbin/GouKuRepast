//
//  MaterialsEntity.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "MaterialsEntity.h"

@implementation MaterialsEntity

+ (NSArray *)parseMaterialsEntityListWithJson:(id)json
{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (MaterialsEntity *)parseMaterialsEntityWithJson:(id)json
{
    return [self parseObjectWithKeyValues:json];
}

- (id)copyWithZone:(NSZone *)zone {
    
    MaterialsEntity *entity = [[[self class] allocWithZone:zone] init];
    entity.materialId = self.materialId;
    entity.name = self.name;
    entity.content = self.content;
    return entity;
    
}

@end
