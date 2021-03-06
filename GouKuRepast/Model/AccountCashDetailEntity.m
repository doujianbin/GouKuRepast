//
//  AccountCashDetailEntity.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/4/8.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "AccountCashDetailEntity.h"

@implementation AccountCashDetailEntity

+ (NSDictionary *)objectClassInArray
{
    return @{
             @"bankCard" : [BankCardEntity class],
             };
}

+ (NSArray *)parseStandardListWithJson:(id)json{
    return [self parseObjectArrayWithKeyValues:json];
}

+ (AccountCashDetailEntity *)parseStandardEntityWithJson:(id)json{
    return [self parseObjectWithKeyValues:json];
}

@end
