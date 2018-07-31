//
//  SelectBrandViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/22.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "SelectBrandViewController.h"
#import "RepastCommodityHandler.h"
#import "MaterialsTableViewCell.h"

@interface SelectBrandViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,BaseTableViewDelagate>
@property (nonatomic, strong)UITextField           *tf_search;
@property (nonatomic ,strong)BaseTableView         *tb_brand;
@property (nonatomic ,strong)NSMutableArray        *arr_brand;
@property (nonatomic ,strong)UIView            *v_nullBack;
@property (nonatomic ,strong)UIButton          *btn_save;

@end

@implementation SelectBrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_brand = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)onCreate{
    UIView *v_header = [[UIView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH - 30, 44)];
    
    self.tf_search = [[UITextField alloc]initWithFrame:CGRectMake(0, 7, v_header.width - 50, 30)];
    UIView *v_left = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 34, 30)];
    UIImageView *iv_icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 6, 18, 18)];
    [iv_icon setImage:[UIImage imageNamed:@"home_search"]];
    [v_left addSubview:iv_icon];
    self.tf_search.backgroundColor = [UIColor colorWithHexString:@"#F1F1F1"];
    self.tf_search.leftView = v_left;
    self.tf_search.leftViewMode = UITextFieldViewModeAlways;
    self.tf_search.placeholder = @"搜索商品品牌";
    self.tf_search.font = [UIFont systemFontOfSize:FONT_SIZE_DESC];
    self.tf_search.textColor = [UIColor blackColor];
    [self.tf_search.layer setCornerRadius:5];
    self.tf_search.layer.masksToBounds = YES;
    self.tf_search.delegate = self;
    self.tf_search.returnKeyType = UIReturnKeySearch;
    self.tf_search.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.tf_search.enablesReturnKeyAutomatically = YES;
    self.tf_search.tintColor = [UIColor colorWithHexString:COLOR_BLUE_MAIN];
    [v_header addSubview:self.tf_search];
    
    self.navigationItem.titleView = v_header;
    
    self.tb_brand = [[BaseTableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight) style:UITableViewStylePlain hasHeaderRefreshing:NO hasFooterRefreshing:YES];
    [self.view addSubview:self.tb_brand];
    self.tb_brand.delegate = self;
    self.tb_brand.dataSource = self;
    self.tb_brand.tableViewDelegate = self;
    self.tb_brand.rowHeight = 44;
    self.tb_brand.separatorColor = [UIColor clearColor];
    self.tb_brand.backgroundColor = [UIColor whiteColor];
    
    self.v_nullBack = [[UIView alloc]initWithFrame:self.tb_brand.frame];
    [self.v_nullBack setBackgroundColor:[UIColor whiteColor]];
    UILabel *lb1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, SCREEN_WIDTH, 16)];
    [self.v_nullBack addSubview:lb1];
    [lb1 setText:@"未找到相关品牌…"];
    lb1.textAlignment = NSTextAlignmentCenter;
    lb1.font = [UIFont systemFontOfSize:14];
    //    [self.view addSubview:self.v_nullBack];
    
    UILabel *lb2 = [[UILabel alloc]initWithFrame:CGRectMake(0, lb1.bottom + 30, SCREEN_WIDTH, 16)];
    [self.v_nullBack addSubview:lb2];
    [lb2 setText:@"您可保存搜索词为品牌名称"];
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
    [RepastCommodityHandler brandSearchWithPage:(int)pageNum brand:self.tf_search.text prepare:^{
        
    } success:^(id obj) {
        if (pageNum == 0) {
            [self.arr_brand removeAllObjects];
        }
        if ([(NSArray *)obj count] > 0) {
            [self.arr_brand addObjectsFromArray:(NSArray *)obj];
        }
        if ([(NSArray *)obj count] < 21) {
            self.tb_brand.hasFooterRefreshing = NO;
        }else{
            self.tb_brand.hasFooterRefreshing = YES;
        }
        [self.tb_brand reloadData];
        complete([(NSArray *)obj count]);
        if (self.arr_brand.count == 0) {
            self.tb_brand.backgroundView = self.v_nullBack;
        }
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr_brand.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MaterialsTableViewCell";
    MaterialsTableViewCell *cell = (MaterialsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[MaterialsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dic = [self.arr_brand objectAtIndex:indexPath.row];
    [cell contentCellWithBrandDic:dic];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
    NSDictionary *dic = [self.arr_brand objectAtIndex:indexPath.row];
    if (self.selectBrandComplete) {
        self.selectBrandComplete([dic objectForKey:@"brandName"], [dic objectForKey:@"id"]);
    }
}

- (void)btn_saveAction{
    [self.navigationController popViewControllerAnimated:YES];
    if (self.selectBrandComplete) {
        self.selectBrandComplete(self.tf_search.text,nil);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self.tb_brand requestDataSource];
    return YES;
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
