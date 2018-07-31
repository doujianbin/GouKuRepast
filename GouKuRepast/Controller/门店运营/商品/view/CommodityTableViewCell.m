//
//  CommodityTableViewCell.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/9.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommodityTableViewCell.h"

@implementation CommodityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.img_CommodityHeadPic = [[UIImageView alloc]init];
        self.img_CommodityHeadPic.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
        [self.contentView addSubview:self.img_CommodityHeadPic];
        [self.img_CommodityHeadPic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(15);
            make.width.height.mas_equalTo(56);
        }];
        self.img_CommodityHeadPic.layer.cornerRadius = 3.0f;
        self.img_CommodityHeadPic.layer.masksToBounds = YES;
        
        self.lab_CommodityStatus = [[UILabel alloc]init];
        [self.img_CommodityHeadPic addSubview:self.lab_CommodityStatus];
        [self.lab_CommodityStatus setBackgroundColor:[UIColor colorWithHexString:@"#4a4a4a"]];
        [self.lab_CommodityStatus setTextAlignment:NSTextAlignmentCenter];
        [self.lab_CommodityStatus setTextColor:[UIColor whiteColor]];
        self.lab_CommodityStatus.font = [UIFont systemFontOfSize:12];
        [self.lab_CommodityStatus mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(39);
            make.left.mas_equalTo(0);
            make.width.equalTo(self.img_CommodityHeadPic);
            make.height.mas_equalTo(17);
        }];
        
        self.lab_CommodityName = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_CommodityName];
        [self.lab_CommodityName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.img_CommodityHeadPic.mas_right).offset(10);
            make.top.mas_equalTo(12);
            make.right.equalTo(self.mas_right).offset(-10);
        }];
        [self.lab_CommodityName setFont:[UIFont boldSystemFontOfSize:16]];
        self.lab_CommodityName.numberOfLines = 0;
        
        self.lab_CommodityStock = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_CommodityStock];
        [self.lab_CommodityStock mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_CommodityName);
            make.top.equalTo(self.lab_CommodityName.mas_bottom).offset(7);
        }];
        self.lab_CommodityStock.font = [UIFont systemFontOfSize:13];
        
        self.lab_CommoditySalesVolume = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_CommoditySalesVolume];
        [self.lab_CommoditySalesVolume mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_CommodityStock.mas_right).offset(13);
            make.top.equalTo(self.lab_CommodityStock);
            make.right.lessThanOrEqualTo(self.mas_right).offset(-10);
        }];
        self.lab_CommoditySalesVolume.font = [UIFont systemFontOfSize:13];
        
        self.lab_CommodityPrice = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_CommodityPrice];
        [self.lab_CommodityPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lab_CommodityName);
            make.top.mas_equalTo(self.lab_CommodityStock.mas_bottom).offset(7);
            make.right.equalTo(self.lab_CommodityName);
        }];
//        self.lab_CommodityPrice.font = [UIFont systemFontOfSize:16];
//        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#e6670c"]];
        
        self.btn_more = [[UIButton alloc]init];
        [self.btn_more setImage:[UIImage imageNamed:@"dian"] forState:UIControlStateNormal];
        [self.contentView addSubview: self.btn_more];
        self.btn_more.layer.borderWidth = 1;
        self.btn_more.layer.borderColor = [[UIColor colorWithHexString:@"#4167b2"] CGColor];
        self.btn_more.layer.cornerRadius = 3;
        self.btn_more.layer.masksToBounds = YES;
        [self.btn_more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-15);
            make.width.mas_equalTo(50);
            make.top.equalTo(self.lab_CommodityPrice.mas_bottom).offset(10);
            make.height.mas_equalTo(28);
        }];
        
        self.btn_edit = [[UIButton alloc]init];
        [self.contentView addSubview: self.btn_edit];
        [self.btn_edit setTitle:@"编辑" forState:UIControlStateNormal];
        self.btn_edit.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.btn_edit setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
        self.btn_edit.layer.borderWidth = 1;
        self.btn_edit.layer.borderColor = [[UIColor colorWithHexString:@"#4167b2"] CGColor];
        self.btn_edit.layer.cornerRadius = 3;
        self.btn_edit.layer.masksToBounds = YES;
        [self.btn_edit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.equalTo(self.btn_more);
            make.right.equalTo(self.btn_more.mas_left).offset(-15);
            make.width.mas_equalTo(70);
        }];
        
        self.img_line = [[UIImageView alloc]init];
        [self.contentView addSubview:self.img_line];
        [self.img_line setBackgroundColor:[UIColor colorWithHexString:@"#d8d8d8"]];
        [self.img_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.equalTo(self.btn_edit.mas_bottom).offset(10);
            make.right.equalTo(self.mas_right);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

- (void)contentCellWithCommodityInformationEntity:(RepastEntity *)commodityInformationEntity{
    [self.lab_CommoditySalesVolume setHidden:YES];
    [self.img_CommodityHeadPic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HeadQZ,commodityInformationEntity.pictures]] placeholderImage:[UIImage imageNamed:@"headPic"]];
    self.lab_CommodityName.text = commodityInformationEntity.name;

    if (commodityInformationEntity.storeUsing == YES && commodityInformationEntity.onlineStoreUsing == YES) {
        self.lab_CommodityPrice.text = @"销售渠道：堂食，外卖";
    }
    if (commodityInformationEntity.storeUsing == NO && commodityInformationEntity.onlineStoreUsing == NO) {
        self.lab_CommodityPrice.text = @"销售渠道：";
    }
    if (commodityInformationEntity.storeUsing == YES && commodityInformationEntity.onlineStoreUsing == NO) {
        self.lab_CommodityPrice.text = @"销售渠道：堂食";
    }
    if (commodityInformationEntity.storeUsing == NO && commodityInformationEntity.onlineStoreUsing == YES) {
        self.lab_CommodityPrice.text = @"销售渠道：外卖";
    }
    self.lab_CommodityPrice.font = [UIFont systemFontOfSize:14];
    [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
    [self.lab_CommodityStatus setHidden:YES];
    [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
//    if (commodityInformationEntity.status == 1) {
//        [self.lab_CommodityStatus setHidden:YES];
//        [self.lab_CommodityName setTextColor:[UIColor blackColor]];
//        [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#4a4a4a"]];
////        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#e6670c"]];
//    }
//    if (commodityInformationEntity.status == 2) {
//        [self.lab_CommodityStatus setHidden:NO];
//        [self.lab_CommodityStatus setText:@"已售罄"];
//        [self.lab_CommodityName setTextColor:[UIColor colorWithHexString:@"#979797"]];
//        [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#979797"]];
////        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#979797"]];
//    }
//    if (commodityInformationEntity.status == 3) {
//        [self.lab_CommodityStatus setHidden:NO];
//        [self.lab_CommodityStatus setText:@"已下架"];
//        [self.lab_CommodityName setTextColor:[UIColor colorWithHexString:@"#979797"]];
//        [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#979797"]];
////        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#979797"]];
//    }
}

//门店布局
- (void)contentCellInShopWithCommodityInformationEntity:(CommodityFromCodeEntity *)commodityInformationEntity{
    [self.lab_CommoditySalesVolume setHidden:YES];
    [self.img_CommodityHeadPic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HeadQZ,commodityInformationEntity.pictures]] placeholderImage:[UIImage imageNamed:@"headPic"]];
    self.lab_CommodityName.text = commodityInformationEntity.name;
    self.lab_CommodityStock.text = [NSString stringWithFormat:@"库存%@",commodityInformationEntity.stock];
    self.lab_CommoditySalesVolume.text = [NSString stringWithFormat:@"月售%@",commodityInformationEntity.saleAmountMonth];
    self.lab_CommodityPrice.text = [NSString stringWithFormat:@"￥%.2f",[commodityInformationEntity.price doubleValue]];

    self.lab_CommodityPrice.font = [UIFont systemFontOfSize:14];
    [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
        if (commodityInformationEntity.status == 1) {
            [self.lab_CommodityStatus setHidden:YES];
            [self.lab_CommodityName setTextColor:[UIColor blackColor]];
            [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#4a4a4a"]];
            [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#e6670c"]];
        }
        if (commodityInformationEntity.status == 2) {
            [self.lab_CommodityStatus setHidden:NO];
            [self.lab_CommodityStatus setText:@"已售罄"];
            [self.lab_CommodityName setTextColor:[UIColor colorWithHexString:@"#979797"]];
            [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#979797"]];
            [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#979797"]];
        }
        if (commodityInformationEntity.status == 3) {
            [self.lab_CommodityStatus setHidden:NO];
            [self.lab_CommodityStatus setText:@"已下架"];
            [self.lab_CommodityName setTextColor:[UIColor colorWithHexString:@"#979797"]];
            [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#979797"]];
            [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#979797"]];
        }
}

//网店布局
- (void)contentCellInNetShopWithCommodityInformationEntity:(CommodityFromCodeEntity *)commodityInformationEntity{
    [self.lab_CommoditySalesVolume setHidden:YES];
    [self.img_CommodityHeadPic sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HeadQZ,commodityInformationEntity.pictures]] placeholderImage:[UIImage imageNamed:@"headPic"]];
    self.lab_CommodityName.text = commodityInformationEntity.name;
    self.lab_CommodityStock.text = [NSString stringWithFormat:@"库存%@",commodityInformationEntity.stock];
    self.lab_CommoditySalesVolume.text = [NSString stringWithFormat:@"月售%@",commodityInformationEntity.saleAmountMonth];
    self.lab_CommodityPrice.text = [NSString stringWithFormat:@"￥%.2f",[commodityInformationEntity.price doubleValue]];
    
    self.lab_CommodityPrice.font = [UIFont systemFontOfSize:14];
    [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
    if (commodityInformationEntity.status == 1) {
        [self.lab_CommodityStatus setHidden:YES];
        [self.lab_CommodityName setTextColor:[UIColor blackColor]];
        [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#4a4a4a"]];
        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#e6670c"]];
    }
    if (commodityInformationEntity.status == 2) {
        [self.lab_CommodityStatus setHidden:NO];
        [self.lab_CommodityStatus setText:@"已售罄"];
        [self.lab_CommodityName setTextColor:[UIColor colorWithHexString:@"#979797"]];
        [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#979797"]];
        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#979797"]];
    }
    if (commodityInformationEntity.status == 3) {
        [self.lab_CommodityStatus setHidden:NO];
        [self.lab_CommodityStatus setText:@"已下架"];
        [self.lab_CommodityName setTextColor:[UIColor colorWithHexString:@"#979797"]];
        [self.lab_CommodityStock setTextColor:[UIColor colorWithHexString:@"#979797"]];
        [self.lab_CommodityPrice setTextColor:[UIColor colorWithHexString:@"#979797"]];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
