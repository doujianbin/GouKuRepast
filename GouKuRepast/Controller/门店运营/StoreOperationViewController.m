//
//  StoreOperationViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/11.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "StoreOperationViewController.h"
#import "SupplierOrderHandler.h"
#import "ShopOutOrderCountEntity.h"
#import "JWBluetoothManage.h"
#import "TabBarViewController.h"
#import "MyHandler.h"
#import "SettlementViewController.h"
#import "CommodityViewController.h"
#import "BindingTakeawayPlatformViewController.h"

@interface StoreOperationViewController (){
    JWBluetoothManage * manage;
}

@property (nonatomic ,strong)UIView     *v_1;
@property (nonatomic ,strong)UIView     *v_2;
@property (nonatomic ,strong)UIView     *v_3;
@property (nonatomic ,strong)UILabel    *lab_todayTotal;
@property (nonatomic ,strong)UILabel    *lab_todayOrderCount;
@property (nonatomic ,strong)UILabel    *lab_goukuShouKuan;
@property (nonatomic ,strong)UILabel    *lab_crashShouKuan;
@property (nonatomic ,strong)UILabel    *lab_waimaiOrder;
@property (nonatomic ,strong)UILabel    *lab_tangshiOrder;

@end

@implementation StoreOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    manage = [JWBluetoothManage sharedInstance];
}

- (void)onCreate{
    UIView *v_status = [[UIView alloc]init];
    if (iPhoneX) {
        [v_status setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    }else{
        [v_status setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    }
    [self.view addSubview:v_status];
    [v_status setBackgroundColor:[UIColor colorWithHexString:@"#38393E"]];
    
    self.v_1 = [[UIView alloc]initWithFrame:CGRectMake(0, v_status.bottom, SCREEN_WIDTH, 98)];
    [self.view addSubview:self.v_1];
    [self.v_1 setBackgroundColor:[UIColor colorWithHexString:@"#3E4A60"]];
    
    self.lab_todayTotal = [[UILabel alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH / 2, 27)];
    [self.v_1 addSubview:self.lab_todayTotal];
    [self.lab_todayTotal setTextColor: [UIColor whiteColor]];
    [self.lab_todayTotal setTextAlignment:NSTextAlignmentCenter];
    [self.lab_todayTotal setFont:[UIFont boldSystemFontOfSize:24]];
//    [self.lab_todayTotal setText:@"¥2000.00"];
    
    UILabel *todayTotal = [[UILabel alloc]initWithFrame:CGRectMake(0, self.lab_todayTotal.bottom + 1, SCREEN_WIDTH / 2, 20)];
    [self.v_1 addSubview:todayTotal];
    [todayTotal setTextColor: [UIColor whiteColor]];
    [todayTotal setTextAlignment:NSTextAlignmentCenter];
    [todayTotal setFont:[UIFont systemFontOfSize:14]];
    [todayTotal setText:@"今日堂食收入"];
    
    self.lab_todayOrderCount = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, 36, SCREEN_WIDTH / 2, 27)];
    [self.v_1 addSubview:self.lab_todayOrderCount];
    [self.lab_todayOrderCount setTextColor: [UIColor whiteColor]];
    [self.lab_todayOrderCount setTextAlignment:NSTextAlignmentCenter];
    [self.lab_todayOrderCount setFont:[UIFont boldSystemFontOfSize:24]];
//    [self.lab_todayOrderCount setText:@"56"];
    
    UILabel *todayOrderCount = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, self.lab_todayOrderCount.bottom + 1, SCREEN_WIDTH / 2, 20)];
    [self.v_1 addSubview:todayOrderCount];
    [todayOrderCount setTextColor: [UIColor whiteColor]];
    [todayOrderCount setTextAlignment:NSTextAlignmentCenter];
    [todayOrderCount setFont:[UIFont systemFontOfSize:14]];
    [todayOrderCount setText:@"今日总订单"];
    
    self.v_2 = [[UIView alloc]initWithFrame:CGRectMake(0, self.v_1.bottom, SCREEN_WIDTH, 119)];
    [self.view addSubview:self.v_2];
    [self.v_2 setBackgroundColor:[UIColor whiteColor]];

    UIImageView *img_heng = [[UIImageView alloc]initWithFrame:CGRectMake(0, 119 / 2, SCREEN_WIDTH, 0.5)];
    [self.v_2 addSubview:img_heng];
    [img_heng setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];

    UIImageView *img_shu1 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, 10, 0.5, 41)];
    [self.v_2 addSubview:img_shu1];
    [img_shu1 setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];

    UIImageView *img_shu2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 , img_heng.bottom + 10, 0.5, 41)];
    [self.v_2 addSubview:img_shu2];
    [img_shu2 setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];

    self.lab_goukuShouKuan = [[UILabel alloc]initWithFrame:CGRectMake(0, 13, SCREEN_WIDTH / 2, 17)];
    [self.v_2 addSubview:self.lab_goukuShouKuan];
    [self.lab_goukuShouKuan setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [self.lab_goukuShouKuan setTextAlignment:NSTextAlignmentCenter];
    [self.lab_goukuShouKuan setFont:[UIFont systemFontOfSize:16]];
//    [self.lab_goukuShouKuan setText:@"¥1000.00"];

    UILabel *goukuShouKuan = [[UILabel alloc]initWithFrame:CGRectMake(0, self.lab_goukuShouKuan.bottom + 3, SCREEN_WIDTH / 2, 14)];
    [self.v_2 addSubview:goukuShouKuan];
    [goukuShouKuan setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [goukuShouKuan setTextAlignment:NSTextAlignmentCenter];
    [goukuShouKuan setFont:[UIFont systemFontOfSize:10]];
    [goukuShouKuan setText:@"购酷支付收款"];

    self.lab_waimaiOrder = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, 13, SCREEN_WIDTH / 2, 17)];
    [self.v_2 addSubview:self.lab_waimaiOrder];
    [self.lab_waimaiOrder setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [self.lab_waimaiOrder setTextAlignment:NSTextAlignmentCenter];
    [self.lab_waimaiOrder setFont:[UIFont systemFontOfSize:16]];
//    [self.lab_waimaiOrder setText:@"20"];

    UILabel *waimaiOrder = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, self.lab_waimaiOrder.bottom + 3, SCREEN_WIDTH / 2, 14)];
    [self.v_2 addSubview:waimaiOrder];
    [waimaiOrder setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [waimaiOrder setTextAlignment:NSTextAlignmentCenter];
    [waimaiOrder setFont:[UIFont systemFontOfSize:10]];
    [waimaiOrder setText:@"外卖订单"];

    self.lab_crashShouKuan = [[UILabel alloc]initWithFrame:CGRectMake(0, img_heng.bottom + 13, SCREEN_WIDTH / 2, 17)];
    [self.v_2 addSubview:self.lab_crashShouKuan];
    [self.lab_crashShouKuan setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [self.lab_crashShouKuan setTextAlignment:NSTextAlignmentCenter];
    [self.lab_crashShouKuan setFont:[UIFont systemFontOfSize:16]];
//    [self.lab_crashShouKuan setText:@"¥1000.00"];

    UILabel *crashShouKuan = [[UILabel alloc]initWithFrame:CGRectMake(0, self.lab_crashShouKuan.bottom + 3, SCREEN_WIDTH / 2, 14)];
    [self.v_2 addSubview:crashShouKuan];
    [crashShouKuan setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [crashShouKuan setTextAlignment:NSTextAlignmentCenter];
    [crashShouKuan setFont:[UIFont systemFontOfSize:10]];
    [crashShouKuan setText:@"现金收款"];

    self.lab_tangshiOrder = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, img_heng.bottom + 13, SCREEN_WIDTH / 2, 17)];
    [self.v_2 addSubview:self.lab_tangshiOrder];
    [self.lab_tangshiOrder setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [self.lab_tangshiOrder setTextAlignment:NSTextAlignmentCenter];
    [self.lab_tangshiOrder setFont:[UIFont systemFontOfSize:16]];
//    [self.lab_tangshiOrder setText:@"36"];

    UILabel *tangshiOrder = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, self.lab_tangshiOrder.bottom + 3,SCREEN_WIDTH / 2, 14)];
    [self.v_2 addSubview:tangshiOrder];
    [tangshiOrder setTextColor: [UIColor colorWithHexString:@"#4A4A4A"]];
    [tangshiOrder setTextAlignment:NSTextAlignmentCenter];
    [tangshiOrder setFont:[UIFont systemFontOfSize:10]];
    [tangshiOrder setText:@"堂食订单"];
    
    self.v_3 = [[UIView alloc]initWithFrame:CGRectMake(0, self.v_2.bottom + 10, SCREEN_WIDTH, 99)];
    [self.view addSubview:self.v_3];
    [self.v_3 setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *storeManager = [[UILabel alloc]initWithFrame:CGRectMake(18, 5, 100, 20)];
    [self.v_3 addSubview:storeManager];
    [storeManager setText:@"门店管理"];
    [storeManager setTextColor:[UIColor colorWithHexString:@"#4A4A4A"]];
    [storeManager setFont:[UIFont boldSystemFontOfSize:14]];
    
    UIImageView *img_heng_v3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 0.5)];
    [self.v_3 addSubview:img_heng_v3];
    [img_heng_v3 setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];
    
    
    UIButton *btn_commodity = [[UIButton alloc]initWithFrame:CGRectMake(0, img_heng_v3.bottom + 5, SCREEN_WIDTH / 4, 62)];
    [self.v_3 addSubview:btn_commodity];
    [btn_commodity addTarget:self action:@selector(commodity) forControlEvents:UIControlEventTouchUpInside];
    [btn_commodity setTitle:@"商品管理" forState:UIControlStateNormal];
    [btn_commodity setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    btn_commodity.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn_commodity setImage:[UIImage imageNamed:@"wares"] forState:UIControlStateNormal];
    [btn_commodity setTitleEdgeInsets:UIEdgeInsetsMake(btn_commodity.imageView.frame.size.height + 6.8 ,-btn_commodity.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn_commodity setImageEdgeInsets:UIEdgeInsetsMake(-btn_commodity.imageView.frame.size.height, 0.0,0.0, -btn_commodity.titleLabel.bounds.size.width)];//图片距离右边框
    
    
    
    UIButton *btn_jiesuan = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 4, img_heng_v3.bottom + 5, SCREEN_WIDTH / 4, 62)];
    [self.v_3 addSubview:btn_jiesuan];
    [btn_jiesuan addTarget:self action:@selector(jiesuan) forControlEvents:UIControlEventTouchUpInside];
    [btn_jiesuan setTitle:@"结算对账" forState:UIControlStateNormal];
    [btn_jiesuan setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    btn_jiesuan.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn_jiesuan setImage:[UIImage imageNamed:@"settlement"] forState:UIControlStateNormal];
    [btn_jiesuan setTitleEdgeInsets:UIEdgeInsetsMake(btn_jiesuan.imageView.frame.size.height + 6.8 ,-btn_jiesuan.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn_jiesuan setImageEdgeInsets:UIEdgeInsetsMake(-btn_jiesuan.imageView.frame.size.height, 0.0,0.0, -btn_jiesuan.titleLabel.bounds.size.width)];//图片距离右边框
    
    
    UIButton *btn_waimaibangding = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, img_heng_v3.bottom + 5, SCREEN_WIDTH / 4, 62)];
    [self.v_3 addSubview:btn_waimaibangding];
    [btn_waimaibangding addTarget:self action:@selector(btn_waimaibangdingAction) forControlEvents:UIControlEventTouchUpInside];
    [btn_waimaibangding setTitle:@"绑定外卖平台" forState:UIControlStateNormal];
    [btn_waimaibangding setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    btn_waimaibangding.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn_waimaibangding setImage:[UIImage imageNamed:@"waimaipingtaibangding"] forState:UIControlStateNormal];
    [btn_waimaibangding setTitleEdgeInsets:UIEdgeInsetsMake(btn_waimaibangding.imageView.frame.size.height + 6.8 ,-btn_waimaibangding.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [btn_waimaibangding setImageEdgeInsets:UIEdgeInsetsMake(-btn_waimaibangding.imageView.frame.size.height, 0.0,0.0, -btn_waimaibangding.titleLabel.bounds.size.width)];//图片距离右边框
    
    UIImageView *img_v3_shu = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 4, img_heng_v3.bottom, 0.5, 67)];
    [self.v_3 addSubview:img_v3_shu];
    [img_v3_shu setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];
    
    UIImageView *img_v3_shu2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2, img_heng_v3.bottom, 0.5, 67)];
    [self.v_3 addSubview:img_v3_shu2];
    [img_v3_shu2 setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];
    
    UIImageView *img_v3_shu3 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 4 * 3, img_heng_v3.bottom, 0.5, 67)];
    [self.v_3 addSubview:img_v3_shu3];
    [img_v3_shu3 setBackgroundColor:[UIColor colorWithHexString:@"#E6E6E6"]];
    
}

- (void)loadData{

    [MyHandler getTodayMsgprepare:^{
        
    } success:^(id obj) {
        NSDictionary *dic = (NSDictionary *)obj;
//        NSLog(@"dic == %@",dic);
        [self.lab_todayTotal setText:[NSString stringWithFormat:@"¥%.2f",[[dic objectForKey:@"sales"] floatValue]]];
        [self.lab_todayOrderCount setText:[NSString stringWithFormat:@"%@",[dic objectForKey:@"orders"]]];
        [self.lab_crashShouKuan setText:[NSString stringWithFormat:@"¥%.2f",[[dic objectForKey:@"cashSales"] floatValue]]];
        [self.lab_goukuShouKuan setText:[NSString stringWithFormat:@"¥%.2f",[[dic objectForKey:@"goukuSales"] floatValue]]];
        [self.lab_waimaiOrder setText:[NSString stringWithFormat:@"%@",[dic objectForKey:@"onlineOrderCount"]]];
        [self.lab_tangshiOrder setText:[NSString stringWithFormat:@"%@",[dic objectForKey:@"storeOrderCount"]]];
        
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    //刷新数据
    [self loadData];
    [SupplierOrderHandler selectOutOrderCountPrepare:^{
        
    } success:^(id obj) {
        ShopOutOrderCountEntity *entity = (ShopOutOrderCountEntity *)obj;
        if (entity.allOrderCount > 0) {
            [(TabBarViewController *)self.tabBarController showBadgeOnItemIndex:0 withCount:entity.allOrderCount];
        }
        if (entity.allOrderCount == 0) {
            [(TabBarViewController *)self.tabBarController hideBadgeOnItemIndex:0];
        }
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
    
    [manage autoConnectLastPeripheralCompletion:^(CBPeripheral *perpheral, NSError *error) {
        if (!error) {
            //            [ProgressShow alertView:self.view Message:@"连接成功" cb:nil];
        }else{
            [ProgressShow alertView:self.view Message:error.domain cb:nil];
        }
    }];
}

- (void)commodity{
    CommodityViewController *vc = [[CommodityViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jiesuan{
    SettlementViewController *vc = [[SettlementViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btn_waimaibangdingAction{
    BindingTakeawayPlatformViewController *vc = [[BindingTakeawayPlatformViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
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
