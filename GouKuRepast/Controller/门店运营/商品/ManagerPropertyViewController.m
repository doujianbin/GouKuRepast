//
//  ManagerPropertyViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/24.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "ManagerPropertyViewController.h"
#import "AttributesEntity.h"
#import "CommodityPropertyTableViewCell.h"

@interface ManagerPropertyViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic ,strong)UITableView       *tb_property;
@property (nonatomic ,strong)NSMutableArray    *arr_data;
@property (nonatomic ,strong)UIButton          *btn_add;

@end

@implementation ManagerPropertyViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_data = [[NSMutableArray alloc]init];
        self.arr_deleteIds = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"属性管理";
    [self initLeftCancelBarView];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
    
    self.btn_add = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    [self.view addSubview:self.btn_add];
    [self.btn_add setTitle:@"＋    添加更多属性" forState:UIControlStateNormal];
    [self.btn_add setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [self.btn_add setBackgroundColor:[UIColor colorWithHexString:@"#4167B2"]];
    self.btn_add.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.btn_add addTarget:self action:@selector(btn_addAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onCreate{
    [self.arr_data addObjectsFromArray:[self.arr_property copy]];
    self.tb_property = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 44 - 20) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tb_property];
    self.tb_property.delegate = self;
    self.tb_property.dataSource = self;
    self.tb_property.separatorColor = [UIColor clearColor];
    self.tb_property.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_property.tableFooterView = [UIView new];
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
    [btn_section setTitle:@"删除该属性" forState:UIControlStateNormal];
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
    static NSString *CellIdentifier = @"CommodityPropertyTableViewCell";
    CommodityPropertyTableViewCell *cell = (CommodityPropertyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[CommodityPropertyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tf_propertyName.delegate = self;
    cell.tf_propertyName.tag = indexPath.section;
    cell.btn_addProperty.tag = indexPath.section;
    [cell.btn_addProperty addTarget:self action:@selector(addPropertyAction:) forControlEvents:UIControlEventTouchUpInside];
    AttributesEntity *entity = [[self.arr_data objectAtIndex:indexPath.section] copy];
    [cell contentCellWithAttributesEntity:entity];
    cell.deleteProperty = ^(NSInteger index) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:entity.contents];
        [array removeObjectAtIndex:index];
        entity.contents = array;
        [self.arr_data replaceObjectAtIndex:indexPath.section withObject:entity];
        [self.tb_property reloadData];
    };
    return cell;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    int section = (int)textField.tag;
    CommodityPropertyTableViewCell *cell = [self.tb_property cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    AttributesEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    if (cell.tf_propertyName == textField) {
        entity.name = textField.text;
    }
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    int section = (int)textField.tag;
    CommodityPropertyTableViewCell *cell = [self.tb_property cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if (cell.tf_propertyName == textField) {
        if (textField.text.length + string.length > 10) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }
    
    return YES;
}

- (void)v_footerAction:(UIButton *)sender{
    AttributesEntity *entity = [self.arr_data objectAtIndex:sender.tag];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除后无法恢复，确定要删除吗？" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *forgetPassword = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *again = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.view endEditing:YES];
        if (entity.attrId != 0) {
            [self.arr_deleteIds addObject:entity.attrId];
        }
        [self.arr_data removeObjectAtIndex:sender.tag];
        [self.tb_property reloadData];
        [self setAddBtnUI];
    }];
    [alert addAction:forgetPassword];
    [alert addAction:again];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)addPropertyAction:(UIButton *)btn_sender{
    [self.view endEditing:YES];
    int section = (int)btn_sender.tag;
    CommodityPropertyTableViewCell *cell = [self.tb_property cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    AttributesEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    NSMutableArray *arr_value = [NSMutableArray arrayWithArray:entity.contents];
    if (cell.tf_property.text.length == 0) {
        [MBProgressHUD showErrorMessage:@"填写属性"];
        return;
    }else if (cell.tf_property.text.length > 10){
        [MBProgressHUD showErrorMessage:@"不超过10个字"];
        return;
    }
    if (arr_value.count >= 10) {
        [MBProgressHUD showErrorMessage:@"最多10个"];
        return;
    }
    if ([arr_value containsObject:cell.tf_property.text]) {
        [MBProgressHUD showErrorMessage:@"已有相同名称的选项，请重新输入"];
        return;
    }
    [arr_value addObject:cell.tf_property.text];
    entity.contents = arr_value;
    entity.attribute = @"";
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
    [self.tb_property reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:section]] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)btn_addAction{
    AttributesEntity *entity = [[AttributesEntity alloc]init];
    [self.arr_data addObject:entity];
    [self.tb_property reloadData];
    [self setAddBtnUI];
}

- (void)setAddBtnUI{
    if (self.arr_data.count <= 4) {
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
    //先判断里面必填写的项目是否填写
    for (AttributesEntity *entity in self.arr_data) {
        if ([entity.name isEqualToString:@""]) {
            [MBProgressHUD showErrorMessage:@"请填写属性名称"];
            return;
        }
        if (entity.contents.count < 2) {
            [MBProgressHUD showErrorMessage:@"每个属性至少要有两个属性选项"];
            return;
        }
    }
    //判断是否含有重复的规格名称
    if (self.arr_data.count > 1) {
        CommodityPropertyTableViewCell *cell = [self.tb_property cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSString *nameDemo = cell.tf_propertyName.text;
        for (int i = 1; i < self.arr_data.count; i ++) {
            CommodityPropertyTableViewCell *cell = [self.tb_property cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            if ([cell.tf_propertyName.text isEqualToString:nameDemo]) {
                [MBProgressHUD showErrorMessage:@"属性名称不能重复"];
                return;
            }
        }
    }
    if (self.selectPropertyComplete) {
        self.selectPropertyComplete(self.arr_data,self.arr_deleteIds);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
