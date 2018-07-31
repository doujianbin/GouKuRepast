//
//  SecruityTokenEntity.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SecruityTokenEntity.h"

@implementation SecruityTokenEntity

+ (NSArray *)parseSecruityTokenEntityListWithJson:(id)json{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (SecruityTokenEntity *)parseSecruityTokenEntityWithJson:(id)json{
    return [self parseObjectWithKeyValues:json];
}

@end
