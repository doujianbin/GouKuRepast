//
//  AutoTalkingBtn.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "AutoTalkingBtn.h"

@implementation AutoTalkingBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.lb_1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH - 30, 49)];
        [self addSubview:self.lb_1];
        [self.lb_1 setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        [self.lb_1 setFont:[UIFont systemFontOfSize:17]];
        
        self.lb_2 = [[UILabel alloc]initWithFrame:CGRectMake(15, 60, SCREEN_WIDTH - 30, 23)];
        [self addSubview:self.lb_2];
        [self.lb_2 setTextColor:[UIColor colorWithHexString:@"#BBBBBB"]];
        [self.lb_2 setFont:[UIFont systemFontOfSize:14]];
        [self.lb_2 setText:@"前往“待配送”页面查看详情"];
        
        self.iv_arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 30, 34, 24, 24)];
        [self addSubview:self.iv_arrow];
        [self.iv_arrow setImage:[UIImage imageNamed:@"triangle_right"]];
    }
    return self;
}

@end
