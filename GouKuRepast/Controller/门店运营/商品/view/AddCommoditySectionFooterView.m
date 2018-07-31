//
//  AddCommoditySectionFooterView.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/19.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "AddCommoditySectionFooterView.h"

@implementation AddCommoditySectionFooterView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.btn_action = [[UIButton alloc]initWithFrame:frame];
        [self addSubview:self.btn_action];
        [self.btn_action setTitle:title forState:UIControlStateNormal];
        [self.btn_action setTitleColor:[UIColor colorWithHexString:@"#4167B2"] forState:UIControlStateNormal];
        self.btn_action.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.btn_action setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

@end
