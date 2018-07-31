//
//  SecruityTokenEntity.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"

@interface SecruityTokenEntity : BaseEntity

@property (nonatomic ,strong) NSString         *securityToken;
@property (nonatomic ,strong) NSString         *accessKeySecret;
@property (nonatomic ,strong) NSString         *accessKeyId;

+ (NSArray *)parseSecruityTokenEntityListWithJson:(id)json;
+ (SecruityTokenEntity *)parseSecruityTokenEntityWithJson:(id)json;

@end
