//
//  AttributesEntity.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "AttributesEntity.h"

@implementation AttributesEntity

+ (NSArray *)parseAttributesEntityListWithJson:(id)json
{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (AttributesEntity *)parseAttributesEntityWithJson:(id)json
{
    return [self parseObjectWithKeyValues:json];
}

- (id)copyWithZone:(NSZone *)zone {
    
    AttributesEntity *entity = [[[self class] allocWithZone:zone] init];
    entity.attribute = self.attribute;
    entity.name = self.name;
    entity.contents = self.contents;
    entity.attrId = self.attrId;
    return entity;
    
}

@end
