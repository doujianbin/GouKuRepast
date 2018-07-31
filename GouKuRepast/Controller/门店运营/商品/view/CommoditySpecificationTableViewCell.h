//
//  CommoditySpecificationTableViewCell.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StandardsEntity.h"

@interface CommoditySpecificationTableViewCell : UITableViewCell

@property (nonatomic ,strong) UITextField           *tf_guigeName;
@property (nonatomic ,strong) UITextField           *tf_guigeDescrib;
@property (nonatomic ,strong) UIImageView           *iv_guigePic;
@property (nonatomic ,strong) UITextField           *tf_guigeWeight;
@property (nonatomic ,strong) UIButton              *btn_guigeUnit;
@property (nonatomic ,strong) UISwitch              *switch_Inventory;   //库存
@property (nonatomic ,strong) UILabel               *lb_inventoryT;
@property (nonatomic ,strong) UITextField           *tf_inventory;
@property (nonatomic ,strong) UILabel               *lb_inventory_xing;
@property (nonatomic ,strong) UISwitch              *switch_inStore;     //是否堂食
@property (nonatomic ,strong) UILabel               *lb_tangshiT;
@property (nonatomic ,strong) UILabel               *lb_tangshiT_xing;
@property (nonatomic ,strong) UITextField           *tf_inStorePrice;
@property (nonatomic ,strong) UISwitch              *switch_waimai;      //是否外卖
@property (nonatomic ,strong) UILabel               *lb_waimaiT;
@property (nonatomic ,strong) UILabel               *lb_waimaiT_xing;
@property (nonatomic ,strong) UITextField           *tf_waimaiPrice;
@property (nonatomic ,strong) UITextField           *tf_baozhuangPrice;  //包装价格
@property (nonatomic ,strong) UITextField           *tf_baozhuangNum;    //包装数量
@property (nonatomic ,strong) UIView                *v_gray;

- (void)contentCellWithStandardsEntity:(StandardsEntity *)standardsEntity;

@end
