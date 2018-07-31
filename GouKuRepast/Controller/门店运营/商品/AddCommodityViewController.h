//
//  AddCommodityViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"
#import "RepastEntity.h"

typedef void(^AddRepastCommodityComplete)(RepastEntity *entity);
@interface AddCommodityViewController : BaseViewController

@property (nonatomic ,strong)AddRepastCommodityComplete    addRepastCommodityComplete;

@end
