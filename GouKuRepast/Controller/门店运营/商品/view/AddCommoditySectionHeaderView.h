//
//  AddCommoditySectionHeaderView.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/19.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCommoditySectionHeaderView : UIView

@property (nonatomic ,strong) UILabel     *lb_sectionTitle;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;
@end
