//
//  CommodityMaterialsTableViewCell.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MaterialsEntity.h"

@interface CommodityMaterialsTableViewCell : UITableViewCell

@property (nonatomic ,strong) UITextField              *tf_materials;
@property (nonatomic ,strong) UIButton                 *btn_materials;
@property (nonatomic ,strong) UITextField              *tf_weigth;
@property (nonatomic ,strong) UIView                   *v_gray;

- (void)contentCellWithMaterialsEntity:(MaterialsEntity *)materialsEntity;


@end
