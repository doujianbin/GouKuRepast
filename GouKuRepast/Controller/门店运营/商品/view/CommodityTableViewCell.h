//
//  CommodityTableViewCell.h
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/9.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommodityFromCodeEntity.h"
#import "RepastEntity.h"

@interface CommodityTableViewCell : UITableViewCell

@property (nonatomic ,strong)UIImageView     *img_CommodityHeadPic;        // 商品头像
@property (nonatomic ,strong)UILabel         *lab_CommodityStatus;         // 商品状态
@property (nonatomic ,strong)UILabel         *lab_CommodityName;           // 商品名称
@property (nonatomic ,strong)UILabel         *lab_CommodityStock;          // 商品库存
@property (nonatomic ,strong)UILabel         *lab_CommoditySalesVolume;    // 商品销量
@property (nonatomic ,strong)UILabel         *lab_CommodityPrice;          // 商品价格
@property (nonatomic ,strong)UIButton        *btn_edit;                    // 编辑按钮
@property (nonatomic ,strong)UIButton        *btn_more;                    // ...按钮
@property (nonatomic ,strong)UIImageView     *img_line;

- (void)contentCellWithCommodityInformationEntity:(RepastEntity *)commodityInformationEntity;

//门店布局
- (void)contentCellInShopWithCommodityInformationEntity:(CommodityFromCodeEntity *)commodityInformationEntity;

//网店布局
- (void)contentCellInNetShopWithCommodityInformationEntity:(CommodityFromCodeEntity *)commodityInformationEntity;
@end
