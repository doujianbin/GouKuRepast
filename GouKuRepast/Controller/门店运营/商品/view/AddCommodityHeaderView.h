//
//  AddCommodityHeaderView.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCommodityHeaderView : UIView

@property (nonatomic ,strong) UILabel         *lb_barcode;
@property (nonatomic ,strong) UITextField     *tf_barcode;
@property (nonatomic ,strong) UIButton        *btn_saomiao;
@property (nonatomic ,strong) UIButton        *btn_search;
@property (nonatomic ,strong) UIButton        *btn_haveBarcode;
@property (nonatomic ,strong) UIButton        *btn_notHaveBarcode;
@property (nonatomic ,strong) UIImageView     *img_midLine;


@end
