//
//  YueDetailViewController.h
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/30.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"
typedef enum : int {
    YueDetailFormGouKu,
    YueDetailFormEleMe,
    YueDetailFormMeiTuan,
} YueDetailFormType;

@interface YueDetailViewController : BaseViewController

@property (nonatomic ,assign)YueDetailFormType     yueDetailFormType;

@end
