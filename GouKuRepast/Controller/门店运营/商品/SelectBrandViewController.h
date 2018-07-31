//
//  SelectBrandViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SelectBrandComplete)(NSString *brandName,NSNumber *brandId);

@interface SelectBrandViewController : BaseViewController

@property (nonatomic ,copy)SelectBrandComplete   selectBrandComplete;

@end
