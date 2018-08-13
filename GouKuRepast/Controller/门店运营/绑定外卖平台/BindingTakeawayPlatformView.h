//
//  BindingTakeawayPlatformView.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BindingTakeawayPlatformView : UIView

@property (nonatomic ,strong)UIImageView    *img_eleme;
@property (nonatomic ,strong)UIImageView    *img_meituan;
@property (nonatomic ,strong)UILabel        *lb_eleme_title;
@property (nonatomic ,strong)UILabel        *lb_meituan_title;
@property (nonatomic ,strong)UILabel        *lb_eleme_detail;
@property (nonatomic ,strong)UILabel        *lb_meituan_detail;

@property (nonatomic ,strong)UIButton       *btn_eleme;
@property (nonatomic ,strong)UIButton       *btn_meituan;

@end
