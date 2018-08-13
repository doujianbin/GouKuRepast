//
//  BindingTakeawayPlatformView.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BindingTakeawayPlatformView.h"

@implementation BindingTakeawayPlatformView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.img_eleme = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self addSubview:self.img_eleme];
        [self.img_eleme setImage:[UIImage imageNamed:@"eleme"]];
        
        self.lb_eleme_title = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, SCREEN_WIDTH - 80, 23)];
        [self addSubview:self.lb_eleme_title];
        [self.lb_eleme_title setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        [self.lb_eleme_title setFont:[UIFont systemFontOfSize:14]];
        
        self.lb_eleme_detail = [[UILabel alloc]initWithFrame:CGRectMake(70, self.lb_eleme_title.bottom + 9, SCREEN_WIDTH - 80, 23)];
        [self addSubview:self.lb_eleme_detail];
        [self.lb_eleme_detail setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        [self.lb_eleme_detail setFont:[UIFont systemFontOfSize:14]];
        
        UIImageView *img_eleme_arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 24 - 15, 23, 24, 24)];
        [self addSubview:img_eleme_arrow];
        [img_eleme_arrow setImage:[UIImage imageNamed:@"triangle_right"]];
        
        UIImageView *img_eleme_line = [[UIImageView alloc]initWithFrame:CGRectMake(15, self.img_eleme.bottom + 9.5, SCREEN_WIDTH - 15, 0.5)];
        [self addSubview:img_eleme_line];
        
        
        self.img_meituan = [[UIImageView alloc]initWithFrame:CGRectMake(10, img_eleme_line.bottom + 10, 50, 50)];
        [self addSubview:self.img_meituan];
        [self.img_meituan setImage:[UIImage imageNamed:@"meituan"]];
        
        self.lb_meituan_title = [[UILabel alloc]initWithFrame:CGRectMake(70, img_eleme_line.bottom + 5, SCREEN_WIDTH - 80, 23)];
        [self addSubview:self.lb_meituan_title];
        [self.lb_meituan_title setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        [self.lb_meituan_title setFont:[UIFont systemFontOfSize:14]];
        
        self.lb_meituan_detail = [[UILabel alloc]initWithFrame:CGRectMake(70, self.lb_meituan_title.bottom + 9, SCREEN_WIDTH - 80, 23)];
        [self addSubview:self.lb_meituan_detail];
        [self.lb_meituan_detail setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        [self.lb_meituan_detail setFont:[UIFont systemFontOfSize:14]];
        
        UIImageView *img_meituan_arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 24 - 15, 23 + 70, 24, 24)];
        [self addSubview:img_meituan_arrow];
        [img_meituan_arrow setImage:[UIImage imageNamed:@"triangle_right"]];
        
        UIImageView *img_meituan_line = [[UIImageView alloc]initWithFrame:CGRectMake(15, self.img_meituan.bottom + 9.5, SCREEN_WIDTH - 15, 0.5)];
        [self addSubview:img_meituan_line];
        
        self.btn_eleme = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
        [self addSubview:self.btn_eleme];
        [self.btn_eleme setBackgroundColor:[UIColor clearColor]];
        
        self.btn_meituan = [[UIButton alloc]initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 70)];
        [self addSubview:self.btn_meituan];
        [self.btn_meituan setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

@end
