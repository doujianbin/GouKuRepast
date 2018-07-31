//
//  ManagerMaterialsViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SelectMaterialsComplete)(NSArray *arr_Materials);

@interface ManagerMaterialsViewController : BaseViewController

@property (nonatomic ,strong)NSArray      *arr_materials;

@property (nonatomic ,copy)SelectMaterialsComplete   selectMaterialsComplete;
@end
