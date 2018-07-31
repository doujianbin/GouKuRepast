//
//  SettlementView.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/28.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SettlementView.h"

@implementation SettlementView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //购酷
        self.v_gouku_Back = [[UIView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 173)];
        [self addSubview:self.v_gouku_Back];
        [self.v_gouku_Back setBackgroundColor:[UIColor colorWithHexString:@"#5B99E2"]];
        
        self.lab_gouku_title = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, 120, 25)];
        [self.v_gouku_Back addSubview:self.lab_gouku_title];
        [self.lab_gouku_title setText:@"堂食  购酷支付"];
        [self.lab_gouku_title setTextColor:[UIColor whiteColor]];
        [self.lab_gouku_title setFont:[UIFont boldSystemFontOfSize:18]];
        
        self.lab_gouku_zhouqi = [[UILabel alloc]initWithFrame:CGRectMake(self.lab_gouku_title.right + 20, 14, 100, 20)];
        [self.v_gouku_Back addSubview:self.lab_gouku_zhouqi];
        [self.lab_gouku_zhouqi setText:@"结算周期1天"];
        [self.lab_gouku_zhouqi setTextColor:[UIColor whiteColor]];
        [self.lab_gouku_zhouqi setFont:[UIFont systemFontOfSize:14]];
        
        self.img_gouku_line1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 41, SCREEN_WIDTH - 15, 1)];
        [self.v_gouku_Back addSubview:self.img_gouku_line1];
        [self.img_gouku_line1 setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.img_gouku_line2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 107, SCREEN_WIDTH - 15, 1)];
        [self.v_gouku_Back addSubview:self.img_gouku_line2];
        [self.img_gouku_line2 setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.lab_gouku_balance = [[UILabel alloc]initWithFrame:CGRectMake(15, 53, 90, 20)];
        [self.v_gouku_Back addSubview:self.lab_gouku_balance];
        [self.lab_gouku_balance setText:@"可提现余额"];
        [self.lab_gouku_balance setTextColor:[UIColor whiteColor]];
        [self.lab_gouku_balance setFont:[UIFont systemFontOfSize:14]];
        
        self.lab_gouku_balanceT = [[UILabel alloc]initWithFrame:CGRectMake(15, 78, 150, 22)];
        [self.v_gouku_Back addSubview:self.lab_gouku_balanceT];
        [self.lab_gouku_balanceT setTextColor:[UIColor whiteColor]];
        [self.lab_gouku_balanceT setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.lab_gouku_jiesuan = [[UILabel alloc]initWithFrame:CGRectMake(15, 119, 90, 20)];
        [self.v_gouku_Back addSubview:self.lab_gouku_jiesuan];
        [self.lab_gouku_jiesuan setText:@"待对账金额"];
        [self.lab_gouku_jiesuan setTextColor:[UIColor whiteColor]];
        [self.lab_gouku_jiesuan setFont:[UIFont systemFontOfSize:14]];
        
        self.lab_gouku_jiesuanT = [[UILabel alloc]initWithFrame:CGRectMake(15, 141, 150, 22)];
        [self.v_gouku_Back addSubview:self.lab_gouku_jiesuanT];
        [self.lab_gouku_jiesuanT setTextColor:[UIColor whiteColor]];
        [self.lab_gouku_jiesuanT setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.btn_gouku_tixian = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 65, 60, 65, 30)];
        [self.v_gouku_Back addSubview:self.btn_gouku_tixian];
        [self.btn_gouku_tixian setTitle:@"提现" forState:UIControlStateNormal];
        [self.btn_gouku_tixian setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [self.btn_gouku_tixian setBackgroundColor:[UIColor clearColor]];
        self.btn_gouku_tixian.titleLabel.font = [UIFont systemFontOfSize:14];
        self.btn_gouku_tixian.layer.cornerRadius = 3.0f;
        self.btn_gouku_tixian.layer.masksToBounds = YES;
        self.btn_gouku_tixian.layer.borderWidth = 0.8f;
        self.btn_gouku_tixian.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        
        self.btn_gouku_mingxi = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 65, 126, 65, 30)];
        [self.v_gouku_Back addSubview:self.btn_gouku_mingxi];
        [self.btn_gouku_mingxi setTitle:@"余额明细" forState:UIControlStateNormal];
        [self.btn_gouku_mingxi setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [self.btn_gouku_mingxi setBackgroundColor:[UIColor clearColor]];
        self.btn_gouku_mingxi.titleLabel.font = [UIFont systemFontOfSize:14];
        self.btn_gouku_mingxi.layer.cornerRadius = 3.0f;
        self.btn_gouku_mingxi.layer.masksToBounds = YES;
        self.btn_gouku_mingxi.layer.borderWidth = 0.8f;
        self.btn_gouku_mingxi.layer.borderColor = [[UIColor whiteColor] CGColor];

        //饿了么
        self.v_eleme_Back = [[UIView alloc]initWithFrame:CGRectMake(0, self.v_gouku_Back.bottom + 10, SCREEN_WIDTH, 173)];
        [self addSubview:self.v_eleme_Back];
        [self.v_eleme_Back setBackgroundColor:[UIColor colorWithHexString:@"#5B99E2"]];
        
        self.lab_eleme_title = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, 60, 25)];
        [self.v_eleme_Back addSubview:self.lab_eleme_title];
        [self.lab_eleme_title setText:@"饿了么"];
        [self.lab_eleme_title setTextColor:[UIColor whiteColor]];
        [self.lab_eleme_title setFont:[UIFont boldSystemFontOfSize:18]];
        
        self.lab_eleme_zhouqi = [[UILabel alloc]initWithFrame:CGRectMake(99, 14, 100, 20)];
        [self.v_eleme_Back addSubview:self.lab_eleme_zhouqi];
        [self.lab_eleme_zhouqi setText:@"结算周期3天"];
        [self.lab_eleme_zhouqi setTextColor:[UIColor whiteColor]];
        [self.lab_eleme_zhouqi setFont:[UIFont systemFontOfSize:14]];
        
        self.img_eleme_line1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 41, SCREEN_WIDTH - 15, 1)];
        [self.v_eleme_Back addSubview:self.img_eleme_line1];
        [self.img_eleme_line1 setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.img_eleme_line2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 107, SCREEN_WIDTH - 15, 1)];
        [self.v_eleme_Back addSubview:self.img_eleme_line2];
        [self.img_eleme_line2 setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.lab_eleme_balance = [[UILabel alloc]initWithFrame:CGRectMake(15, 53, 90, 20)];
        [self.v_eleme_Back addSubview:self.lab_eleme_balance];
        [self.lab_eleme_balance setText:@"可提现余额"];
        [self.lab_eleme_balance setTextColor:[UIColor whiteColor]];
        [self.lab_eleme_balance setFont:[UIFont systemFontOfSize:14]];
        
        self.lab_eleme_balanceT = [[UILabel alloc]initWithFrame:CGRectMake(15, 78, 150, 22)];
        [self.v_eleme_Back addSubview:self.lab_eleme_balanceT];
        [self.lab_eleme_balanceT setTextColor:[UIColor whiteColor]];
        [self.lab_eleme_balanceT setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.lab_eleme_jiesuan = [[UILabel alloc]initWithFrame:CGRectMake(15, 119, 90, 20)];
        [self.v_eleme_Back addSubview:self.lab_eleme_jiesuan];
        [self.lab_eleme_jiesuan setText:@"待对账金额"];
        [self.lab_eleme_jiesuan setTextColor:[UIColor whiteColor]];
        [self.lab_eleme_jiesuan setFont:[UIFont systemFontOfSize:14]];
        
        self.lab_eleme_jiesuanT = [[UILabel alloc]initWithFrame:CGRectMake(15, 141, 150, 22)];
        [self.v_eleme_Back addSubview:self.lab_eleme_jiesuanT];
        [self.lab_eleme_jiesuanT setTextColor:[UIColor whiteColor]];
        [self.lab_eleme_jiesuanT setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.btn_eleme_tixian = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 65, 60, 65, 30)];
        [self.v_eleme_Back addSubview:self.btn_eleme_tixian];
        [self.btn_eleme_tixian setTitle:@"提现" forState:UIControlStateNormal];
        [self.btn_eleme_tixian setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [self.btn_eleme_tixian setBackgroundColor:[UIColor clearColor]];
        self.btn_eleme_tixian.titleLabel.font = [UIFont systemFontOfSize:14];
        self.btn_eleme_tixian.layer.cornerRadius = 3.0f;
        self.btn_eleme_tixian.layer.masksToBounds = YES;
        self.btn_eleme_tixian.layer.borderWidth = 0.8f;
        self.btn_eleme_tixian.layer.borderColor = [[UIColor whiteColor] CGColor];

        
        self.btn_eleme_mingxi = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 65, 126, 65, 30)];
        [self.v_eleme_Back addSubview:self.btn_eleme_mingxi];
        [self.btn_eleme_mingxi setTitle:@"余额明细" forState:UIControlStateNormal];
        [self.btn_eleme_mingxi setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [self.btn_eleme_mingxi setBackgroundColor:[UIColor clearColor]];
        self.btn_eleme_mingxi.titleLabel.font = [UIFont systemFontOfSize:14];
        self.btn_eleme_mingxi.layer.cornerRadius = 3.0f;
        self.btn_eleme_mingxi.layer.masksToBounds = YES;
        self.btn_eleme_mingxi.layer.borderWidth = 0.8f;
        self.btn_eleme_mingxi.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        
        //美团
        self.v_meituan_Back = [[UIView alloc]initWithFrame:CGRectMake(0, self.v_eleme_Back.bottom + 10, SCREEN_WIDTH, 173)];
        [self addSubview:self.v_meituan_Back];
        [self.v_meituan_Back setBackgroundColor:[UIColor colorWithHexString:@"#5B99E2"]];
        
        self.lab_meituan_title = [[UILabel alloc]initWithFrame:CGRectMake(15, 11, 60, 25)];
        [self.v_meituan_Back addSubview:self.lab_meituan_title];
        [self.lab_meituan_title setText:@"美团"];
        [self.lab_meituan_title setTextColor:[UIColor whiteColor]];
        [self.lab_meituan_title setFont:[UIFont boldSystemFontOfSize:18]];
        
        self.lab_meituan_zhouqi = [[UILabel alloc]initWithFrame:CGRectMake(99, 14, 100, 20)];
        [self.v_meituan_Back addSubview:self.lab_meituan_zhouqi];
        [self.lab_meituan_zhouqi setText:@"结算周期3天"];
        [self.lab_meituan_zhouqi setTextColor:[UIColor whiteColor]];
        [self.lab_meituan_zhouqi setFont:[UIFont systemFontOfSize:14]];
        
        self.img_meituan_line1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 41, SCREEN_WIDTH - 15, 1)];
        [self.v_meituan_Back addSubview:self.img_meituan_line1];
        [self.img_meituan_line1 setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.img_meituan_line2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 107, SCREEN_WIDTH - 15, 1)];
        [self.v_meituan_Back addSubview:self.img_meituan_line2];
        [self.img_meituan_line2 setBackgroundColor:[UIColor colorWithHexString:@"#FFFFFF"]];
        
        self.lab_meituan_balance = [[UILabel alloc]initWithFrame:CGRectMake(15, 53, 90, 20)];
        [self.v_meituan_Back addSubview:self.lab_meituan_balance];
        [self.lab_meituan_balance setText:@"可提现余额"];
        [self.lab_meituan_balance setTextColor:[UIColor whiteColor]];
        [self.lab_meituan_balance setFont:[UIFont systemFontOfSize:14]];
        
        self.lab_meituan_balanceT = [[UILabel alloc]initWithFrame:CGRectMake(15, 78, 150, 22)];
        [self.v_meituan_Back addSubview:self.lab_meituan_balanceT];
        [self.lab_meituan_balanceT setTextColor:[UIColor whiteColor]];
        [self.lab_meituan_balanceT setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.lab_meituan_jiesuan = [[UILabel alloc]initWithFrame:CGRectMake(15, 119, 90, 20)];
        [self.v_meituan_Back addSubview:self.lab_meituan_jiesuan];
        [self.lab_meituan_jiesuan setText:@"待对账金额"];
        [self.lab_meituan_jiesuan setTextColor:[UIColor whiteColor]];
        [self.lab_meituan_jiesuan setFont:[UIFont systemFontOfSize:14]];
        
        self.lab_meituan_jiesuanT = [[UILabel alloc]initWithFrame:CGRectMake(15, 141, 150, 22)];
        [self.v_meituan_Back addSubview:self.lab_meituan_jiesuanT];
        [self.lab_meituan_jiesuanT setTextColor:[UIColor whiteColor]];
        [self.lab_meituan_jiesuanT setFont:[UIFont boldSystemFontOfSize:20]];
        
        self.btn_meituan_tixian = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 65, 60, 65, 30)];
        [self.v_meituan_Back addSubview:self.btn_meituan_tixian];
        [self.btn_meituan_tixian setTitle:@"提现" forState:UIControlStateNormal];
        [self.btn_meituan_tixian setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [self.btn_meituan_tixian setBackgroundColor:[UIColor clearColor]];
        self.btn_meituan_tixian.titleLabel.font = [UIFont systemFontOfSize:14];
        self.btn_meituan_tixian.layer.cornerRadius = 3.0f;
        self.btn_meituan_tixian.layer.masksToBounds = YES;
        self.btn_meituan_tixian.layer.borderWidth = 0.8f;
        self.btn_meituan_tixian.layer.borderColor = [[UIColor whiteColor] CGColor];
        
        
        self.btn_meituan_mingxi = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 65, 126, 65, 30)];
        [self.v_meituan_Back addSubview:self.btn_meituan_mingxi];
        [self.btn_meituan_mingxi setTitle:@"余额明细" forState:UIControlStateNormal];
        [self.btn_meituan_mingxi setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        [self.btn_meituan_mingxi setBackgroundColor:[UIColor clearColor]];
        self.btn_meituan_mingxi.titleLabel.font = [UIFont systemFontOfSize:14];
        self.btn_meituan_mingxi.layer.cornerRadius = 3.0f;
        self.btn_meituan_mingxi.layer.masksToBounds = YES;
        self.btn_meituan_mingxi.layer.borderWidth = 0.8f;
        self.btn_meituan_mingxi.layer.borderColor = [[UIColor whiteColor] CGColor];
        
    }
    return self;
}

@end
