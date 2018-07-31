//
//  CommodityMaterialsTableViewCell.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommodityMaterialsTableViewCell.h"

@implementation CommodityMaterialsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *lb_materials = [[UILabel alloc]init];
        [self.contentView addSubview:lb_materials];
        [lb_materials setText:@"原料"];
        [lb_materials setTextColor:[UIColor blackColor]];
        [lb_materials setFont:[UIFont systemFontOfSize:16]];
        [lb_materials mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(36);
            make.height.mas_equalTo(44);
        }];
        
        UIImageView *arrow_brand = [[UIImageView alloc]init];
        [self.contentView addSubview:arrow_brand];
        [arrow_brand setImage:[UIImage imageNamed:@"triangle_right"]];
        [arrow_brand mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH - 14 - 24);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(24);
        }];
        
        self.tf_materials = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_materials];
        [self.tf_materials setPlaceholder:@"选择原料"];
        self.tf_materials.textColor = [UIColor blackColor];
        self.tf_materials.font = [UIFont systemFontOfSize:16];
        self.tf_materials.enabled = NO;
        [self.tf_materials mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.height.equalTo(lb_materials);
            make.right.equalTo(self.mas_right).offset(-(14 + 24 + 15));
        }];
       
        self.btn_materials = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_materials];
        [self.btn_materials setBackgroundColor:[UIColor clearColor]];
        [self.btn_materials mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.height.right.equalTo(self.tf_materials);
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
        
        UILabel *lb_weigth = [[UILabel alloc]init];
        [self.contentView addSubview:lb_weigth];
        [lb_weigth setText:@"重量"];
        [lb_weigth setTextColor:[UIColor blackColor]];
        [lb_weigth setFont:[UIFont systemFontOfSize:16]];
        [lb_weigth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.height.equalTo(lb_materials);
            make.top.mas_equalTo(44);
        }];
        
        
        UILabel *lb_yue = [[UILabel alloc]init];
        [self.contentView addSubview:lb_yue];
        [lb_yue setText:@"约"];
        [lb_yue setTextColor:[UIColor blackColor]];
        [lb_yue setFont:[UIFont systemFontOfSize:16]];
        [lb_yue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.height.mas_equalTo(44);
            make.width.mas_equalTo(17);
        }];
        
        UILabel *lb_danwei = [[UILabel alloc]init];
        [self.contentView addSubview:lb_danwei];
        [lb_danwei setText:@"克(g)"];
        [lb_danwei setTextColor:[UIColor blackColor]];
        [lb_danwei setFont:[UIFont systemFontOfSize:16]];
        [lb_danwei mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(223);
            make.top.height.mas_equalTo(44);
//            make.width.mas_equalTo(55);
        }];
        
        self.tf_weigth = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_weigth];
        self.tf_weigth.placeholder = @"输入重量";
        self.tf_weigth.font = [UIFont systemFontOfSize:16];
        self.tf_weigth.textColor = [UIColor blackColor];
        self.tf_weigth.textAlignment = NSTextAlignmentCenter;
        self.tf_weigth.keyboardType = UIKeyboardTypeNumberPad;
        [self.tf_weigth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lb_yue.mas_right).offset(15);
            make.top.height.equalTo(lb_yue);
            make.right.equalTo(lb_danwei.mas_left).offset(-15);
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
        
        self.v_gray = [[UIView alloc]init];
        [self.v_gray setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        [self.contentView addSubview:self.v_gray];
        [self.v_gray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(self.contentView);
            make.top.equalTo(img_line2.mas_bottom);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(self.v_gray.mas_bottom);
        }];
    }
    return self;
}

- (void)contentCellWithMaterialsEntity:(MaterialsEntity *)materialsEntity{
    self.tf_materials.text = materialsEntity.name;
    self.tf_weigth.text = materialsEntity.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
