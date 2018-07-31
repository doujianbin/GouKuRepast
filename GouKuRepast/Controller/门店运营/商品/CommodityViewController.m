//
//  CommodityViewController.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/8.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "CommodityViewController.h"
#import "ManagementClassificationViewController.h"
#import "BaseTableView.h"
#import "CommodityHandler.h"
#import "ShopClassificationEntity.h"
#import "StoreCategoryTableViewCell.h"
#import "CommodityTableViewCell.h"
#import "LoginStorage.h"
#import "RTHttpClient.h"
#import "CommodityBottomView.h"
#import "ManagerCommodityTableViewCell.h"
#import "CommodityStatusView.h"
#import "MoreEditView.h"
#import "NSString+Size.h"
#import "AddCommodityViewController.h"
#import "RepastCommodityHandler.h"
#import "RepastEntity.h"
#import "EditCommodityViewController.h"


#define NULLROW    999

@interface CommodityViewController ()<UITableViewDelegate,UITableViewDataSource,BaseTableViewDelagate,UITextFieldDelegate>

@property (nonatomic ,strong)UIButton         *btn_top;
@property (nonatomic ,strong)UIView           *view_bottom;
@property (nonatomic ,strong)UIButton         *btn_managementClassification;
@property (nonatomic ,strong)UIButton         *btn_buildCommodity;
@property (nonatomic ,strong)UIImageView      *img_shu;

@property (nonatomic ,strong)BaseTableView    *tb_left;
@property (nonatomic ,strong)BaseTableView    *tb_right;
@property (nonatomic ,strong)NSMutableArray   *arr_category;
@property (nonatomic ,strong)NSMutableArray    *arr_selected;
@property (nonatomic ,strong)NSMutableArray   *arr_commodity;
@property (nonatomic ,strong)NSMutableArray   *commodityArr;
@property (nonatomic ,assign)int               selectedSection;
@property (nonatomic ,assign)int               selectedRow;
@property (nonatomic ,assign)int               showIndex;

@property (nonatomic ,strong)UIButton         *btn_navright_search;
@property (nonatomic ,strong)UIButton         *btn_navright_more;
@property (nonatomic ,strong)UIButton         *btn_batchManager;

@property (nonatomic ,strong)CommodityBottomView           *v_bottom_manager;
@property (nonatomic ,assign)BOOL              editStatus;
@property (nonatomic ,strong)UILabel           *lb_selectedNum;
@property (nonatomic ,strong)UIView            *v_coverLeft;
//@property (nonatomic ,strong)MoveCommodityView             *v_moveCommodity;
@property (nonatomic ,strong)CommodityStatusView           *v_commodityStatusView;
@property (nonatomic ,strong)MoreEditView                  *v_moreEdit;

@property (nonatomic ,strong)NSNumber          *btnIndex;

@property (nonatomic ,strong)UIAlertController *alertController;

@end

@implementation CommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn_top = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH / 2, 44)];
    [self.btn_top setTitle:@"全部商品" forState:UIControlStateNormal];
    [self.btn_top setImage:[UIImage imageNamed:@"triangle_down_white"] forState:UIControlStateNormal];
    [self.btn_top setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.btn_top.imageView.frame.size.width, 0, self.btn_top.imageView.frame.size.width)];
    [self.btn_top setImageEdgeInsets:UIEdgeInsetsMake(0, self.btn_top.titleLabel.bounds.size.width + 10, 0, -self.btn_top.titleLabel.bounds.size.width)];
    self.navigationItem.titleView = self.btn_top;
    [self.btn_top addTarget:self action:@selector(btn_topAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(searchBarAction)];
    [btn_right setImage:[UIImage imageNamed:@"home_search"]];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
    
    ///*****************************            批量管理注掉的
     self.btn_navright_search = [UIButton buttonWithType:(UIButtonTypeCustom)];
     [self.btn_navright_search setImage:[UIImage imageNamed:@"search_white"] forState:UIControlStateNormal];
     [self.btn_navright_search addTarget:self action:@selector(searchBarAction) forControlEvents:UIControlEventTouchUpInside];

     self.btn_navright_more = [UIButton buttonWithType:(UIButtonTypeCustom)];
     [self.btn_navright_more setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
     [self.btn_navright_more addTarget:self action:@selector(moreAction) forControlEvents:UIControlEventTouchUpInside];

     self.btn_navright_search.frame = CGRectMake(0, 0, 20, 20);
     self.btn_navright_more.frame=CGRectMake(0, 0, 22, 6);

     [self setNavUI];
}



- (void)setNavUI{
    if (self.editStatus == NO) {
        self.navigationItem.titleView = self.btn_top;
        UIBarButtonItem *pulish = [[UIBarButtonItem alloc] initWithCustomView:self.btn_navright_search];
        UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithCustomView:self.btn_navright_more];
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:save, pulish,nil]];
    }else{
        self.navigationItem.titleView = self.lb_selectedNum;
        UIBarButtonItem *confirm = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(confirmAction)];
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:confirm,nil]];
    }
}

- (void)onCreate{
    self.selectedRow = NULLROW;
    self.selectedSection = NULLROW;
    self.showIndex = NULLROW;
    self.btnIndex = [NSNumber numberWithInt:999];
    
    self.arr_category = [NSMutableArray array];
    self.arr_commodity = [NSMutableArray array];
    self.arr_selected = [NSMutableArray array];
    self.commodityArr = [NSMutableArray array];
    
    self.view_bottom = [[UIView alloc]init];
    [self.view addSubview:self.view_bottom];
    [self.view_bottom setBackgroundColor:[UIColor whiteColor]];
    [self.view_bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SCREEN_HEIGHT - 50 - SafeAreaBottomHeight);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(50);
    }];
    self.view_bottom.layer.shadowColor = [UIColor colorWithHexString:@"#d8d8d8"].CGColor;//shadowColor阴影颜色
    self.view_bottom.layer.shadowOffset = CGSizeMake(0,-3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.view_bottom.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.view_bottom.layer.shadowRadius = 4;//阴影半径，默认3
    
    self.btn_managementClassification = [[UIButton alloc]init];
    [self.view_bottom addSubview:self.btn_managementClassification];
    [self.btn_managementClassification setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
    [self.btn_managementClassification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH / 2 - 0.5);
        make.height.mas_equalTo(50);
    }];
    [self.btn_managementClassification setTitle:@"管理分类" forState:UIControlStateNormal];
    [self.btn_managementClassification setImage:[UIImage imageNamed:@"manager"] forState:UIControlStateNormal];
    [self.btn_managementClassification setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20, 0.0, 0.0)];
    self.btn_managementClassification.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.btn_managementClassification addTarget:self action:@selector(btn_managementClassificationAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.img_shu = [[UIImageView alloc]init];
    [self.view_bottom addSubview:self.img_shu];
    [self.img_shu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SCREEN_WIDTH / 2 - 0.5);
        make.height.equalTo(self.btn_managementClassification);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(1);
    }];
    [self.img_shu setBackgroundColor:[UIColor colorWithHexString:@"#d8d8d8"]];
    
    
    self.btn_buildCommodity = [[UIButton alloc]init];
    [self.view_bottom addSubview:self.btn_buildCommodity];
    [self.btn_buildCommodity setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
    [self.btn_buildCommodity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(SCREEN_WIDTH / 2);
        make.width.mas_equalTo(SCREEN_WIDTH / 2 - 0.5);
        make.height.mas_equalTo(50);
    }];
    [self.btn_buildCommodity setTitle:@"新建商品" forState:UIControlStateNormal];
    [self.btn_buildCommodity setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [self.btn_buildCommodity setImageEdgeInsets:UIEdgeInsetsMake(0.0, -20, 0.0, 0.0)];
    self.btn_buildCommodity.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.btn_buildCommodity addTarget:self action:@selector(btn_buildCommodityAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.tb_left = [[BaseTableView alloc]initWithFrame:CGRectMake(0,SafeAreaTopHeight, 100, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - 50) style:UITableViewStyleGrouped hasHeaderRefreshing:NO hasFooterRefreshing:NO];
    self.tb_left.dataSource = self;
    self.tb_left.delegate = self;
    self.tb_left.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_left.tableViewDelegate = self;
    self.tb_left.hideErrorBackView = YES;
    [self.view addSubview:self.tb_left];
    
    self.tb_right = [[BaseTableView alloc]initWithFrame:CGRectMake(100, SafeAreaTopHeight,SCREEN_WIDTH - 100, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - 50) style:UITableViewStyleGrouped hasHeaderRefreshing:YES hasFooterRefreshing:NO];
    self.tb_right.dataSource = self;
    self.tb_right.delegate = self;
    self.tb_right.tableViewDelegate = self;
    self.tb_right.hideErrorBackView = YES;
    self.tb_right.separatorColor = [UIColor clearColor];
    self.tb_right.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tb_right];
    
    if (self.enterFormType == EnterFromActice) {
        [self.view_bottom setHidden:YES];
        [self.tb_left setFrame:CGRectMake(0,SafeAreaTopHeight, 100, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight)];
        [self.tb_right setFrame:CGRectMake(100, SafeAreaTopHeight,SCREEN_WIDTH - 100, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight)];
    }else{
        [self.view_bottom setHidden:NO];
        [self.tb_left setFrame:CGRectMake(0,SafeAreaTopHeight, 100, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - 50)];
        [self.tb_right setFrame:CGRectMake(100, SafeAreaTopHeight,SCREEN_WIDTH - 100, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight - 50)];
    }
    
    self.v_commodityStatusView = [[CommodityStatusView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight)];
    [self.view addSubview:self.v_commodityStatusView];
    [self.v_commodityStatusView.btn_chushou addTarget:self action:@selector(btn_chushouAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_commodityStatusView.btn_shouwan addTarget:self action:@selector(btn_shouwanAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_commodityStatusView.btn_xiajia addTarget:self action:@selector(btn_xiajiaAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_commodityStatusView.btn_all addTarget:self action:@selector(btn_allAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_commodityStatusView setHidden:YES];
    
    UITapGestureRecognizer *tgp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(statusViewDissmiss)];
    [self.v_commodityStatusView addGestureRecognizer:tgp];
    
   
     self.btn_batchManager = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 136, SafeAreaTopHeight, 120, 44)];
     [self.view addSubview:self.btn_batchManager];
     [self.btn_batchManager setTitle:@"批量操作" forState:UIControlStateNormal];
     self.btn_batchManager.titleLabel.font = [UIFont systemFontOfSize:14];
     [self.btn_batchManager setTitleColor:[UIColor colorWithHexString:@"4167b2"] forState:UIControlStateNormal];
     [self.btn_batchManager setHidden:YES];
     self.btn_batchManager.clipsToBounds = YES;
     self.btn_batchManager.layer.cornerRadius = 3;
     self.btn_batchManager.layer.masksToBounds = YES;
     self.btn_batchManager.layer.borderColor = [[UIColor colorWithHexString:@"#d8d8d8"] CGColor];
    [self.btn_batchManager setBackgroundColor:[UIColor whiteColor]];
     self.btn_batchManager.layer.borderWidth = 0.5;
     [self.btn_batchManager addTappedWithTarget:self action:@selector(btn_batchManagerAction)];
     
     self.v_bottom_manager = [[CommodityBottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - SafeAreaBottomHeight - 49, SCREEN_WIDTH, 49)];
     [self.v_bottom_manager setBackgroundColor:[UIColor whiteColor]];
     [self.view addSubview:self.v_bottom_manager];
     [self.v_bottom_manager setHidden:YES];
     [self.v_bottom_manager.btn_bottom_allSelect addTarget:self action:@selector(btn_bottom_allSelect) forControlEvents:UIControlEventTouchUpInside];
     [self.v_bottom_manager.btn_bottom_shangjia addTarget:self action:@selector(btn_bottom_shangjiaAction) forControlEvents:UIControlEventTouchUpInside];
     [self.v_bottom_manager.btn_bottom_xiajia addTarget:self action:@selector(btn_bottom_xiajiaAction) forControlEvents:UIControlEventTouchUpInside];
     [self.v_bottom_manager.btn_bottom_delete addTarget:self action:@selector(btn_bottom_delete) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.enterFormType == EnterFromActice) {
        [self.view_bottom setHidden:YES];
    }else{
        [self.view_bottom setHidden:NO];
    }
    
    self.v_moreEdit = [[MoreEditView alloc]initWithFrame:CGRectMake(0, 0, 120, 132)];
    [self.v_moreEdit.btn_delege addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_moreEdit.btn_shangjia addTarget:self action:@selector(shangjiaAction) forControlEvents:UIControlEventTouchUpInside];
    [self.v_moreEdit.btn_xiajia addTarget:self action:@selector(xiajiaAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.v_moreEdit];
    [self.v_moreEdit setHidden:YES];
    
    [self loadData];
    
}

- (void)btn_managementClassificationAction{
    ManagementClassificationViewController *vc
    = [[ManagementClassificationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.updateCateGory = ^{
        [self loadData];
    };
}

- (void)btn_buildCommodityAction{
    //新建商品
    
    ShopClassificationEntity *entityDemo = [self.arr_category objectAtIndex:self.selectedSection];
    if (self.selectedRow != NULLROW) {
        entityDemo = [entityDemo.childList objectAtIndex:self.selectedRow];
    }
    
    AddCommodityViewController *vc = [[AddCommodityViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.addRepastCommodityComplete = ^(RepastEntity *entity) {
        if ([entityDemo.name isEqualToString:entity.categoryName]) {
            [self.arr_commodity insertObject:entity atIndex:self.arr_commodity.count];
            [self.tb_right reloadData];
        }
    };
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//
//    if (![textField.text isEqualToString:@""]) {
//        [self.alertController dismissViewControllerAnimated:YES completion:^{
//
//        }];
//        [CommodityHandler getCommodityInformationWithBarCode:textField.text prepare:nil success:^(id obj) {
//            NSDictionary *dic = (NSDictionary *)obj;
//            if ([[dic objectForKey:@"errCode"] intValue] == 0) {
//                CommodityFromCodeEntity *entity = [CommodityFromCodeEntity parseCommodityFromCodeEntityWithJson:[dic objectForKey:@"data"]];
//                AddNewCommodityViewController *vc = [[AddNewCommodityViewController alloc]init];
//                vc.comeFrom = @"新建商品";
//                vc.entityInformation = entity;
//                [self.navigationController pushViewController:vc animated:YES];
//                vc.addCommodityFinish = ^{
//                    [self addCommoditySingle];
//                };
//            }else{
//                [MBProgressHUD hideHUD];
//                [MBProgressHUD showErrorMessage:[dic objectForKey:@"errMessage"]];
//                [self addCommoditySingle];
//            }
//        } failed:^(NSInteger statusCode, id json) {
//            [MBProgressHUD showErrorMessage:(NSString *)json];
//        }];
//    }else{
//        [MBProgressHUD showInfoMessage:@"请输入条形码"];
//    }
//    return YES;
//}
//门店分类列表
- (void)loadData{
    
    [CommodityHandler getCommodityCategoryWithShopId:[LoginStorage GetShopId]  prepare:nil success:^(id obj) {
        NSArray *arr_data = (NSArray *)obj;
        [self.arr_category removeAllObjects];
        [self.arr_category addObjectsFromArray:arr_data];
        self.selectedSection = 0;
        self.selectedRow = NULLROW;
        [self.tb_left reloadData];
        [self.tb_right requestDataSource];
    } failed:^(NSInteger statusCode, id json) {
        
        [MBProgressHUD showErrorMessage:(NSString *)json];
        
    }];
    
}

#pragma uitableview

- (void)tableView:(UITableView *)tableView requestDataSourceWithPageNum:(NSInteger)pageNum complete:(DataCompleteBlock)complete{
    if (self.arr_category.count <= self.selectedSection) {
        if (complete) {
            complete(CompleteBlockErrorCode);
        }
        return;
    }

    ShopClassificationEntity *entity = [self.arr_category objectAtIndex:self.selectedSection];
    if (self.selectedRow != NULLROW) {
        entity = [entity.childList objectAtIndex:self.selectedRow];
    }

    [RepastCommodityHandler repastCommodityListWithKeyWord:nil categoryId:[NSNumber numberWithInteger:entity._id] status:self.btnIndex prepare:^{
        
    } success:^(id obj) {
        if (pageNum == 0) {
            [self.arr_commodity removeAllObjects];
        }
        [self.arr_commodity addObjectsFromArray:(NSArray *)obj];
        [self.tb_right reloadData];
        complete([(NSArray *)obj count]);
        if (self.arr_commodity.count == 0) {
            self.tb_right.defaultView = [[TableBackgroudView alloc] initWithFrame:self.tb_right.frame withDefaultImage:nil withNoteTitle:@"暂无数据" withNoteDetail:nil withButtonAction:nil];
        }
    } failed:^(NSInteger statusCode, id json) {
        if (complete) {
            complete(CompleteBlockErrorCode);
        }
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == self.tb_left) {
        return 55;
    }else{
        return 0.01;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == self.tb_left) {
        UIView *v_header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 55)];
        v_header.userInteractionEnabled = YES;
        v_header.tag = section;
        [v_header addTappedWithTarget:self action:@selector(selectCategory:)];
        UILabel  *lab_categoryName = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 55)];
        [v_header addSubview:lab_categoryName];
        lab_categoryName.font = [UIFont systemFontOfSize:14];
        [lab_categoryName setTextColor:[UIColor colorWithHexString:@"#616161"]];
        
        UIImageView *img_shu = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 4, 55)];
        [v_header addSubview:img_shu];
        [img_shu setBackgroundColor:[UIColor colorWithHexString:@"#4167b2"]];
        
        UIImageView *iv_arrow = [[UIImageView alloc]initWithFrame:CGRectMake(100 - 11 - 9, 55/2 - 11/2, 11, 7)];
        [v_header addSubview:iv_arrow];
        
        ShopClassificationEntity *entity = [self.arr_category objectAtIndex:section];
        lab_categoryName.text = entity.name;
        if (self.selectedSection == section && self.selectedRow == NULLROW && entity.childList.count == 0) {
            [img_shu setHidden:NO];
            [lab_categoryName setTextColor:[UIColor colorWithHexString:@"#4167b2"]];
            [v_header setBackgroundColor:[UIColor whiteColor]];
        }else{
            [img_shu setHidden:YES];
            [lab_categoryName setTextColor:[UIColor colorWithHexString:@"#616161"]];
            [v_header setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
        }
        
        if (entity.isShow == YES) {
            [iv_arrow setImage:[UIImage imageNamed:@"up_icon"]];
        }else{
            UIImage *im_arrow = [UIImage imageNamed:@"up_icon"];
            [iv_arrow setImage:[self image:im_arrow rotation:UIImageOrientationDown]];
        }
        
        if (entity.childList.count == 0) {
            [iv_arrow setHidden:YES];
        }else{
            [iv_arrow setHidden:NO];
        }
        if(self.selectedSection == section && self.selectedRow == NULLROW){
            [img_shu setHidden:NO];
            [lab_categoryName setTextColor:[UIColor colorWithHexString:@"#4167b2"]];
            [v_header setBackgroundColor:[UIColor whiteColor]];
        }
        return v_header;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tb_left) {
        return 55;
    }else{
        if (self.editStatus == YES) {
            return 80;
        }else{
            RepastEntity *entity = [self.arr_commodity objectAtIndex:indexPath.row];
            CGFloat width = SCREEN_WIDTH - 100 - 86;
            CGFloat nameHeight = [entity.name fittingLabelHeightWithWidth:width andFontSize:[UIFont boldSystemFontOfSize:16]];
            
            return nameHeight + 92;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tb_left) {
        ShopClassificationEntity *entity = [self.arr_category objectAtIndex:section];
        if (entity.isShow == YES) {
            return entity.childList.count;
        }else{
            return 0;
        }
    }else if (tableView == self.tb_right){
        return self.arr_commodity.count;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.tb_left) {
        return self.arr_category.count;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.tb_left == tableView) {
        static NSString *CellIdentifier = @"StoreCategoryTableViewCell";
        StoreCategoryTableViewCell *cell = (StoreCategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[StoreCategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        ShopClassificationEntity *entity = [self.arr_category objectAtIndex:indexPath.section];
        ShopClassificationEntity *entity_small = [entity.childList objectAtIndex:indexPath.row];
        cell.lab_categoryName.text = entity_small.name;
        if (self.selectedRow == indexPath.row && self.selectedSection == indexPath.section) {
            [cell.img_shu setHidden:NO];
            cell.backgroundColor = [UIColor whiteColor];
            [cell.lab_categoryName setTextColor:[UIColor colorWithHexString:@"#4167b2"]];
        }else{
            [cell.img_shu setHidden:YES];
            cell.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
            [cell.lab_categoryName setTextColor:[UIColor colorWithHexString:@"#616161"]];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(self.tb_right == tableView){
        if (self.editStatus == YES) {
            static NSString *CellIdentifier = @"ManagerCommodityTableViewCell";
            ManagerCommodityTableViewCell *cell = (ManagerCommodityTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell){
                cell = [[ManagerCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            RepastEntity *entity = [self.arr_commodity objectAtIndex:indexPath.row];
            [cell contentCellInAllCommodityWithCommodityInformationEntity:entity];
            if ([self.arr_selected containsObject:[NSNumber numberWithInt:(int)indexPath.row]]) {
                cell.btn_select.selected = YES;
            }else{
                cell.btn_select.selected = NO;
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            static NSString *CellIdentifier = @"PotentialStoreTableViewCell";
            CommodityTableViewCell *cell = (CommodityTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell){
                cell = [[CommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            RepastEntity *entity = [self.arr_commodity objectAtIndex:indexPath.row];
            [cell contentCellWithCommodityInformationEntity:entity];
            cell.btn_more.tag = indexPath.row;
            cell.btn_edit.tag = indexPath.row;
            [cell.btn_more addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.btn_edit addTarget:self action:@selector(edtiAction:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    return NULL;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.showIndex = NULLROW;
    [self.v_moreEdit setHidden:YES];
    if (tableView == self.tb_left) {
        self.selectedSection = (int)indexPath.section;
        self.selectedRow = (int)indexPath.row;
        [self.tb_left reloadData];
        //加载右边数据
        [self.arr_selected removeAllObjects];
        [self.tb_right requestDataSource];
    }else if (tableView == self.tb_right){
        if (self.enterFormType == EnterFromActice) {
            if (self.selectCommodity) {
                CommodityFromCodeEntity *entity = [self.arr_commodity objectAtIndex:indexPath.row];
                self.selectCommodity(entity);
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
        NSNumber *number = [NSNumber numberWithInt:(int)indexPath.row];
        if ([self.arr_selected containsObject:number]) {
            [self.arr_selected removeObject:number];
        }else{
            [self.arr_selected addObject:number];
        }
        [self.tb_right reloadData];
        self.v_bottom_manager.btn_bottom_allSelect.selected = NO;
         
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tb_right) {
        self.showIndex = NULLROW;
        [self.v_moreEdit setHidden:YES];
    }
}

- (void)selectCategory:(UITapGestureRecognizer *)tap{
    UIView *v_sender = [tap view];
    ShopClassificationEntity *entity = [self.arr_category objectAtIndex:v_sender.tag];self.selectedSection = (int)v_sender.tag;
    self.selectedRow = NULLROW;
    entity.isShow = !entity.isShow;
    [self.arr_category replaceObjectAtIndex:v_sender.tag withObject:entity];
    [self.tb_left reloadData];
    //加载右边数据
    [self.tb_right requestDataSource];
}

- (void)moreAction:(UIButton *)btn_sender{
    RepastEntity *entity = [self.arr_commodity objectAtIndex:btn_sender.tag];
    if ((int)btn_sender.tag == self.showIndex) {
        [self.v_moreEdit setHidden:YES];
        self.showIndex = NULLROW;
    }else{
        [self.v_moreEdit setHidden:NO];
        self.showIndex = (int)btn_sender.tag;
    }
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [btn_sender convertRect:self.view.bounds toView:window];

    if (entity.status == 1) {
        //status == 1  已上架   显示下架
        [self.v_moreEdit.btn_xiajia setHidden:NO];
        [self.v_moreEdit.btn_shangjia setHidden:YES];
        [self.v_moreEdit.btn_delege setHidden:NO];
        [self.v_moreEdit.btn_xiajia setFrame:CGRectMake(0, 0, 120, 44)];
        [self.v_moreEdit.btn_delege setFrame:CGRectMake(0, 44, 120, 44)];
        [self.v_moreEdit setFrame:CGRectMake(SCREEN_WIDTH - 16 - 120, rect.origin.y + 28, 120, 88)];
    }else if(entity.status == 2){
        //status == 2  已下架   显示上架
        [self.v_moreEdit.btn_xiajia setHidden:YES];
        [self.v_moreEdit.btn_shangjia setHidden:NO];
        [self.v_moreEdit.btn_delege setHidden:NO];
        [self.v_moreEdit.btn_shangjia setFrame:CGRectMake(0, 0, 120, 44)];
        [self.v_moreEdit.btn_delege setFrame:CGRectMake(0, 44, 120, 44)];
        [self.v_moreEdit setFrame:CGRectMake(SCREEN_WIDTH - 16 - 120, rect.origin.y + 28, 120, 88)];
    }
    
}

- (void)edtiAction:(UIButton *)btn_sender{
    RepastEntity *entityDemo = [self.arr_commodity objectAtIndex:btn_sender.tag];
    EditCommodityViewController *vc = [[EditCommodityViewController alloc]init];
    vc.repastEntity = [entityDemo copy];
    [self.navigationController pushViewController:vc animated:YES];
    vc.changeRepastCommodity = ^(RepastEntity *repastEntity) {
        [self.arr_commodity replaceObjectAtIndex:btn_sender.tag withObject:repastEntity];
        [self.tb_right reloadData];
    };
}

//商品状态选择

- (void)btn_allAction{
    self.btnIndex = [NSNumber numberWithInt:999];
    [self.v_commodityStatusView setHidden:YES];
    [self.btn_top setTitle:@"全部商品" forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_all setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
    [self.btn_top setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.btn_top.imageView.frame.size.width, 0, self.btn_top.imageView.frame.size.width)];
    [self.btn_top setImageEdgeInsets:UIEdgeInsetsMake(0, self.btn_top.titleLabel.bounds.size.width + 10, 0, -self.btn_top.titleLabel.bounds.size.width)];
    [self.v_commodityStatusView.btn_chushou setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_xiajia setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_shouwan setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.tb_right requestDataSource];
    
}

- (void)btn_chushouAction{
    self.btnIndex = [NSNumber numberWithInt:1];
    [self.v_commodityStatusView setHidden:YES];
    [self.btn_top setTitle:@"出售中" forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_all setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.btn_top setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.btn_top.imageView.frame.size.width, 0, self.btn_top.imageView.frame.size.width)];
    [self.btn_top setImageEdgeInsets:UIEdgeInsetsMake(0, self.btn_top.titleLabel.bounds.size.width + 10, 0, -self.btn_top.titleLabel.bounds.size.width)];
    [self.v_commodityStatusView.btn_chushou setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_xiajia setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_shouwan setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.tb_right requestDataSource];
    
}

- (void)btn_shouwanAction{
    self.btnIndex = [NSNumber numberWithInt:2];
    [self.v_commodityStatusView setHidden:YES];
    [self.btn_top setTitle:@"已售罄" forState:UIControlStateNormal];
    [self.btn_top setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.btn_top.imageView.frame.size.width, 0, self.btn_top.imageView.frame.size.width)];
    [self.btn_top setImageEdgeInsets:UIEdgeInsetsMake(0, self.btn_top.titleLabel.bounds.size.width + 10, 0, -self.btn_top.titleLabel.bounds.size.width)];
    [self.v_commodityStatusView.btn_all setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_chushou setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_xiajia setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_shouwan setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
    [self.tb_right requestDataSource];
}

- (void)btn_xiajiaAction{
    self.btnIndex = [NSNumber numberWithInt:3];
    [self.v_commodityStatusView setHidden:YES];
    [self.btn_top setTitle:@"已下架" forState:UIControlStateNormal];
    [self.btn_top setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.btn_top.imageView.frame.size.width, 0, self.btn_top.imageView.frame.size.width)];
    [self.btn_top setImageEdgeInsets:UIEdgeInsetsMake(0, self.btn_top.titleLabel.bounds.size.width + 10, 0, -self.btn_top.titleLabel.bounds.size.width)];
    [self.v_commodityStatusView.btn_all setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_chushou setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_xiajia setTitleColor:[UIColor colorWithHexString:@"#4167b2"] forState:UIControlStateNormal];
    [self.v_commodityStatusView.btn_shouwan setTitleColor:[UIColor colorWithHexString:@"#000000"] forState:UIControlStateNormal];
    [self.tb_right requestDataSource];
}

- (void)deleteAction{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"商品删除后无法恢复，再次销售需重新录入。确定删除" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *forgetPassword = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.v_moreEdit setHidden:YES];
    }];
    UIAlertAction *again = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        RepastEntity *entity = [self.arr_commodity objectAtIndex:self.showIndex];
        [RepastCommodityHandler repastCommodityDeleteWithSpu:entity.spu prepare:^{
            
        } success:^(id obj) {
            [MBProgressHUD showSuccessMessage:@"删除成功"];
            [self.arr_commodity removeObjectAtIndex:self.showIndex];
            [self.tb_right reloadData];
            self.showIndex = NULLROW;
            [self.v_moreEdit setHidden:YES];
        } failed:^(NSInteger statusCode, id json) {
            [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
        }];
    }];
    [alert addAction:forgetPassword];
    [alert addAction:again];
    [self presentViewController:alert animated:YES completion:nil];
    

}

- (void)shangjiaAction{
    [self.v_moreEdit setHidden:!self.v_moreEdit.isHidden];
    RepastEntity *entity = [self.arr_commodity objectAtIndex:self.showIndex];
    [RepastCommodityHandler repastCommodityUpdateWithSpu:entity.spu type:[NSNumber numberWithInt:1] prepare:^{

    } success:^(id obj) {
        if ([self.btnIndex intValue] == 999) {
            entity.status = 1;
            [self.arr_commodity replaceObjectAtIndex:self.showIndex withObject:entity];
            [self.tb_right reloadData];
            self.showIndex = NULLROW;
            [self.v_moreEdit setHidden:YES];
        }else if ([self.btnIndex intValue] == 3){
            [self.arr_commodity removeObjectAtIndex:self.showIndex];
            [self.tb_right reloadData];
            self.showIndex = NULLROW;
            [self.v_moreEdit setHidden:YES];
        }
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];

}

- (void)xiajiaAction{
    [self.v_moreEdit setHidden:!self.v_moreEdit.isHidden];
    RepastEntity *entity = [self.arr_commodity objectAtIndex:self.showIndex];
    [RepastCommodityHandler repastCommodityUpdateWithSpu:entity.spu type:[NSNumber numberWithInt:0] prepare:^{
        
    } success:^(id obj) {
        if ([self.btnIndex intValue] == 999) {
            entity.status = 2;
            [self.arr_commodity replaceObjectAtIndex:self.showIndex withObject:entity];
            [self.tb_right reloadData];
            self.showIndex = NULLROW;
            [self.v_moreEdit setHidden:YES];
        }else if ([self.btnIndex intValue] == 1 || [self.btnIndex intValue] == 2){
            [self.arr_commodity removeObjectAtIndex:self.showIndex];
            [self.tb_right reloadData];
            self.showIndex = NULLROW;
            [self.v_moreEdit setHidden:YES];
        }
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}
-(void)searchBarAction{
    SearchCommodityViewController *vc = [[SearchCommodityViewController alloc]init];
    vc.enterFormType = self.enterFormType;
    vc.searchType = SearchTypeInWareHouse;
    [self.navigationController pushViewController:vc animated:YES];
    vc.selectCommodity = ^(CommodityFromCodeEntity *entity){
        if (self.selectCommodity) {
            self.selectCommodity(entity);
        }
    };
}

-(void)btn_topAction{
    [self.v_moreEdit setHidden:YES];
    [self.v_commodityStatusView setHidden:!self.v_commodityStatusView.isHidden];
}

 
 
-(void)moreAction{
     [self.btn_batchManager setHidden:!self.btn_batchManager.isHidden];
     [self.v_moreEdit setHidden:YES];
    
}
 
- (void)confirmAction{
     [self btn_batchManagerAction];
     self.v_bottom_manager.btn_bottom_allSelect.selected = NO;
}
 
-(void)btn_batchManagerAction{
    
     self.editStatus = !self.editStatus;
     if (self.editStatus == YES) {
         [self.v_bottom_manager setHidden:NO];
     }else{
         [self.v_bottom_manager setHidden:YES];
     }
     [self.btn_batchManager setHidden:YES];
     [self.arr_selected removeAllObjects];
     [self setNavUI];
     [self.tb_right reloadData];
}
 
 #pragma mark - 批量操作
- (void)btn_bottom_allSelect{
     self.v_bottom_manager.btn_bottom_allSelect.selected = !self.v_bottom_manager.btn_bottom_allSelect.isSelected;
     if (self.v_bottom_manager.btn_bottom_allSelect.isSelected == YES) {
         [self.arr_selected removeAllObjects];
         for (int i = 0; i < self.arr_commodity.count; i++) {
             [self.arr_selected addObject:[NSNumber numberWithInt:i]];
         }
     }else{
         [self.arr_selected removeAllObjects];
     }
     [self.tb_right reloadData];
 }

 - (void)btn_bottom_shangjiaAction{
     [self.commodityArr removeAllObjects];
     if (self.arr_selected.count > 0) {
         [self.commodityArr removeAllObjects];
         for ( NSNumber * i in self.arr_selected) {
             RepastEntity *entity = [self.arr_commodity objectAtIndex:[i intValue]];
             NSMutableDictionary *dic = [NSMutableDictionary dictionary];
             [dic setValue:entity.spu forKey:@"spu"];
             [dic setValue:[NSNumber numberWithInt:1] forKey:@"type"];
             [self.commodityArr addObject:dic];
         }
         [RepastCommodityHandler repastCommodityUpdateListWithArr:self.commodityArr prepare:^{
             
         } success:^(id obj) {
             NSDictionary *dic = (NSDictionary *)obj;
             if ([[dic objectForKey:@"errCode"] intValue] == 0) {
                 [MBProgressHUD showSuccessMessage:@"操作成功"];
             }else{
                 [MBProgressHUD showErrorMessage:[dic objectForKey:@"errMessage"]];
             }
         } failed:^(NSInteger statusCode, id json) {
             [MBProgressHUD showErrorMessage:(NSString *)json];
         }];
     }else{
         [MBProgressHUD showErrorMessage:@"请选择商品"];
     }
     
 }
 
- (void)btn_bottom_xiajiaAction{

     if (self.arr_selected.count > 0) {
         [self.commodityArr removeAllObjects];
         for ( NSNumber * i in self.arr_selected) {
             RepastEntity *entity = [self.arr_commodity objectAtIndex:[i intValue]];
             NSMutableDictionary *dic = [NSMutableDictionary dictionary];
             [dic setValue:entity.spu forKey:@"spu"];
             [dic setValue:[NSNumber numberWithInt:0] forKey:@"type"];
             [self.commodityArr addObject:dic];
         }
         [RepastCommodityHandler repastCommodityUpdateListWithArr:self.commodityArr prepare:^{
             
         } success:^(id obj) {
             NSDictionary *dic = (NSDictionary *)obj;
             if ([[dic objectForKey:@"errCode"] intValue] == 0) {
                 [MBProgressHUD showSuccessMessage:@"操作成功"];
             }else{
                 [MBProgressHUD showErrorMessage:[dic objectForKey:@"errMessage"]];
             }
         } failed:^(NSInteger statusCode, id json) {
             [MBProgressHUD showErrorMessage:(NSString *)json];
         }];
     }else{
         [MBProgressHUD showErrorMessage:@"请选择商品"];
     }
 }
 
 - (void)btn_bottom_delete{
     if (self.arr_selected.count > 0) {
         [self.commodityArr removeAllObjects];
         for (NSNumber * i in self.arr_selected) {
             RepastEntity *entity = [self.arr_commodity objectAtIndex:[i intValue]];
             [self.commodityArr addObject:entity.spu];
         }
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"商品删除后无法恢复，再次销售需重新录入。确定删除？" message:@"" preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction *forgetPassword = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             [self.v_moreEdit setHidden:YES];
         }];
         UIAlertAction *again = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
             
             [RepastCommodityHandler repastCommodityDeleteListWithArr:self.commodityArr prepare:^{
                 
             } success:^(id obj) {
                 NSDictionary *dic = (NSDictionary *)obj;
                 if ([[dic objectForKey:@"errCode"] intValue] == 0) {
                     [MBProgressHUD showSuccessMessage:@"操作成功"];
                     [self.arr_selected removeAllObjects];
                     [self.tb_right requestDataSource];
                 }else{
                     [MBProgressHUD showErrorMessage:[dic objectForKey:@"errMessage"]];
                 }
             } failed:^(NSInteger statusCode, id json) {
                 [MBProgressHUD showErrorMessage:(NSString *)json];
             }];
         }];
         [alert addAction:forgetPassword];
         [alert addAction:again];
         [self presentViewController:alert animated:YES completion:nil];
     }else{
         [MBProgressHUD showErrorMessage:@"请选择商品"];
     }
 }
 

- (void)statusViewDissmiss{
    [self.v_commodityStatusView setHidden:YES];
}



- (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

