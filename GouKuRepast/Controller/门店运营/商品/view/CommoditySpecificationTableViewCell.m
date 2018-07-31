//
//  CommoditySpecificationTableViewCell.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommoditySpecificationTableViewCell.h"

@implementation CommoditySpecificationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor whiteColor];
        UILabel *lb_name = [[UILabel alloc]init];
        [self.contentView addSubview:lb_name];
        [lb_name setText:@"规格名称"];
        [lb_name setTextColor:[UIColor blackColor]];
        [lb_name setFont:[UIFont systemFontOfSize:16]];
        [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        UILabel *lb_name_xing = [[UILabel alloc]init];
        [self.contentView addSubview:lb_name_xing];
        [lb_name_xing setText:@"*"];
        [lb_name_xing setTextColor:[UIColor colorWithHexString:@"D0021B"]];
        [lb_name_xing setFont:[UIFont systemFontOfSize:16]];
        [lb_name_xing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lb_name.mas_right).offset(5.3);
            make.top.height.equalTo(lb_name);
        }];
        
        self.tf_guigeName = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_guigeName];
        [self.tf_guigeName setPlaceholder:@"请填写规格名称"];
        [self.tf_guigeName setTextColor:[UIColor blackColor]];
        [self.tf_guigeName setFont:[UIFont systemFontOfSize:16]];
        [self.tf_guigeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        
        UIImageView *img_line1 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line1];
        [img_line1 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(43.5);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //描述
        UILabel *lb_describ = [[UILabel alloc]init];
        [self.contentView addSubview:lb_describ];
        [lb_describ setText:@"规格描述"];
        [lb_describ setTextColor:[UIColor blackColor]];
        [lb_describ setFont:[UIFont systemFontOfSize:16]];
        [lb_describ mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(44);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        
        self.tf_guigeDescrib = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_guigeDescrib];
        [self.tf_guigeDescrib setPlaceholder:@"选填，例：大份水饺，35个"];
        [self.tf_guigeDescrib setTextColor:[UIColor blackColor]];
        [self.tf_guigeDescrib setFont:[UIFont systemFontOfSize:16]];
        [self.tf_guigeDescrib mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.mas_equalTo(44);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        
        UIImageView *img_line2 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line2];
        [img_line2 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(43.5 + 44);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //图片
        UILabel *lb_pic = [[UILabel alloc]init];
        [self.contentView addSubview:lb_pic];
        [lb_pic setText:@"规格图片"];
        [lb_pic setTextColor:[UIColor blackColor]];
        [lb_pic setFont:[UIFont systemFontOfSize:16]];
        [lb_pic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(88);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(80);
        }];
        
        self.iv_guigePic = [[UIImageView alloc]init];
        [self.contentView addSubview:self.iv_guigePic];
        [self.iv_guigePic setImage:[UIImage imageNamed:@"add_pic"]];
        [self.iv_guigePic setContentMode:UIViewContentModeScaleAspectFill];
        self.iv_guigePic.clipsToBounds = YES;
        self.iv_guigePic.userInteractionEnabled = YES;
        [self.iv_guigePic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.equalTo(img_line2.mas_bottom).offset(10);
            make.width.height.mas_equalTo(60);
        }];
        
        UIImageView *img_line3 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line3];
        [img_line3 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.iv_guigePic.mas_bottom).offset(10);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //重量
        UILabel *lb_weight = [[UILabel alloc]init];
        [self.contentView addSubview:lb_weight];
        [lb_weight setText:@"重量"];
        [lb_weight setTextColor:[UIColor blackColor]];
        [lb_weight setFont:[UIFont systemFontOfSize:16]];
        [lb_weight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(img_line3.mas_bottom);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        self.tf_guigeWeight = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_guigeWeight];
        [self.tf_guigeWeight setPlaceholder:@"0"];
        [self.tf_guigeWeight setTextColor:[UIColor blackColor]];
        [self.tf_guigeWeight setFont:[UIFont systemFontOfSize:16]];
        self.tf_guigeWeight.keyboardType = UIKeyboardTypeNumberPad;
        
        self.btn_guigeUnit = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_guigeUnit];
        [self.btn_guigeUnit setTitle:@"克(g)" forState:UIControlStateNormal];
        [self.btn_guigeUnit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btn_guigeUnit.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.btn_guigeUnit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(205);
            make.top.equalTo(lb_weight);
            make.height.mas_equalTo(44);
        }];
        
        [self.tf_guigeWeight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.equalTo(lb_weight);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.btn_guigeUnit.mas_left).offset(-15);
        }];
        
        UIImageView *img_unit_arrow = [[UIImageView alloc]init];
        [self.contentView addSubview:img_unit_arrow];
        [img_unit_arrow setImage:[UIImage imageNamed:@"weight_dropdown"]];
        [img_unit_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn_guigeUnit.mas_right).offset(5);
            make.top.equalTo(img_line3.mas_bottom).offset(20);
            
        }];
        
        UIImageView *img_line4 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line4];
        [img_line4 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.tf_guigeWeight.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //库存
        UILabel *lb_inventory = [[UILabel alloc]init];
        [self.contentView addSubview:lb_inventory];
        [lb_inventory setText:@"库存无限"];
        [lb_inventory setTextColor:[UIColor blackColor]];
        [lb_inventory setFont:[UIFont systemFontOfSize:16]];
        [lb_inventory mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(img_line4.mas_bottom);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        self.switch_Inventory = [[UISwitch alloc]init];
        [self addSubview:self.switch_Inventory];
        [self.switch_Inventory setOnTintColor:[UIColor colorWithHexString:COLOR_BLUE_MAIN]];
        self.switch_Inventory.layer.anchorPoint = CGPointMake(0, 0.3);
        [self.switch_Inventory mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(82);
            make.top.equalTo(img_line4.mas_bottom);
            make.width.mas_equalTo(51);
            make.height.mas_equalTo(31);
        }];
        
//        self.lb_inventoryT = [[UILabel alloc]init];
//        [self.contentView addSubview:self.lb_inventoryT];
//        [self.lb_inventoryT setText:@"库存"];
//        [self.lb_inventoryT setTextColor:[UIColor blackColor]];
//        [self.lb_inventoryT setFont:[UIFont systemFontOfSize:16]];
//        [self.lb_inventoryT mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(190);
//            make.top.equalTo(lb_inventory);
//            make.width.mas_equalTo(34);
//            make.height.mas_equalTo(44);
//        }];
//
//        self.lb_inventory_xing = [[UILabel alloc]init];
//        [self.contentView addSubview:self.lb_inventory_xing];
//        [self.lb_inventory_xing setText:@"*"];
//        [self.lb_inventory_xing setTextColor:[UIColor colorWithHexString:@"D0021B"]];
//        [self.lb_inventory_xing setFont:[UIFont systemFontOfSize:16]];
//        [self.lb_inventory_xing mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.lb_inventoryT.mas_right).offset(3);
//            make.top.height.equalTo(self.lb_inventoryT);
//        }];
//
//        self.tf_inventory = [[UITextField alloc]init];
//        [self.contentView addSubview:self.tf_inventory];
//        [self.tf_inventory setPlaceholder:@"0"];
//        [self.tf_inventory setTextColor:[UIColor blackColor]];
//        self.tf_inventory.keyboardType = UIKeyboardTypeNumberPad;
//        [self.tf_inventory setFont:[UIFont systemFontOfSize:16]];
//        [self.tf_inventory setBackgroundColor:[UIColor yellowColor]];
//        [self.tf_inventory mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.lb_inventory_xing.mas_right).offset(18);
//            make.top.equalTo(self.lb_inventoryT);
//            make.height.mas_equalTo(44);
//            make.right.equalTo(self.mas_right).offset(-15);
//        }];
        
        
        
        
        self.lb_inventoryT = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_inventoryT];
        [self.lb_inventoryT setText:@"库存"];
        [self.lb_inventoryT setTextColor:[UIColor blackColor]];
        [self.lb_inventoryT setFont:[UIFont systemFontOfSize:16]];
        [self.lb_inventoryT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(190);
            make.top.equalTo(lb_inventory);
            make.width.mas_equalTo(34);
            make.height.mas_equalTo(44);
        }];
        
        self.lb_inventory_xing = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_inventory_xing];
        [self.lb_inventory_xing setText:@"*"];
        [self.lb_inventory_xing setTextColor:[UIColor colorWithHexString:@"D0021B"]];
        [self.lb_inventory_xing setFont:[UIFont systemFontOfSize:16]];
        [self.lb_inventory_xing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lb_inventoryT.mas_right).offset(3);
            make.top.height.equalTo(self.lb_inventoryT);
        }];
        
        self.tf_inventory = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_inventory];
        [self.tf_inventory setPlaceholder:@"0"];
        [self.tf_inventory setTextColor:[UIColor blackColor]];
        [self.tf_inventory setFont:[UIFont systemFontOfSize:16]];
        self.tf_inventory.keyboardType = UIKeyboardTypeDecimalPad;
        [self.tf_inventory mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(224 + 20);
            make.top.equalTo(lb_inventory);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        
        UIImageView *img_line5 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line5];
        [img_line5 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.tf_inventory.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //是否支持堂食
        UILabel *lb_tangshi = [[UILabel alloc]init];
        [self.contentView addSubview:lb_tangshi];
        [lb_tangshi setText:@"支持堂食"];
        [lb_tangshi setTextColor:[UIColor blackColor]];
        [lb_tangshi setFont:[UIFont systemFontOfSize:16]];
        [lb_tangshi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(img_line5.mas_bottom);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];

        self.switch_inStore = [[UISwitch alloc]init];
        [self addSubview:self.switch_inStore];
        [self.switch_inStore setOnTintColor:[UIColor colorWithHexString:COLOR_BLUE_MAIN]];
        self.switch_inStore.layer.anchorPoint = CGPointMake(0, 0.3);
        [self.switch_inStore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(82);
            make.top.equalTo(img_line5.mas_bottom);
            make.width.mas_equalTo(51);
            make.height.mas_equalTo(31);
        }];

        self.lb_tangshiT = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_tangshiT];
        [self.lb_tangshiT setText:@"价格"];
        [self.lb_tangshiT setTextColor:[UIColor blackColor]];
        [self.lb_tangshiT setFont:[UIFont systemFontOfSize:16]];
        [self.lb_tangshiT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(190);
            make.top.equalTo(lb_tangshi);
            make.width.mas_equalTo(34);
            make.height.mas_equalTo(44);
        }];

        self.lb_tangshiT_xing = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_tangshiT_xing];
        [self.lb_tangshiT_xing setText:@"*"];
        [self.lb_tangshiT_xing setTextColor:[UIColor colorWithHexString:@"D0021B"]];
        [self.lb_tangshiT_xing setFont:[UIFont systemFontOfSize:16]];
        [self.lb_tangshiT_xing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lb_tangshiT.mas_right).offset(3);
            make.top.height.equalTo(self.lb_tangshiT);
        }];

        self.tf_inStorePrice = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_inStorePrice];
        [self.tf_inStorePrice setPlaceholder:@"￥0.00"];
        [self.tf_inStorePrice setTextColor:[UIColor blackColor]];
        [self.tf_inStorePrice setFont:[UIFont systemFontOfSize:16]];
        self.tf_inStorePrice.keyboardType = UIKeyboardTypeDecimalPad;
        [self.tf_inStorePrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lb_tangshiT_xing.mas_right).offset(8);
            make.top.equalTo(lb_tangshi);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        
        UIImageView *img_line6 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line6];
        [img_line6 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.tf_inStorePrice.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];

//        //是否外卖

        UILabel *lb_waimai = [[UILabel alloc]init];
        [self.contentView addSubview:lb_waimai];
        [lb_waimai setText:@"支持外卖"];
        [lb_waimai setTextColor:[UIColor blackColor]];
        [lb_waimai setFont:[UIFont systemFontOfSize:16]];
        [lb_waimai mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(img_line6.mas_bottom);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];

        self.switch_waimai = [[UISwitch alloc]init];
        [self addSubview:self.switch_waimai];
        [self.switch_waimai setOnTintColor:[UIColor colorWithHexString:COLOR_BLUE_MAIN]];
        self.switch_waimai.layer.anchorPoint = CGPointMake(0, 0.3);
        [self.switch_waimai mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(82);
            make.top.equalTo(img_line6.mas_bottom);
            make.width.mas_equalTo(51);
            make.height.mas_equalTo(31);
        }];

        self.lb_waimaiT = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_waimaiT];
        [self.lb_waimaiT setText:@"价格"];
        [self.lb_waimaiT setTextColor:[UIColor blackColor]];
        [self.lb_waimaiT setFont:[UIFont systemFontOfSize:16]];
        [self.lb_waimaiT mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(190);
            make.top.equalTo(lb_waimai);
            make.width.mas_equalTo(34);
            make.height.mas_equalTo(44);
        }];

        self.lb_waimaiT_xing = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_waimaiT_xing];
        [self.lb_waimaiT_xing setText:@"*"];
        [self.lb_waimaiT_xing setTextColor:[UIColor colorWithHexString:@"D0021B"]];
        [self.lb_waimaiT_xing setFont:[UIFont systemFontOfSize:16]];
        [self.lb_waimaiT_xing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lb_waimaiT.mas_right).offset(3);
            make.top.height.equalTo(self.lb_waimaiT);
        }];

        self.tf_waimaiPrice = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_waimaiPrice];
        [self.tf_waimaiPrice setPlaceholder:@"￥0.00"];
        [self.tf_waimaiPrice setTextColor:[UIColor blackColor]];
        self.tf_waimaiPrice.keyboardType = UIKeyboardTypeDecimalPad;
        [self.tf_waimaiPrice setFont:[UIFont systemFontOfSize:16]];
        [self.tf_waimaiPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lb_waimaiT_xing.mas_right).offset(8);
            make.top.equalTo(lb_waimai);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];

        UIImageView *img_line7 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line7];
        [img_line7 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line7 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.tf_waimaiPrice.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];

//        //包装
        UILabel *lb_baozhuang = [[UILabel alloc]init];
        [self.contentView addSubview:lb_baozhuang];
        [lb_baozhuang setText:@"包装费"];
        [lb_baozhuang setTextColor:[UIColor blackColor]];
        [lb_baozhuang setFont:[UIFont systemFontOfSize:16]];
        [lb_baozhuang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(img_line7.mas_bottom);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];

        self.tf_baozhuangPrice = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_baozhuangPrice];
        [self.tf_baozhuangPrice setPlaceholder:@"￥0.00"];
        [self.tf_baozhuangPrice setTextColor:[UIColor blackColor]];
        [self.tf_baozhuangPrice setFont:[UIFont systemFontOfSize:16]];
        self.tf_baozhuangPrice.keyboardType = UIKeyboardTypeDecimalPad;
        [self.tf_baozhuangPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.equalTo(lb_baozhuang);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(SCREEN_WIDTH - 180);
        }];

        UILabel *bzUnit = [[UILabel alloc]init];
        [self.contentView addSubview:bzUnit];
        [bzUnit setText:@"元/个"];
        [bzUnit setTextColor:[UIColor colorWithHexString:@"#000000"]];
        [bzUnit setFont:[UIFont systemFontOfSize:16]];
        [bzUnit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(174);
            make.top.height.equalTo(lb_baozhuang);
            make.width.mas_equalTo(40);
        }];

        UILabel *bzgx = [[UILabel alloc]init];
        [self.contentView addSubview:bzgx];
        [bzgx setText:@"共需"];
        [bzgx setTextColor:[UIColor colorWithHexString:@"#000000"]];
        [bzgx setFont:[UIFont systemFontOfSize:16]];
        [bzgx mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bzUnit.mas_right).offset(18);
            make.top.height.equalTo(lb_baozhuang);
            make.width.mas_equalTo(34);
        }];

        self.tf_baozhuangNum = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_baozhuangNum];
        [self.tf_baozhuangNum setPlaceholder:@"0"];
        self.tf_baozhuangNum.keyboardType = UIKeyboardTypeNumberPad;
        [self.tf_baozhuangNum setTextColor:[UIColor blackColor]];
        [self.tf_baozhuangNum setFont:[UIFont systemFontOfSize:16]];
        self.tf_baozhuangNum.textAlignment = NSTextAlignmentCenter;
        [self.tf_baozhuangNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bzgx.mas_right).offset(12);
            make.top.height.equalTo(lb_baozhuang);
            make.width.mas_equalTo(30);
        }];

        UILabel *ge = [[UILabel alloc]init];
        [self.contentView addSubview:ge];
        [ge setText:@"个"];
        [ge setTextColor:[UIColor colorWithHexString:@"#000000"]];
        [ge setFont:[UIFont systemFontOfSize:16]];
        [ge mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tf_baozhuangNum.mas_right).offset(12);
            make.top.height.equalTo(lb_baozhuang);
            make.width.mas_equalTo(30);
        }];
        
        UIImageView *img_line8 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line8];
        [img_line8 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line8 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.tf_baozhuangNum.mas_bottom).offset(-0.5);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        self.v_gray = [[UIView alloc]init];
        [self.v_gray setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        [self.contentView addSubview:self.v_gray];
        [self.v_gray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(self.contentView);
            make.top.equalTo(img_line8.mas_bottom);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(self.v_gray.mas_bottom);
        }];
    }
    return self;
}

- (void)contentCellWithStandardsEntity:(StandardsEntity *)standardsEntity{
    self.tf_guigeName.text = standardsEntity.name;
    self.tf_guigeDescrib.text = standardsEntity.desc;
    [self.iv_guigePic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HeadQZ,standardsEntity.pictures]] placeholderImage:[UIImage imageNamed:@"add_pic"]];
    if ([standardsEntity.weight doubleValue] > 0) {
        self.tf_guigeWeight.text = [NSString stringWithFormat:@"%@",standardsEntity.weight];
    }
    
    [self.btn_guigeUnit setTitle:standardsEntity.weightNnit forState:UIControlStateNormal];

    self.switch_Inventory.on = standardsEntity.stockType;
    if (self.switch_Inventory.on == NO) {
        [self.tf_inventory setHidden:NO];
        [self.lb_inventoryT setHidden:NO];
        [self.lb_inventory_xing setHidden:NO];
    }else{
        [self.tf_inventory setHidden:YES];
        [self.lb_inventoryT setHidden:YES];
        [self.lb_inventory_xing setHidden:YES];
    }
    if ([standardsEntity.stock intValue] > 0) {
        self.tf_inventory.text = [NSString stringWithFormat:@"%@",standardsEntity.stock];
    }else if (standardsEntity.stock == NULL){
        self.tf_inventory.text = @"";
    }
    else if ([standardsEntity.stock intValue] == 0){
        self.tf_inventory.text = @"0";
    }
    
    self.switch_inStore.on = standardsEntity.storeUsing;
    if (self.switch_inStore.on == YES) {
        [self.tf_inStorePrice setHidden:NO];
        [self.lb_tangshiT setHidden:NO];
        [self.lb_tangshiT_xing setHidden:NO];
    }else{
        [self.tf_inStorePrice setHidden:YES];
        [self.tf_inStorePrice setHidden:YES];
        [self.lb_tangshiT setHidden:YES];
        [self.lb_tangshiT_xing setHidden:YES];
    }
    if (standardsEntity.storePrice > 0) {
        self.tf_inStorePrice.text = [NSString stringWithFormat:@"%.2f",standardsEntity.storePrice];
    }else{
        self.tf_inStorePrice.text = @"";
    }

    self.switch_waimai.on = standardsEntity.onlineStoreUsing;
    if (self.switch_waimai.on == YES) {
        [self.tf_waimaiPrice setHidden:NO];
        [self.lb_waimaiT setHidden:NO];
        [self.lb_waimaiT_xing setHidden:NO];
    }else{
        [self.tf_waimaiPrice setHidden:YES];
        [self.lb_waimaiT setHidden:YES];
        [self.lb_waimaiT_xing setHidden:YES];
    }
    if (standardsEntity.onlineStorePrice) {
        self.tf_waimaiPrice.text = [NSString stringWithFormat:@"%.2f",standardsEntity.onlineStorePrice];
    }
    if ([standardsEntity.dispatchingCount intValue] > 0) {
        self.tf_baozhuangNum.text = [NSString stringWithFormat:@"%@",standardsEntity.dispatchingCount];
    }
    if (standardsEntity.dispatchingPrice > 0) {
        self.tf_baozhuangPrice.text = [NSString stringWithFormat:@"%.2f",standardsEntity.dispatchingPrice];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
