//
//  TiXianiewController.h
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/29.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseViewController.h"
typedef enum : int {
    TiXianGouku = 1,
    TiXianELeMe = 2,
    TiXianMt    = 3,
} TiXianType;
@interface TiXianiewController : BaseViewController

@property (nonatomic ,strong)NSString     *cardName;
@property (nonatomic ,strong)NSString     *cardNum;
@property (nonatomic ,assign)double       ketixianPrice;
@property (nonatomic ,assign)double       lowPrice;
@property (nonatomic ,assign)int          tixianCount;
@property (nonatomic ,assign)TiXianType   tixianType;

@end
