//
//  MaterialsTableViewCell.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaterialsTableViewCell : UITableViewCell

@property (nonatomic ,strong)UILabel         *lb_title;
@property (nonatomic ,strong)UIImageView     *iv_arrow;
@property (nonatomic ,strong)UIImageView     *img_line;

- (void)contentCellWithDic:(NSDictionary *)dic;

- (void)contentCellWithBrandDic:(NSDictionary *)dic;

@end
