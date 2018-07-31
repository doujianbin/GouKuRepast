//
//  SelectSecondMarerialsViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SelectMarerialsComplete)(NSDictionary *dic_marerials);

@interface SelectSecondMarerialsViewController : BaseViewController

@property (nonatomic ,strong)NSString        *marerialsName;
@property (nonatomic ,strong)NSString        *marerialsId;

@property (nonatomic ,copy)SelectMarerialsComplete    selectMarerialsComplete;


@end
