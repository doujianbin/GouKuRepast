//
//  CommodityPropertyTableViewCell.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/18.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommodityPropertyTableViewCell.h"
#import "NSString+Size.h"

@implementation CommodityPropertyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *lb_propertyName = [[UILabel alloc]init];
        [self.contentView addSubview:lb_propertyName];
        [lb_propertyName setText:@"属性名称"];
        [lb_propertyName setTextColor:[UIColor blackColor]];
        [lb_propertyName setFont:[UIFont systemFontOfSize:16]];
        [lb_propertyName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        self.tf_propertyName = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_propertyName];
        [self.tf_propertyName setPlaceholder:@"请填写，如甜度、辣度"];
        self.tf_property.backgroundColor = [UIColor redColor];
        self.tf_propertyName.textColor = [UIColor blackColor];
        self.tf_propertyName.font = [UIFont systemFontOfSize:16];
        [self.tf_propertyName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.height.equalTo(lb_propertyName);
            make.right.equalTo(self.mas_right).offset(-15);
            make.height.mas_equalTo(44);
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
        
        UILabel *lb_property = [[UILabel alloc]init];
        [self.contentView addSubview:lb_property];
        [lb_property setText:@"属性选项"];
        [lb_property setTextColor:[UIColor blackColor]];
        [lb_property setFont:[UIFont systemFontOfSize:16]];
        [lb_property mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(44);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(44);
        }];
        
        self.btn_addProperty = [[UIButton alloc]init];
        [self.contentView addSubview:self.btn_addProperty];
        [self.btn_addProperty setBackgroundImage:[UIImage imageNamed:@"addshuxing"] forState:UIControlStateNormal];
        [self.btn_addProperty mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH - 11 - 22);
            make.top.mas_equalTo(55);
            make.width.height.mas_equalTo(22);
        }];
        
        self.tf_property = [[UITextField alloc]init];
        [self.contentView addSubview:self.tf_property];
        [self.tf_property setPlaceholder:@"填写属性"];
        self.tf_property.textColor = [UIColor blackColor];
        self.tf_property.font = [UIFont systemFontOfSize:16];
        [self.tf_property mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.top.height.equalTo(lb_property);
            make.right.equalTo(self.mas_right).offset(- 33 - 15);
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
        
        self.v_propertyDetail = [[UIView alloc]init];
        [self.contentView addSubview:self.v_propertyDetail];
        [self.v_propertyDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(img_line2.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
        }];
        
        self.img_line = [[UIImageView alloc]init];
        [self.contentView addSubview:self.img_line];
        [self.img_line setBackgroundColor:[UIColor colorWithHexString:@"#D8D8D8"]];
        [self.img_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.equalTo(self.v_propertyDetail.mas_bottom).offset(-0.5);
            make.width.mas_equalTo(SCREEN_WIDTH - 15);
            make.height.mas_equalTo(0.5);
        }];
        
        self.v_gray = [[UIView alloc]init];
        [self.v_gray setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        [self.contentView addSubview:self.v_gray];
        [self.v_gray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.width.equalTo(self.contentView);
            make.top.equalTo(self.img_line.mas_bottom);
        }];
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.bottom.equalTo(self.v_gray.mas_bottom);
        }];
    }
    return self;
}

- (void)contentCellWithAttributesEntity:(AttributesEntity *)attributesEntity{
    self.tf_propertyName.text = attributesEntity.name;
    self.tf_property.text = attributesEntity.attribute;
    if (self.arr_btn) {
        for (UIButton *btn in self.arr_btn) {
            [btn removeFromSuperview];
        }
    }
    if (self.lastBtn) {
        [self.lastBtn removeFromSuperview];
        self.lastBtn = nil;
    }
    self.arr_btn = [NSMutableArray array];
    WS(ws);
//    attributesEntity.content = @[@"ssaa",@"ddfff"];
    __block CGFloat remainingWidth = SCREEN_WIDTH - SPACING_CONTROLS*2;//当前行剩余宽度
    for (int i=0; i<attributesEntity.contents.count; i++) {
        NSString *skuName = attributesEntity.contents[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:skuName forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        [btn.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE_MEMO]];
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[NSString stringWithFormat:@"%@  x",skuName] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithHexString:@"#3C97F4"]];
        [btn setTag:i];
        [self.arr_btn addObject:btn];
        [self.v_propertyDetail addSubview:btn];
        
        CGFloat btnWidth = [btn.titleLabel.text fittingLabelWidthWithHeight:26 andFontSize:[UIFont systemFontOfSize:FONT_SIZE_MEMO]]+24;//button宽度
        if (!self.lastBtn) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(SPACING_CONTROLS);
                make.top.mas_equalTo(5);
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(btnWidth);
            }];
        }else{
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                if (remainingWidth > btnWidth) {
                    make.left.equalTo(ws.lastBtn.mas_right).offset(20);
                    make.top.equalTo(ws.lastBtn);
                }else{
                    make.left.mas_equalTo(SPACING_CONTROLS);
                    make.top.equalTo(ws.lastBtn.mas_bottom).offset(SPACING_BUTTON);
                    remainingWidth = SCREEN_WIDTH - SPACING_CONTROLS*2;//当前行剩余宽度
                }
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(btnWidth);
            }];
        }
        self.lastBtn = btn;
        remainingWidth = remainingWidth - btnWidth - 20;
    }
    if (self.lastBtn) {
        [self.v_propertyDetail mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(ws.lastBtn.mas_bottom).offset(5);
        }];
        [self.img_line setHidden:NO];
    }else{
        [self.v_propertyDetail mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(88);
        }];
        [self.img_line setHidden:YES];
    }
}

- (void)buttonAction:(UIButton *)btn_sender{
    if (self.deleteProperty) {
        self.deleteProperty(btn_sender.tag);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
