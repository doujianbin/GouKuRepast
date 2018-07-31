//
//  XYMScanViewController.m
//  healthcoming
//
//  Created by jack xu on 16/11/15.
//  Copyright © 2016年 Franky. All rights reserved.
//

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#import "XYMScanViewController.h"
#import "XYMScanView.h"
#import <AVFoundation/AVFoundation.h>
#import "RepastCommodityHandler.h"

@interface XYMScanViewController ()<XYMScanViewDelegate>
{
    int line_tag;
    UIView *highlightView;
    NSString *scanMessage;
    BOOL isRequesting;
}

@property (nonatomic,weak) XYMScanView *scanV;

@end

@implementation XYMScanViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"扫码";
    
    XYMScanView *scanV = [[XYMScanView alloc]initWithFrame:CGRectMake(0, NAVIGATIONBAR_VER_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAVIGATIONBAR_VER_HEIGHT)];
    scanV.delegate = self;
    [self.view addSubview:scanV];
    _scanV = scanV;
}

- (void)getScanDataString:(NSString*)scanDataString {
    
    [RepastCommodityHandler getRepastInformationWithBarCode:scanDataString prepare:^{
        [MBProgressHUD showActivityMessageInView:nil];
    } success:^(id obj) {
        RepastEntity *entity = (RepastEntity *)obj;
        [self.navigationController popViewControllerAnimated:YES];
        if (self.saoMiaoComplete) {
            self.saoMiaoComplete(entity);
        }
        [MBProgressHUD hideHUD];
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD hideHUD];
    }];
}


@end
