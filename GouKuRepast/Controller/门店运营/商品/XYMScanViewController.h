//
//  XYMScanViewController.h
//  healthcoming
//
//  Created by jack xu on 16/11/15.
//  Copyright © 2016年 Franky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "RepastEntity.h"

typedef void(^SaoMiaoComplete)(RepastEntity *repastEntity);
@interface XYMScanViewController : BaseViewController

//扫码框的宽（正方形）
@property(nonatomic,assign)int scanViewW;

@property (nonatomic ,copy)SaoMiaoComplete   saoMiaoComplete;

@end
