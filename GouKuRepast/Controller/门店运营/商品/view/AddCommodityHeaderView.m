//
//  AddCommodityHeaderView.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "AddCommodityHeaderView.h"

@implementation AddCommodityHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setClipsToBounds:YES];
        
        UIView *v_header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        [self addSubview:v_header];
        [v_header setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        
        self.lb_barcode = [[UILabel alloc]initWithFrame:CGRectMake(15, 11 + 10, 50, 22)];
        [self addSubview:self.lb_barcode];
        [self.lb_barcode setText:@"条形码"];
        [self.lb_barcode setTextColor:[UIColor blackColor]];
        [self.lb_barcode setFont:[UIFont systemFontOfSize:16]];
        
        self.btn_notHaveBarcode = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 69.5 - 10, 10 + 10, 69.5, 22)];
        [self addSubview:self.btn_notHaveBarcode];
        [self.btn_notHaveBarcode setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self.btn_notHaveBarcode setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateSelected];
        [self.btn_notHaveBarcode setTitle:@"无条码" forState:UIControlStateNormal];
        [self.btn_notHaveBarcode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btn_notHaveBarcode.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.btn_notHaveBarcode setImageEdgeInsets:UIEdgeInsetsMake(0.0, -2.5, 0.0, 0.0)];
        
        self.btn_haveBarcode = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 69.5 - 95, 10 + 10, 69.5, 22)];
        [self addSubview:self.btn_haveBarcode];
        [self.btn_haveBarcode setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self.btn_haveBarcode setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateSelected];
        [self.btn_haveBarcode setTitle:@"有条码" forState:UIControlStateNormal];
        [self.btn_haveBarcode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btn_haveBarcode.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.btn_haveBarcode setImageEdgeInsets:UIEdgeInsetsMake(0.0, -2.5, 0.0, 0.0)];
        
        self.img_midLine = [[UIImageView alloc]initWithFrame:CGRectMake(15, 44 + 10, SCREEN_WIDTH - 15 - 152, 0.5)];
        [self addSubview:self.img_midLine];
        [self.img_midLine setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        
        self.tf_barcode = [[UITextField alloc]initWithFrame:CGRectMake(15, 55 + 10, SCREEN_WIDTH - 15 - 10 - 152, 22)];
        [self addSubview:self.tf_barcode];
        [self.tf_barcode setPlaceholder:@"手动输入商品条形码"];
        self.tf_barcode.font = [UIFont systemFontOfSize:16];
        self.tf_barcode.textColor = [UIColor blackColor];
        self.tf_barcode.keyboardType = UIKeyboardTypeNumberPad;
        
        self.btn_search = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 152, 44 + 10, 60, 44)];
        [self addSubview:self.btn_search];
        [self.btn_search setBackgroundColor:[UIColor colorWithHexString:@"#F9B048"]];
        [self.btn_search setTitle:@"搜索" forState:UIControlStateNormal];
        self.btn_search.titleLabel.font = [UIFont systemFontOfSize:12];
        self.btn_search.titleLabel.textColor = [UIColor whiteColor];
        
        self.btn_saomiao = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 92, 44 + 10, 92, 44)];
        [self addSubview:self.btn_saomiao];
        [self.btn_saomiao setBackgroundColor:[UIColor colorWithHexString:@"#4167B2"]];
        [self.btn_saomiao setTitle:@"扫描条码" forState:UIControlStateNormal];
        self.btn_saomiao.titleLabel.font = [UIFont systemFontOfSize:12];
        self.btn_saomiao.titleLabel.textColor = [UIColor whiteColor];
       
    }
    return self;
}


@end
