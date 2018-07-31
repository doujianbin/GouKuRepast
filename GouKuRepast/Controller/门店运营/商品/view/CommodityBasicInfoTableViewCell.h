//
//  CommodityBasicInfoTableViewCell.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepastEntity.h"
@interface CommodityBasicInfoTableViewCell : UITableViewCell

@property (nonatomic ,strong) UITextField          *tf_commodityName;
@property (nonatomic ,strong) UITextField          *tf_commodityDsecrib;
@property (nonatomic ,strong) UITextField          *tf_commodityBrand;     //品牌
@property (nonatomic ,strong) UIButton             *btn_commodityBrand;
@property (nonatomic ,strong) UIImageView          *iv_commodityPic;
@property (nonatomic ,strong) UITextField          *tf_commodityClassification;
@property (nonatomic ,strong) UIButton             *btn_commodityClassification;

- (void)contentCellWithRepastEntity:(RepastEntity *)repastEntity;

@end
