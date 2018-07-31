//
//  EditCommodityViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/25.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"
#import "RepastEntity.h"

typedef void(^ChangeRepastCommodity)(RepastEntity *repastEntity);

@interface EditCommodityViewController : BaseViewController

@property (nonatomic,strong)RepastEntity    *repastEntity;
@property (nonatomic ,copy )ChangeRepastCommodity      changeRepastCommodity;

@end
