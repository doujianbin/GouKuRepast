//
//  AppDelegate.h
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/10.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarViewController.h"

static NSString *appKey = @"830270bcca5d93d0be9b6a1e";
static NSString *channel = @"Publish channel";
static BOOL isProduction = FALSE;  // fales 为开发环境  如果上线需改成 true

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)TabBarViewController          *tableBarController;

@end

