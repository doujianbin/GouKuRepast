//
//  TakeAwayPlatformEntity.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"

@interface TakeAwayPlatformEntity : BaseEntity

@property (nonatomic ,strong)NSString    *meituanShopName;
@property (nonatomic ,strong)NSString    *elemeShopName;
@property (nonatomic ,strong)NSString    *meituanUrl;
@property (nonatomic ,strong)NSString    *elemeUrl;
@property (nonatomic ,strong)NSString    *meituanUnbindUrl;     //美团解绑url

+ (NSArray *)parseTakeAwayPlatformEntityListWithJson:(id)json;
+ (TakeAwayPlatformEntity *)parseTakeAwayPlatformEntityWithJson:(id)json;

@end

