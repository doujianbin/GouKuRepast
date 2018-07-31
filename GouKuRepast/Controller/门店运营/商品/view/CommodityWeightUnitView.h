//
//  CommodityWeightUnitView.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectWeightUnit)(NSString *weightUnit);
@interface CommodityWeightUnitView : UIView

@property (nonatomic ,strong)UIButton     *btn_weightUnit;

@property (nonatomic ,copy)SelectWeightUnit       selectWeightUnit;
@end
