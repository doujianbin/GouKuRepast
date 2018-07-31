//
//  MaterialsTableViewCell.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "MaterialsTableViewCell.h"

@implementation MaterialsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        self.iv_arrow = [[UIImageView alloc]init];
        [self.contentView addSubview:self.iv_arrow];
        [self.iv_arrow setImage:[UIImage imageNamed:@"triangle_right"]];
        [self.iv_arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH - 14 - 24);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(24);
        }];
        
        self.lb_title = [[UILabel alloc]init];
        [self.contentView addSubview:self.lb_title];
        [self.lb_title setTextColor:[UIColor blackColor]];
        [self.lb_title setFont:[UIFont systemFontOfSize:16]];
        [self.lb_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(44);
            make.right.equalTo(self.iv_arrow.mas_left).offset(-15);
        }];
        
        self.img_line = [[UIImageView alloc]init];
        [self.contentView addSubview:self.img_line];
        [self.img_line setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [self.img_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(43.5);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

- (void)contentCellWithDic:(NSDictionary *)dic{
    [self.lb_title setText:[dic objectForKey:@"materialName"]];
}

- (void)contentCellWithBrandDic:(NSDictionary *)dic{
    [self.iv_arrow setHidden:YES];
    [self.lb_title setText:[dic objectForKey:@"brandName"]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
