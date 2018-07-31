//
//  ManagerMaterialsViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "ManagerMaterialsViewController.h"
#import "MaterialsEntity.h"
#import "CommodityMaterialsTableViewCell.h"
#import "SelectMarerialsViewController.h"

@interface ManagerMaterialsViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic ,strong)UITableView       *tb_materials;
@property (nonatomic ,strong)NSMutableArray    *arr_data;
@property (nonatomic ,strong)UIButton          *btn_add;
@property (nonatomic ,assign)NSInteger          select_index;

@end

@implementation ManagerMaterialsViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_data = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"原料管理";
    [self initLeftCancelBarView];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
    
    self.btn_add = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    [self.view addSubview:self.btn_add];
    [self.btn_add setTitle:@"＋    添加更多原料" forState:UIControlStateNormal];
    [self.btn_add setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [self.btn_add setBackgroundColor:[UIColor colorWithHexString:@"#4167B2"]];
    self.btn_add.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.btn_add addTarget:self action:@selector(btn_addAction) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(marerialSelectAction:) name:@"marerialSelect" object:nil];

}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)onCreate{
    [self.arr_data addObjectsFromArray:self.arr_materials];
    self.tb_materials = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 44 - 20) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tb_materials];
    self.tb_materials.delegate = self;
    self.tb_materials.dataSource = self;
    self.tb_materials.separatorColor = [UIColor clearColor];
    self.tb_materials.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_materials.tableFooterView = [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v_header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    [v_header setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
    return v_header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *v_footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    [v_footer setBackgroundColor:[UIColor whiteColor]];
    UIButton *btn_section = [[UIButton alloc]initWithFrame:v_footer.frame];
    [v_footer addSubview:btn_section];
    [btn_section setTitle:@"删除该原料" forState:UIControlStateNormal];
    [btn_section setTitleColor:[UIColor colorWithHexString:@"#D0021B"] forState:UIControlStateNormal];
    btn_section.titleLabel.font = [UIFont systemFontOfSize:16];
    btn_section.tag = section;
    [btn_section addTarget:self action:@selector(v_footerAction:) forControlEvents:UIControlEventTouchUpInside];
    return v_footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arr_data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CommodityMaterialsTableViewCell";
    CommodityMaterialsTableViewCell *cell = (CommodityMaterialsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[CommodityMaterialsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.tf_weigth.delegate = self;
    cell.tf_weigth.tag = indexPath.section;
    
    cell.btn_materials.tag = indexPath.section;
    [cell.btn_materials addTarget:self action:@selector(btn_materialsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    MaterialsEntity *entity = [self.arr_data objectAtIndex:indexPath.section];
    [cell contentCellWithMaterialsEntity:entity];
    return cell;
}

- (void)btn_materialsAction:(UIButton *)sender{
    self.select_index = sender.tag;
    SelectMarerialsViewController *vc = [[SelectMarerialsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    int section = (int)textField.tag;
    CommodityMaterialsTableViewCell *cell = [self.tb_materials cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    MaterialsEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    if (cell.tf_weigth == textField) {
        entity.content = textField.text;
    }
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    int section = (int)textField.tag;
    CommodityMaterialsTableViewCell *cell = [self.tb_materials cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if (cell.tf_weigth == textField) {
        if (textField.text.length + string.length > 6) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }
    
    return YES;
}


- (void)marerialSelectAction:(NSNotification *)noti{
    int section = (int)self.select_index;
    MaterialsEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    entity.name = [noti.userInfo objectForKey:@"materialName"];
    entity.materialId = [noti.userInfo objectForKey:@"id"];
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
    [self.tb_materials reloadData];
}

- (void)v_footerAction:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除后无法恢复，确定要删除吗？" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *forgetPassword = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *again = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.view endEditing:YES];
        [self.arr_data removeObjectAtIndex:sender.tag];
        [self.tb_materials reloadData];
        [self setAddBtnUI];
    }];
    [alert addAction:forgetPassword];
    [alert addAction:again];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)btn_addAction{
    MaterialsEntity *entity = [[MaterialsEntity alloc]init];
    [self.arr_data addObject:entity];
    [self.tb_materials reloadData];
    [self setAddBtnUI];
}

- (void)setAddBtnUI{
    if (self.arr_data.count <= 9) {
        [self.btn_add setBackgroundColor:[UIColor colorWithHexString:@"#4167B2"]];
        [self.btn_add setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.btn_add.enabled = YES;
    }else{
        [self.btn_add setBackgroundColor:[UIColor whiteColor]];
        [self.btn_add setTitleColor:[UIColor colorWithHexString:@"#979797"] forState:UIControlStateNormal];
        self.btn_add.enabled = NO;
    }
}

- (void)rightBarAction{
    [self.view endEditing:YES];
    for (MaterialsEntity *entity in self.arr_data) {
        if (entity.name.length == 0) {
            [MBProgressHUD showErrorMessage:@"请填写原料名称"];
            return;
        }
        if (entity.content.length == 0) {
            [MBProgressHUD showErrorMessage:@"请填写原料重量"];
            return;
        }
    }
    if (self.selectMaterialsComplete) {
        self.selectMaterialsComplete(self.arr_data);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftBarAction:(id)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要放弃编辑吗？所有未保存内容都会丢失。" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *forgetPassword = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *again = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //        NSString *strUrl = @"http://47.97.174.40:9000/login/out";
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:forgetPassword];
    [alert addAction:again];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
