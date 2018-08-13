//
//  ShopOrderAutoTalkingOrderView.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "ShopOrderAutoTalkingOrderView.h"

@implementation ShopOrderAutoTalkingOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.lb_title = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 156, 12, 80, 26)];
        [self addSubview:self.lb_title];
        [self.lb_title setText:@"自动接单"];
        [self.lb_title setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        [self.lb_title setFont:[UIFont systemFontOfSize:18]];
        [self.lb_title setTextAlignment:NSTextAlignmentRight];
        
        self.switch_autoTalking = [[UISwitch alloc]initWithFrame:CGRectMake(self.lb_title.right - 12, 4, 51, 31)];
        [self addSubview:self.switch_autoTalking];
        [self.switch_autoTalking setOnTintColor:[UIColor colorWithHexString:COLOR_BLUE_MAIN]];
        self.switch_autoTalking.layer.anchorPoint = CGPointMake(0, 0.3);
    }
    return self;
}

@end
