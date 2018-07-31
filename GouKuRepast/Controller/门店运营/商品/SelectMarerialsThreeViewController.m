//
//  SelectMarerialsThreeViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SelectMarerialsThreeViewController.h"
#import "MaterialsTableViewCell.h"
#import "RepastCommodityHandler.h"
#import "SelectMarerialsViewController.h"
#import "SelectSecondMarerialsViewController.h"

@interface SelectMarerialsThreeViewController()<UITableViewDelegate,UITableViewDataSource,BaseTableViewDelagate>

@property (nonatomic ,strong)BaseTableView     *tb_marerialsCatagory;
@property (nonatomic ,strong)NSMutableArray    *arr_catagory;
@property (nonatomic, strong)NSIndexPath       *selectPath;
@property (nonatomic,strong)NSMutableArray     *arr_selected;
@property (nonatomic ,assign)int                index;
@end

@implementation SelectMarerialsThreeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_catagory = [[NSMutableArray alloc]init];
        self.arr_selected = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.marerialsName;
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
}

- (void)onCreate{
    self.index = 9999;
    self.tb_marerialsCatagory = [[BaseTableView alloc]initWithFrame:CGRectMake(0,SafeAreaTopHeight + 10, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaBottomHeight - SafeAreaBottomHeight - 20) style:UITableViewStylePlain hasHeaderRefreshing:NO hasFooterRefreshing:YES];
    [self.view addSubview:self.tb_marerialsCatagory];
    self.tb_marerialsCatagory.delegate = self;
    self.tb_marerialsCatagory.dataSource = self;
    self.tb_marerialsCatagory.tableViewDelegate = self;
    self.tb_marerialsCatagory.rowHeight = 44;
    self.tb_marerialsCatagory.separatorColor = [UIColor clearColor];
    self.tb_marerialsCatagory.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_marerialsCatagory.tableFooterView = [UIView new];
    [self.tb_marerialsCatagory requestDataSource];
}


- (void)tableView:(BaseTableView *)tableView requestDataSourceWithPageNum:(NSInteger)pageNum complete:(DataCompleteBlock)complete{
    [RepastCommodityHandler getThiredMaterialCategoryWithPage:(int)pageNum materialId:self.marerialsId prepare:^{
        
    } success:^(id obj) {
        if (pageNum == 0) {
            [self.arr_catagory removeAllObjects];
        }
        NSArray *arrData = (NSArray *)obj;
        if (arrData.count < 21) {
            self.tb_marerialsCatagory.hasFooterRefreshing = NO;
        }else{
            self.tb_marerialsCatagory.hasFooterRefreshing = YES;
        }
        [self.arr_catagory addObjectsFromArray:(NSArray *)obj];
        [self.tb_marerialsCatagory reloadData];
        complete([(NSArray *)obj count]);
        if (self.arr_catagory.count == 0) {
            //                self.tb_right.defaultView = [[TableBackgroudView alloc] initWithFrame:self.tb_right.frame withDefaultImage:nil withNoteTitle:@"暂无数据" withNoteDetail:nil withButtonAction:nil];
        }
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_catagory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MaterialsTableViewCell";
    MaterialsTableViewCell *cell = (MaterialsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[MaterialsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dic = [self.arr_catagory objectAtIndex:indexPath.row];
    [cell contentCellWithDic:dic];
    [cell.iv_arrow setHidden:YES];
    
    if (self.index == (int)indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.index = (int)indexPath.row;
    [self.tb_marerialsCatagory reloadData];
}


- (void)rightBarAction{
    if (self.index != 9999) {
        NSLog(@"%d",self.index);
        NSDictionary *dic = [self.arr_catagory objectAtIndex:self.index];
        NSArray *arr_vc = self.navigationController.viewControllers;
        for (NSUInteger index = arr_vc.count - 1; arr_vc >= 0; index--) {
            UIViewController *vc = [arr_vc objectAtIndex:index];
            if (![vc isKindOfClass:[SelectMarerialsThreeViewController class]] && ![vc isKindOfClass:[SelectSecondMarerialsViewController class]] && ![vc isKindOfClass:[SelectMarerialsViewController class]]) {
                [self.navigationController popToViewController:vc animated:YES];
                [[NSNotificationCenter defaultCenter]postNotificationName:@"marerialSelect" object:nil userInfo:dic];
                return;
            }
        }
    }
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
