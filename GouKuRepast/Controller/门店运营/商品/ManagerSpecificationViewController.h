//
//  ManagerSpecificationViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SelectSpecificationComplete)(NSArray *arr_Specification,NSMutableArray *arr_deleteIds);

@interface ManagerSpecificationViewController : BaseViewController

@property (nonatomic ,strong)NSArray      *arr_specification;
@property (nonatomic ,strong)NSMutableArray      *arr_deleteIds;

@property (nonatomic ,copy)SelectSpecificationComplete   selectSpecificationComplete;

@end
