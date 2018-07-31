//
//  AddCommoditySectionHeaderView.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/19.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "AddCommoditySectionHeaderView.h"

@implementation AddCommoditySectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        
        self.lb_sectionTitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 17, SCREEN_WIDTH - 30, 22)];
        [self addSubview:self.lb_sectionTitle];
        [self.lb_sectionTitle setFont:[UIFont systemFontOfSize:16]];
        [self.lb_sectionTitle setText:title];
        [self.lb_sectionTitle setTextColor:[UIColor colorWithHexString:@"#979797"]];
        
    }
    return self;
}


@end
