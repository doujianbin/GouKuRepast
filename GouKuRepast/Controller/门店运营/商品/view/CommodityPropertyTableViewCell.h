//
//  CommodityPropertyTableViewCell.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttributesEntity.h"

typedef void(^DeleteProperty)(NSInteger  index);
@interface CommodityPropertyTableViewCell : UITableViewCell

@property (nonatomic ,strong) UITextField       *tf_propertyName;
@property (nonatomic ,strong) UITextField       *tf_property;
@property (nonatomic ,strong) UIButton          *btn_addProperty;
@property (nonatomic ,strong) UIView            *v_propertyDetail;
@property (nonatomic ,strong) UIImageView       *img_line;
@property (nonatomic ,strong) UIButton          *lastBtn;
@property (nonatomic ,strong) NSMutableArray    *arr_btn;
@property (nonatomic ,strong) UIView            *v_gray;

- (void)contentCellWithAttributesEntity:(AttributesEntity *)attributesEntity;
@property (nonatomic,copy)DeleteProperty      deleteProperty;
@end
