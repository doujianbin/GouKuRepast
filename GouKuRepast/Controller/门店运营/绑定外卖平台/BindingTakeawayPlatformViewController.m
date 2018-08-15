//
//  BindingTakeawayPlatformViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/8/13.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BindingTakeawayPlatformViewController.h"
#import "MyHandler.h"
#import "TakeAwayPlatformEntity.h"
#import "BindingTakeawayPlatformView.h"
#import "BindingPlatformViewController.h"

@interface BindingTakeawayPlatformViewController ()
@property (nonatomic ,strong)TakeAwayPlatformEntity       *entity;
@property (nonatomic ,strong)BindingTakeawayPlatformView  *v_header;

@end

@implementation BindingTakeawayPlatformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定外卖平台";
}

- (void)onCreate{
    
    self.v_header = [[BindingTakeawayPlatformView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, 140)];
    [self.view addSubview:self.v_header];
    [self.v_header.btn_eleme addTarget:self action:@selector(btn_elemeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_header.btn_meituan
     addTarget:self action:@selector(btn_meituanAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self loadData];
}

- (void)loadData{
    [MyHandler selectBindingTakeAwayPlatformPrepare:^{
        
    } success:^(id obj) {
        self.entity = (TakeAwayPlatformEntity *)obj;
        if (self.entity.elemeShopName.length > 0) {
            [self.v_header.lb_eleme_title setText:@"已授权绑定"];
            [self.v_header.lb_eleme_detail setText:[NSString stringWithFormat:@"饿了么门店  (%@)",self.entity.elemeShopName]];
            self.v_header.btn_eleme.enabled = NO;
        }else{
            [self.v_header.lb_eleme_title setText:@"未授权绑定"];
            [self.v_header.lb_eleme_detail setText:@"点击绑定饿了么外卖"];
            self.v_header.btn_eleme.enabled = YES;
        }
        
        if (self.entity.meituanShopName.length > 0) {
            [self.v_header.lb_meituan_title setText:@"已授权绑定"];
            [self.v_header.lb_meituan_detail setText:[NSString stringWithFormat:@"美团门店  (%@)",self.entity.meituanShopName]];
        }else{
            [self.v_header.lb_meituan_title setText:@"未授权绑定"];
            [self.v_header.lb_meituan_detail setText:@"点击绑定美团外卖"];
        }
    } failed:^(NSInteger statusCode, id json) {
        
    }];
}

- (void)btn_elemeAction{
    BindingPlatformViewController *vc = [[BindingPlatformViewController alloc]init];
    vc.str_title = @"绑定饿了么";
    vc.str_Url = self.entity.elemeUrl;
    [self.navigationController pushViewController:vc animated:YES];
    vc.bindingPlatformComplete = ^{
        [self loadData];
    };
}

- (void)btn_meituanAction{
    BindingPlatformViewController *vc = [[BindingPlatformViewController alloc]init];
    if (self.entity.meituanShopName.length > 0) {
        //说明已绑定  点进去解绑
        vc.str_Url = self.entity.meituanUnbindUrl;
        vc.str_title = @"解绑美团";
    }else{
        //说明未绑定  点进绑定
        vc.str_Url = self.entity.meituanUrl;
        vc.str_title = @"绑定美团";
    }
    [self.navigationController pushViewController:vc animated:YES];
    vc.bindingPlatformComplete = ^{
        [self loadData];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
