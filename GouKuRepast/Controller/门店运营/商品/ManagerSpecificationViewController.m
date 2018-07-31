//
//  ManagerSpecificationViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "ManagerSpecificationViewController.h"
#import "CommoditySpecificationTableViewCell.h"
#import "CommodityWeightUnitView.h"


@interface ManagerSpecificationViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic ,strong)UITableView       *tb_specifcation;
@property (nonatomic ,strong)NSMutableArray    *arr_data;
@property (nonatomic ,strong)UIButton          *btn_add;
@property (nonatomic ,strong)CommodityWeightUnitView   *v_commodityWeightUnit;


@end

@implementation ManagerSpecificationViewController
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
    self.title = @"规格管理";
    
    [self initLeftCancelBarView];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
    
    self.btn_add = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 44, SCREEN_WIDTH, 44)];
    [self.view addSubview:self.btn_add];
    [self.btn_add setTitle:@"＋    添加更多规格" forState:UIControlStateNormal];
    [self.btn_add setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];
    [self.btn_add setBackgroundColor:[UIColor colorWithHexString:@"#4167B2"]];
    self.btn_add.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.btn_add addTarget:self action:@selector(btn_addAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onCreate{
    
    [self.arr_data addObjectsFromArray:[self.arr_specification copy]];
    self.tb_specifcation = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 44) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tb_specifcation];
    self.tb_specifcation.delegate = self;
    self.tb_specifcation.dataSource = self;
    self.tb_specifcation.separatorColor = [UIColor clearColor];
    self.tb_specifcation.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    self.tb_specifcation.tableFooterView = [UIView new];
    
    self.v_commodityWeightUnit = [[CommodityWeightUnitView alloc]initWithFrame:CGRectMake(0, 0, 108, 162)];
    [self.view addSubview:self.v_commodityWeightUnit];
    [self.v_commodityWeightUnit setHidden:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }else{
        return 44;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v_header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    [v_header setBackgroundColor:[UIColor colorWithHexString:COLOR_GRAY_BG]];
    return v_header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section > 0) {
        UIView *v_footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        [v_footer setBackgroundColor:[UIColor whiteColor]];
        UIButton *btn_section = [[UIButton alloc]initWithFrame:v_footer.frame];
        [v_footer addSubview:btn_section];
        [btn_section setTitle:@"删除该规格" forState:UIControlStateNormal];
        [btn_section setTitleColor:[UIColor colorWithHexString:@"#D0021B"] forState:UIControlStateNormal];
        btn_section.titleLabel.font = [UIFont systemFontOfSize:16];
        btn_section.tag = section;
        [btn_section addTarget:self action:@selector(v_footerAction:) forControlEvents:UIControlEventTouchUpInside];
        return v_footer;
    }else{
        return NULL;
    }
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
    static NSString *CellIdentifier = @"CommoditySpecificationTableViewCell";
    CommoditySpecificationTableViewCell *cell = (CommoditySpecificationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell){
        cell = [[CommoditySpecificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.tf_guigeName.delegate = self;
    cell.tf_guigeName.tag = indexPath.section;
    
    cell.tf_guigeDescrib.delegate = self;
    cell.tf_guigeDescrib.tag = indexPath.section;
    
    cell.tf_guigeWeight.delegate = self;
    cell.tf_guigeWeight.tag = indexPath.section;
    
    cell.tf_inventory.delegate = self;
    cell.tf_inventory.tag = indexPath.section;
    
    cell.tf_inStorePrice.delegate = self;
    cell.tf_inStorePrice.tag = indexPath.section;
    
    cell.tf_waimaiPrice.delegate = self;
    cell.tf_waimaiPrice.tag = indexPath.section;
    
    cell.tf_baozhuangNum.delegate = self;
    cell.tf_baozhuangNum.tag = indexPath.section;
    
    cell.tf_baozhuangPrice.delegate = self;
    cell.tf_baozhuangPrice.tag = indexPath.section;
    
    cell.switch_Inventory.tag = indexPath.section;
    [cell.switch_Inventory addTarget:self action:@selector(switch_InventoryAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.switch_inStore.tag = indexPath.section;
    [cell.switch_inStore addTarget:self action:@selector(switch_inStoreAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.switch_waimai.tag = indexPath.section;
    [cell.switch_waimai addTarget:self action:@selector(switch_waimaiAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.btn_guigeUnit.tag = indexPath.section;
    [cell.btn_guigeUnit addTarget:self action:@selector(btn_guigeUnitAction:) forControlEvents:UIControlEventTouchUpInside];
    
    StandardsEntity *entity = [self.arr_data objectAtIndex:indexPath.section];
    [cell contentCellWithStandardsEntity:entity];
    return cell;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    int section = (int)textField.tag;
    CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    StandardsEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    if (cell.tf_guigeName == textField) {
        entity.name = textField.text;
    }else if (cell.tf_guigeDescrib == textField){
        entity.desc = textField.text;
    }else if (cell.tf_guigeWeight == textField){
        entity.weight = [NSNumber numberWithDouble:[textField.text doubleValue]];
    }else if (cell.tf_inventory == textField){
        entity.stock = [NSNumber numberWithDouble:[textField.text doubleValue]];
    }else if (cell.tf_inStorePrice == textField){
        entity.storePrice = [textField.text doubleValue];
    }else if (cell.tf_waimaiPrice == textField){
        entity.onlineStorePrice = [textField.text doubleValue];
    }else if (cell.tf_baozhuangNum == textField){
        entity.dispatchingCount = [NSNumber numberWithDouble:[textField.text doubleValue]];
    }else if (cell.tf_baozhuangPrice == textField){
        entity.dispatchingPrice = [textField.text doubleValue];
    }
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    int section = (int)textField.tag;
    CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    if (cell.tf_guigeName == textField) {
        if (textField.text.length + string.length > 30) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }else if (cell.tf_guigeDescrib == textField){
        if (textField.text.length + string.length > 250) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }else if (cell.tf_guigeWeight == textField){
        if (textField.text.length + string.length > 6) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }else if (cell.tf_inventory == textField){
        if (textField.text.length + string.length > 5) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }else if (cell.tf_baozhuangNum == textField){
        if (textField.text.length + string.length > 3) {
            return NO;
        }
        if (textField.text.length < range.location + range.length) {
            return NO;
        }
    }
    
    return YES;
}


- (void)btn_guigeUnitAction:(UIButton *)btn_sender{
    int section = (int)btn_sender.tag ;
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [btn_sender convertRect:self.view.bounds toView:window];
    [self.v_commodityWeightUnit setFrame:CGRectMake(rect.origin.x - 30, rect.origin.y + 35, 108, 162)];
    [self.v_commodityWeightUnit setHidden:NO];
    WS(weakSelf);
    self.v_commodityWeightUnit.selectWeightUnit = ^(NSString *weightUnit) {
        StandardsEntity *entity = [[weakSelf.arr_data objectAtIndex:section] copy];
        entity.weightNnit = weightUnit;
        [weakSelf.arr_data replaceObjectAtIndex:section withObject:entity];
        [weakSelf.tb_specifcation reloadData];
        [weakSelf.v_commodityWeightUnit setHidden:YES];
    };
}

- (void)switch_InventoryAction:(UISwitch *)sender{
    int section = (int)sender.tag;
    CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    StandardsEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    if (cell.switch_Inventory.on == YES) {
        NSLog(@"switch is on");
        entity.stockType = YES;
        [cell.lb_inventoryT setHidden:YES];
        [cell.tf_inventory setHidden:YES];
    } else {
        NSLog(@"switch is off");
        entity.stockType = NO;
        [cell.lb_inventoryT setHidden:NO];
        [cell.tf_inventory setHidden:NO];
    }
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
}

- (void)switch_inStoreAction:(UISwitch *)sender{
    int section = (int)sender.tag;
    CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    StandardsEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    if (cell.switch_inStore.on == YES) {
        entity.storeUsing = YES;
    }else{
        entity.storeUsing = NO;
    }
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
    [self.tb_specifcation reloadData];
}

- (void)switch_waimaiAction:(UISwitch *)sender{
    int section = (int)sender.tag;
    CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    StandardsEntity *entity = [[self.arr_data objectAtIndex:section] copy];
    if (cell.switch_waimai.on == YES) {
        entity.onlineStoreUsing = YES;
    }else{
        entity.onlineStoreUsing = NO;
    }
    [self.arr_data replaceObjectAtIndex:section withObject:entity];
    [self.tb_specifcation reloadData];
}

- (void)v_footerAction:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"删除后无法恢复，确定要删除吗？" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *forgetPassword = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *again = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.view endEditing:YES];
        [self.arr_data removeObjectAtIndex:sender.tag];
        [self.tb_specifcation reloadData];
        [self setAddBtnUI];
    }];
    [alert addAction:forgetPassword];
    [alert addAction:again];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)btn_addAction{
    StandardsEntity *standardsEntity = [[StandardsEntity alloc]init];
    standardsEntity.stockType = YES;
    standardsEntity.storeUsing = YES;
    standardsEntity.onlineStoreUsing = YES;
    standardsEntity.weightNnit = @"克(g)";
    [self.arr_data addObject:standardsEntity];
    [self.tb_specifcation reloadData];
    
    [self setAddBtnUI];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.v_commodityWeightUnit setHidden:YES];
}

- (void)rightBarAction{
    [self.view endEditing:YES];
    //先判断里面必填写的项目是否填写
    for (int i = 0; i < self.arr_data.count; i++) {
        CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
        if ([cell.tf_guigeName.text isEqualToString:@""]) {
            [MBProgressHUD showErrorMessage:@"请填写规格名称"];
            return;
        }
        if (cell.switch_Inventory.on == NO) {
            if ([cell.tf_inventory.text isEqualToString:@""]) {
                [MBProgressHUD showErrorMessage:@"请填写库存"];
                return;
            }
        }
        if (cell.switch_inStore.on == YES) {
            if ([cell.tf_inStorePrice.text isEqualToString:@""]) {
                [MBProgressHUD showErrorMessage:@"请填写堂食价格"];
                return;
            }
        }
        if (cell.switch_waimai.on == YES) {
            if ([cell.tf_waimaiPrice.text isEqualToString:@""]) {
                [MBProgressHUD showErrorMessage:@"请填写外卖价格"];
                return;
            }
        }
    }
    
    //判断是否含有重复的规格名称
    if (self.arr_data.count > 1) {
        CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSString *nameDemo = cell.tf_guigeName.text;
        for (int i = 1; i < self.arr_data.count; i ++) {
            CommoditySpecificationTableViewCell *cell = [self.tb_specifcation cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:i]];
            if ([cell.tf_guigeName.text isEqualToString:nameDemo]) {
                [MBProgressHUD showErrorMessage:@"规格名称不能重复"];
                return;
            }
        }
    }
    
    
    if (self.selectSpecificationComplete) {
        self.selectSpecificationComplete(self.arr_data);
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
