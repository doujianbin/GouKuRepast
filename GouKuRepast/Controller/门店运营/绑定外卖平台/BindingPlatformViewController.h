//
//  BindingPlatformViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^BindingPlatformComplete)(void);
@interface BindingPlatformViewController : BaseViewController

@property (nonatomic ,strong)NSString   *str_title;
@property (nonatomic ,strong)NSString   *str_Url;

@property (nonatomic ,strong)BindingPlatformComplete bindingPlatformComplete;

@end
