//
//  TakeAwayPlatformEntity.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "TakeAwayPlatformEntity.h"

@implementation TakeAwayPlatformEntity

+ (NSArray *)parseTakeAwayPlatformEntityListWithJson:(id)json{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (TakeAwayPlatformEntity *)parseTakeAwayPlatformEntityWithJson:(id)json{
    return [self parseObjectWithKeyValues:json];
}


@end
