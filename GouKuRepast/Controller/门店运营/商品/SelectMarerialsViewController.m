//
//  SelectMarerialsViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SelectMarerialsViewController.h"
#import "MaterialsTableViewCell.h"
#import "RepastCommodityHandler.h"
#import "SelectSecondMarerialsViewController.h"

@interface SelectMarerialsViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,BaseTableViewDelagate>

@property (nonatomic ,strong)BaseTableView     *tb_marerialsCatagory;
@property (nonatomic ,strong)BaseTableView     *tb_marerialsSearch;
@property (nonatomic ,strong)NSMutableArray    *arr_catagory;
@property (nonatomic ,strong)NSMutableArray    *arr_search;
@property (nonatomic ,strong)UITextField       *tf_search;
@property (nonatomic ,strong)UIView            *v_nullBack;
@property (nonatomic ,strong)UIButton          *btn_save;

@end

@implementation SelectMarerialsViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_catagory = [[NSMutableArray alloc]init];
        self.arr_search = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择原料";
    [self initLeftCancelBarView];
}

- (void)onCreate{
    
    UIView *v_search = [[UIView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, 50)];
    [self.view addSubview:v_search];
    [v_search setBackgroundColor:[UIColor whiteColor]];
    
    UIView *v_header = [[UIView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 30)];
    [v_search addSubview:v_header];
    v_header.layer.cornerRadius = 3.0f;
    [v_header setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
    UIImageView *iv_icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 18, 18)];
    [iv_icon setImage:[UIImage imageNamed:@"home_search"]];
    [v_header addSubview:iv_icon];
    
    self.tf_search = [[UITextField alloc]initWithFrame:CGRectMake(38, 0, v_header.frame.size.width - 38 - 15, 30)];
    [v_header addSubview:self.tf_search];
    self.tf_search.delegate = self;
    self.tf_search.placeholder = @"搜索商品原料";
    self.tf_search.returnKeyType = UIReturnKeySearch;
    self.tf_search.font = [UIFont systemFontOfSize:14];
    
    UIView *v_section = [[UIView alloc]initWithFrame:CGRectMake(0, v_search.bottom, SCREEN_WIDTH, 32)];
    [self.view addSubview:v_section];
    [v_section setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
    UILabel *lb_title = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 100, 22)];
    [v_section addSubview:lb_title];
    [lb_title setText:@"选择分类"];
    [lb_title setTextColor:[UIColor colorWithHexString:@"#979797"]];
    [lb_title setFont:[UIFont systemFontOfSize:16]];
    
    
    self.tb_marerialsCatagory = [[BaseTableView alloc]initWithFrame:CGRectMake(0, v_section.bottom, SCREEN_WIDTH, SCREEN_HEIGHT - v_section.bottom - SafeAreaBottomHeight) style:UITableViewStylePlain hasHeaderRefreshing:NO hasFooterRefreshing:YES];
    [self.view addSubview:self.tb_marerialsCatagory];
    self.tb_marerialsCatagory.delegate = self;
    self.tb_marerialsCatagory.dataSource = self;
    self.tb_marerialsCatagory.tableViewDelegate = self;
    self.tb_marerialsCatagory.rowHeight = 44;
    self.tb_marerialsCatagory.separatorColor = [UIColor clearColor];
    self.tb_marerialsCatagory.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_marerialsCatagory.tableFooterView = [UIView new];
    
    self.tb_marerialsSearch = [[BaseTableView alloc]initWithFrame:CGRectMake(0, v_search.bottom + 10, SCREEN_WIDTH, SCREEN_HEIGHT - v_search.bottom - 10 - SafeAreaBottomHeight) style:UITableViewStylePlain hasHeaderRefreshing:NO hasFooterRefreshing:YES];
    [self.view addSubview:self.tb_marerialsSearch];
    self.tb_marerialsSearch.delegate = self;
    self.tb_marerialsSearch.dataSource = self;
    self.tb_marerialsSearch.tableViewDelegate = self;
    self.tb_marerialsSearch.rowHeight = 44;
    self.tb_marerialsSearch.separatorColor = [UIColor clearColor];
    self.tb_marerialsSearch.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_marerialsSearch.tableFooterView = [UIView new];
    [self.tb_marerialsSearch setHidden:YES];
    
    [self.tb_marerialsCatagory requestDataSource];
    
    self.v_nullBack = [[UIView alloc]initWithFrame:CGRectMake(0, v_search.bottom + 10, SCREEN_WIDTH, self.tb_marerialsSearch.frame.size.height)];
    [self.v_nullBack setBackgroundColor:[UIColor whiteColor]];
    UILabel *lb1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, SCREEN_WIDTH, 16)];
    [self.v_nullBack addSubview:lb1];
    [lb1 setText:@"未找到相关原料…"];
    lb1.textAlignment = NSTextAlignmentCenter;
    lb1.font = [UIFont systemFontOfSize:14];
//    [self.view addSubview:self.v_nullBack];
    
    UILabel *lb2 = [[UILabel alloc]initWithFrame:CGRectMake(0, lb1.bottom + 30, SCREEN_WIDTH, 16)];
    [self.v_nullBack addSubview:lb2];
    [lb2 setText:@"您可保存搜索词为原料名称"];
    lb2.textAlignment = NSTextAlignmentCenter;
    lb2.font = [UIFont systemFontOfSize:14];
    
    self.btn_save = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 100) / 2, lb2.bottom + 50, 100, 30)];
    [self.v_nullBack addSubview:self.btn_save];
    [self.btn_save setBackgroundColor:[UIColor colorWithHexString:@"#4167B2"]];
    [self.btn_save setTitle:@"保存" forState:UIControlStateNormal];
    self.btn_save.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.btn_save setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn_save addTarget:self action:@selector(btn_saveAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tableView:(BaseTableView *)tableView requestDataSourceWithPageNum:(NSInteger)pageNum complete:(DataCompleteBlock)complete{
    if (tableView == self.tb_marerialsCatagory) {
        [RepastCommodityHandler getFirstMaterialCategoryWithPage:(int)pageNum prepare:^{
            
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
    }else{
        [RepastCommodityHandler materialSearchWithpage:(int)pageNum material:self.tf_search.text prepare:^{
            
        } success:^(id obj) {
            
            if (pageNum == 0) {
                [self.arr_search removeAllObjects];
            }
            if ([(NSArray *)obj count] > 0) {
                [self.arr_search addObjectsFromArray:(NSArray *)obj];
            }
            if ([(NSArray *)obj count] < 21) {
                self.tb_marerialsSearch.hasFooterRefreshing = NO;
            }else{
                self.tb_marerialsSearch.hasFooterRefreshing = YES;
            }
            [self.tb_marerialsSearch reloadData];
            complete([(NSArray *)obj count]);
            if (self.arr_search.count == 0) {
                self.tb_marerialsSearch.backgroundView = self.v_nullBack;
            }
        } failed:^(NSInteger statusCode, id json) {
            [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
        }];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.tb_marerialsCatagory setHidden:YES];
    [self.tb_marerialsSearch setHidden:NO];
    [self.tb_marerialsSearch requestDataSource];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tb_marerialsCatagory) {
        return self.arr_catagory.count;
    }else{
        return self.arr_search.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MaterialsTableViewCell";
    MaterialsTableViewCell *cell = (MaterialsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[MaterialsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dic = [NSDictionary dictionary];
    if (tableView == self.tb_marerialsSearch) {
        dic = [self.arr_search objectAtIndex:indexPath.row];
    }else{
        dic = [self.arr_catagory objectAtIndex:indexPath.row];
    }
    [cell contentCellWithDic:dic];
    if (tableView == self.tb_marerialsCatagory) {
        [cell.iv_arrow setHidden:NO];
    }else{
        [cell.iv_arrow setHidden:YES];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.tb_marerialsCatagory) {
        NSDictionary *dic = [self.arr_catagory objectAtIndex:indexPath.row];
        SelectSecondMarerialsViewController *vc = [[SelectSecondMarerialsViewController alloc]init];
        vc.marerialsId = [dic objectForKey:@"id"];
        vc.marerialsName = [dic objectForKey:@"materialName"];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        //搜索的
        NSDictionary *dic = [self.arr_search objectAtIndex:indexPath.row];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"marerialSelect" object:nil userInfo:dic];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)btn_saveAction{
    NSDictionary *dic = @{@"materialName":self.tf_search.text,@"id":@""};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"marerialSelect" object:nil userInfo:dic];
    [self.navigationController popViewControllerAnimated:YES];
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
