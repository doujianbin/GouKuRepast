//
//  ShopPriceDetailView.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/6/8.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "ShopPriceDetailView.h"

@implementation ShopPriceDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithHexString:@"#000000" alpha:0.5]];
        
        self.v_back = [[UIView alloc]init];
        [self addSubview:self.v_back];
        [self.v_back setBackgroundColor:[UIColor whiteColor]];
        self.v_back.layer.cornerRadius = 12;
        
        
        self.lab_title = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_title];
        self.lab_title.textAlignment = NSTextAlignmentCenter;
        [self.lab_title setText:@"本单收入"];
        [self.lab_title setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_title setFont:[UIFont systemFontOfSize:17]];
        [self.lab_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.mas_equalTo(27);
            make.height.mas_equalTo(24);
        }];
        
        self.lab_totalPrice = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_totalPrice];
        [self.lab_totalPrice setText:@"商品总价(含配送费)"];
        [self.lab_totalPrice setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_totalPrice setFont:[UIFont systemFontOfSize:17]];
        [self.lab_totalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_title.mas_bottom).offset(50);
            make.height.mas_equalTo(24);
        }];
        
        
        self.lab_youhui = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_youhui];
        [self.lab_youhui setText:@"商家承担优惠"];
        [self.lab_youhui setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_youhui setFont:[UIFont systemFontOfSize:17]];
        self.lab_youhui.clipsToBounds = YES;
        [self.lab_youhui mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_totalPrice.mas_bottom).offset(16);
            make.height.mas_equalTo(24);
        }];
        
        self.lab_fuwu = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_fuwu];
        [self.lab_fuwu setText:@"服务费"];
        [self.lab_fuwu setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_fuwu setFont:[UIFont systemFontOfSize:17]];
        self.lab_fuwu.clipsToBounds = YES;
        [self.lab_fuwu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_youhui.mas_bottom).offset(16);
            make.height.mas_equalTo(24);
        }];
        
        self.lab_peisong = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_peisong];
        [self.lab_peisong setText:@"配送费"];
        [self.lab_peisong setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_peisong setFont:[UIFont systemFontOfSize:17]];
        self.lab_peisong.clipsToBounds = YES;
        [self.lab_peisong mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_fuwu.mas_bottom).offset(16);
            make.height.mas_equalTo(24);
        }];
        
        self.lab_shouru = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_shouru];
        [self.lab_shouru setText:@"本单预计收入"];
        [self.lab_shouru setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_shouru setFont:[UIFont boldSystemFontOfSize:17]];
        [self.lab_shouru mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_peisong.mas_bottom).offset(16);
            make.height.mas_equalTo(24);
        }];
        
        
        self.lab_totalPriceDetail = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_totalPriceDetail];
        [self.lab_totalPriceDetail setTextAlignment:NSTextAlignmentRight];
        [self.lab_totalPriceDetail setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_totalPriceDetail setFont:[UIFont systemFontOfSize:17]];
        [self.lab_totalPriceDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_totalPrice.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_totalPrice);
        }];
        
        self.lab_youhuiDetail = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_youhuiDetail];
        [self.lab_youhuiDetail setTextAlignment:NSTextAlignmentRight];
        [self.lab_youhuiDetail setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_youhuiDetail setFont:[UIFont systemFontOfSize:17]];
        [self.lab_youhuiDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_youhui.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_youhui);
        }];
        
        self.lab_fuwuDetail = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_fuwuDetail];
        [self.lab_fuwuDetail setTextAlignment:NSTextAlignmentRight];
        [self.lab_fuwuDetail setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_fuwuDetail setFont:[UIFont systemFontOfSize:17]];
        [self.lab_fuwuDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_fuwu.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_fuwu);
        }];
        
        self.lab_peisongDetail = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_peisongDetail];
        [self.lab_peisongDetail setTextAlignment:NSTextAlignmentRight];
        [self.lab_peisongDetail setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_peisongDetail setFont:[UIFont systemFontOfSize:17]];
        [self.lab_peisongDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_peisong.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_peisong);
        }];
        
        self.lab_shouruDetail = [[UILabel alloc]init];
        [self.v_back addSubview:self.lab_shouruDetail];
        self.lab_shouruDetail.clipsToBounds = YES;
        [self.lab_shouruDetail setTextAlignment:NSTextAlignmentRight];
        [self.lab_shouruDetail setTextColor:[UIColor colorWithHexString:@"#030303"]];
        [self.lab_shouruDetail setFont:[UIFont boldSystemFontOfSize:17]];
        [self.lab_shouruDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_shouru.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_shouru);
        }];
        
        self.img_line = [[UIImageView alloc]init];
        [self.v_back addSubview:self.img_line];
        [self.img_line setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        [self.img_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.equalTo(self.lab_shouru.mas_bottom).offset(23.5);
            make.width.equalTo(self.v_back);
            make.height.mas_equalTo(0.5);
        }];
        
        self.btn_sure = [[UIButton alloc]init];
        [self.v_back addSubview:self.btn_sure];
        [self.btn_sure setTitle:@"确定" forState:UIControlStateNormal];
        [self.btn_sure setTitleColor:[UIColor colorWithHexString:@"#2281D2"] forState:UIControlStateNormal];
        self.btn_sure.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.btn_sure addTarget:self action:@selector(hideAction) forControlEvents:UIControlEventTouchUpInside];
        [self.btn_sure mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.img_line.mas_bottom);
            make.width.equalTo(self.v_back);
            make.height.mas_equalTo(44);
        }];
        
        [self.v_back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.mas_equalTo(270);
            make.bottom.equalTo(self.btn_sure.mas_bottom);
        }];
        
    }
    return self;
}

- (void)contentViewWithPurchaseOrderEntity:(PurchaseOrderEntity *)purchaseOrderEntity{
    self.lab_totalPriceDetail.text = [NSString stringWithFormat:@"¥%.2f",purchaseOrderEntity.payTotal];
    self.lab_youhuiDetail.text = [NSString stringWithFormat:@"-¥%.2f",purchaseOrderEntity.payReduce];
    self.lab_fuwuDetail.text = [NSString stringWithFormat:@"-¥%.2f",purchaseOrderEntity.payService];
    self.lab_shouruDetail.text = [NSString stringWithFormat:@"¥%.2f",purchaseOrderEntity.payActual];
    if ([purchaseOrderEntity.orderShippingType intValue] == 2) {
        //显示配送费
        
        [self.lab_peisong setHidden:NO];
        [self.lab_peisongDetail setHidden:NO];
        self.lab_peisongDetail.text = [NSString stringWithFormat:@"-¥%.2f",purchaseOrderEntity.payFreight];
        
        [self.lab_shouru mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_peisong.mas_bottom).offset(16);
            make.height.mas_equalTo(24);
        }];
        [self.lab_shouruDetail mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_shouru.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_shouru);
        }];
        
    }else{
        [self.lab_peisong setHidden:YES];
        [self.lab_peisongDetail setHidden:YES];
        [self.lab_shouru mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(14);
            make.top.equalTo(self.lab_fuwu.mas_bottom).offset(16);
            make.height.mas_equalTo(24);
        }];
        [self.lab_shouruDetail mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_shouru.mas_right);
            make.right.equalTo(self.v_back.mas_right).offset(-14);
            make.top.height.equalTo(self.lab_shouru);
        }];
    }
}

- (void)hideAction{
    [self setHidden:YES];
}

@end
