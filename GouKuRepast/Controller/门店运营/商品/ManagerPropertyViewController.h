//
//  ManagerPropertyViewController.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^SelectPropertyComplete)(NSArray *arr_attritus,NSMutableArray *arr_deleteIds);
@interface ManagerPropertyViewController : BaseViewController

@property (nonatomic ,strong)NSArray      *arr_property;
@property (nonatomic ,strong)NSMutableArray      *arr_deleteIds;


@property (nonatomic ,copy)SelectPropertyComplete   selectPropertyComplete;

@end
