//
//  SelectMarerialsViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SelectMarerialsComplete)(NSDictionary *dic_marerials);
@interface SelectMarerialsViewController : BaseViewController

@property (nonatomic ,copy)SelectMarerialsComplete    selectMarerialsComplete;
@end
