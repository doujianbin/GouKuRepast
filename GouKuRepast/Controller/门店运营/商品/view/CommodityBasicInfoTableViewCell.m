//
//  CommodityBasicInfoTableViewCell.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommodityBasicInfoTableViewCell.h"

@implementation CommodityBasicInfoTableViewCell

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
        [lb_name setText:@"商品名称"];
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
        
        self.tf_commodityName = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_commodityName];
        [self.tf_commodityName setPlaceholder:@"请输入，30字以内"];
        [self.tf_commodityName setTextColor:[UIColor blackColor]];
        [self.tf_commodityName setFont:[UIFont systemFontOfSize:16]];
        [self.tf_commodityName mas_makeConstraints:^(MASConstraintMaker *make) {
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
        [lb_describ setText:@"商品描述"];
        [lb_describ setTextColor:[UIColor blackColor]];
        [lb_describ setFont:[UIFont systemFontOfSize:16]];
        [lb_describ mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(44);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        
        self.tf_commodityDsecrib = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_commodityDsecrib];
        [self.tf_commodityDsecrib setPlaceholder:@"选填，250字以内"];
        [self.tf_commodityDsecrib setTextColor:[UIColor blackColor]];
        [self.tf_commodityDsecrib setFont:[UIFont systemFontOfSize:16]];
        [self.tf_commodityDsecrib mas_makeConstraints:^(MASConstraintMaker *make) {
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
        
        //品牌
        UILabel *lb_brand = [[UILabel alloc]init];
        [self.contentView addSubview:lb_brand];
        [lb_brand setText:@"商品品牌"];
        [lb_brand setTextColor:[UIColor blackColor]];
        [lb_brand setFont:[UIFont systemFontOfSize:16]];
        [lb_brand mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(88);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        
        self.tf_commodityBrand = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_commodityBrand];
        [self.tf_commodityBrand setPlaceholder:@"选择品牌"];
        [self.tf_commodityBrand setTextColor:[UIColor blackColor]];
        [self.tf_commodityBrand setFont:[UIFont systemFontOfSize:16]];
        self.tf_commodityBrand.enabled = NO;
        [self.tf_commodityBrand mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.mas_equalTo(88);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        
        self.btn_commodityBrand = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_commodityBrand];
        [self.btn_commodityBrand setBackgroundColor:[UIColor clearColor]];
        [self.btn_commodityBrand mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.height.right.equalTo(self.tf_commodityBrand);
        }];
        
        UIImageView *arrow_brand = [[UIImageView alloc]init];
        [self.contentView addSubview:arrow_brand];
        [arrow_brand setImage:[UIImage imageNamed:@"triangle_right"]];
        [arrow_brand mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH - 14 - 24);
            make.top.mas_equalTo(88 + 10);
            make.width.height.mas_equalTo(24);
        }];
        
        UIImageView *img_line3 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line3];
        [img_line3 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(43.5 + 88);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //图片
        UILabel *lb_pic = [[UILabel alloc]init];
        [self.contentView addSubview:lb_pic];
        [lb_pic setText:@"商品图片"];
        [lb_pic setTextColor:[UIColor blackColor]];
        [lb_pic setFont:[UIFont systemFontOfSize:16]];
        [lb_pic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(132);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(80);
        }];
        
        self.iv_commodityPic = [[UIImageView alloc]init];
        [self.contentView addSubview:self.iv_commodityPic];
        [self.iv_commodityPic setContentMode:UIViewContentModeScaleAspectFill];
        self.iv_commodityPic.clipsToBounds = YES;
        self.iv_commodityPic.userInteractionEnabled = YES;
        [self.iv_commodityPic setImage:[UIImage imageNamed:@"add_pic"]];
        [self.iv_commodityPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.equalTo(img_line3.mas_bottom).offset(10);
            make.width.height.mas_equalTo(60);
        }];
        
        UIImageView *img_line4 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line4];
        [img_line4 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.iv_commodityPic.mas_bottom).offset(10);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        //分类
        UILabel *lb_classification = [[UILabel alloc]init];
        [self.contentView addSubview:lb_classification];
        [lb_classification setText:@"店内分类"];
        [lb_classification setTextColor:[UIColor blackColor]];
        [lb_classification setFont:[UIFont systemFontOfSize:16]];
        [lb_classification mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(img_line4.mas_bottom);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        UILabel *lb_classification_xing = [[UILabel alloc]init];
        [self.contentView addSubview:lb_classification_xing];
        [lb_classification_xing setText:@"*"];
        [lb_classification_xing setTextColor:[UIColor colorWithHexString:@"D0021B"]];
        [lb_classification_xing setFont:[UIFont systemFontOfSize:16]];
        [lb_classification_xing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lb_classification.mas_right).offset(5.3);
            make.top.height.equalTo(lb_classification);
        }];
        
        self.tf_commodityClassification = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_commodityClassification];
        [self.tf_commodityClassification setPlaceholder:@"选择分类"];
        [self.tf_commodityClassification setTextColor:[UIColor blackColor]];
        [self.tf_commodityClassification setFont:[UIFont systemFontOfSize:16]];
        self.tf_commodityClassification.enabled = NO;
        [self.tf_commodityClassification mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.equalTo(lb_classification);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.mas_right).offset(-15);
        }];
        
        self.btn_commodityClassification = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_commodityClassification];
        [self.btn_commodityClassification setBackgroundColor:[UIColor clearColor]];
        [self.btn_commodityClassification mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.height.right.equalTo(self.tf_commodityClassification);
        }];
        
        UIImageView *arrow_classification = [[UIImageView alloc]init];
        [self.contentView addSubview:arrow_classification];
        [arrow_classification setImage:[UIImage imageNamed:@"triangle_right"]];
        [arrow_classification mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH - 14 - 24);
            make.top.mas_equalTo(212 + 10);
            make.width.height.mas_equalTo(24);
        }];
        
        UIImageView *img_line5 = [[UIImageView alloc]init];
        [self.contentView addSubview:img_line5];
        [img_line5 setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [img_line5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.tf_commodityClassification.mas_bottom).offset(-0.5);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(img_line5.mas_bottom);
        }];
    }
    return self;
}

- (void)contentCellWithRepastEntity:(RepastEntity *)repastEntity{
    self.tf_commodityName.text = repastEntity.name;
    self.tf_commodityBrand.text = repastEntity.brandName;
    self.tf_commodityDsecrib.text = repastEntity.desc;
    self.tf_commodityClassification.text = repastEntity.categoryName;
    
    if ([repastEntity.pictures rangeOfString:@"http"].location != NSNotFound) {
        [self.iv_commodityPic sd_setImageWithURL:[NSURL URLWithString:repastEntity.pictures] placeholderImage:[UIImage imageNamed:@"add_pic"]];
    }else{
        [self.iv_commodityPic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HeadQZ,repastEntity.pictures]] placeholderImage:[UIImage imageNamed:@"add_pic"]];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
