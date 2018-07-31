//
//  CommodityWeightUnitView.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommodityWeightUnitView.h"

@implementation CommodityWeightUnitView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *iv_back = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 108, 162)];
        [iv_back setImage:[UIImage imageNamed:@"weightUnit"]];
        [self addSubview:iv_back];
        
        for (int i = 0; i < 4; i++) {
            self.btn_weightUnit = [[UIButton alloc]initWithFrame:CGRectMake(0,8 + 38 * i, 108, 38)];
            [self addSubview:self.btn_weightUnit];
            self.btn_weightUnit.tag = i;
            [self.btn_weightUnit setBackgroundColor:[UIColor clearColor]];
            [self.btn_weightUnit addTarget:self action:@selector(selectWeightUnit:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    return self;
}

- (void)selectWeightUnit:(UIButton *)btn_sender{
    NSString *str_unit = @"";
    if (btn_sender.tag == 0) {
        str_unit = @"克(g)";
    }else if (btn_sender.tag == 1){
       str_unit = @"千克(kg)";
    }else if (btn_sender.tag == 2){
        str_unit = @"毫升(ml)";
    }else if (btn_sender.tag == 3){
        str_unit = @"升(L)";
    }
    if (self.selectWeightUnit) {
        self.selectWeightUnit(str_unit);
    }
}

@end
