//
//  EditCommodityViewController.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/25.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "EditCommodityViewController.h"
#import "AddCommodityHeaderView.h"
#import "AddCommoditySectionHeaderView.h"
#import "AddCommoditySectionFooterView.h"
#import "CommodityBasicInfoTableViewCell.h"
#import "CommoditySpecificationTableViewCell.h"
#import "CommodityMaterialsTableViewCell.h"
#import "CommodityPropertyTableViewCell.h"
#import "SelectBrandViewController.h"
#import <AliyunOSSiOS/OSSService.h>
#import "ShopClassificationViewController.h"
#import "ManagerSpecificationViewController.h"
#import "ManagerMaterialsViewController.h"
#import "ManagerPropertyViewController.h"
#import "RepastCommodityHandler.h"
#import "SecruityTokenEntity.h"
#import "ImageUtil.h"
#import "SelectMarerialsViewController.h"
#import "MaterialsEntity.h"
#import "CommodityWeightUnitView.h"

@interface EditCommodityViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>

@property (nonatomic ,strong)UIImagePickerController     *ipc_commodityPic;
@property (nonatomic ,assign)NSInteger                   select_index;
@property (nonatomic ,strong)CommodityWeightUnitView    *v_commodityWeightUnit;
@property (nonatomic ,strong)UITableView                *tb_edit;
@property (nonatomic ,strong)OSSClient                  *client;
@property (nonatomic ,strong)UIView                     *tb_footer;
@property (nonatomic ,strong)UILabel                    *lb_barcode;
@property (nonatomic ,strong)NSMutableArray             *arr_deleteIds;
@property (nonatomic ,strong)NSMutableArray             *arr_deleteSkuIds;

@end

@implementation EditCommodityViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arr_deleteIds = [[NSMutableArray alloc]init];
        self.arr_deleteSkuIds = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑商品";
    [self initLeftCancelBarView];
    
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarAction)];
    [btn_right setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#ffffff"]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = btn_right;
}

- (void)onCreate{
    
    self.tb_footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    [self.tb_footer setBackgroundColor:[UIColor whiteColor]];
    UILabel *bar_title = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 80, 44)];
    [bar_title setText:@"条形码"];
    [self.tb_footer addSubview:bar_title];
    [bar_title setTextColor:[UIColor blackColor]];
    [bar_title setFont:[UIFont systemFontOfSize:16]];
    
    self.lb_barcode = [[UILabel alloc]initWithFrame:CGRectMake(104, 0, SCREEN_WIDTH - 104 - 14, 44)];
    [self.tb_footer addSubview:self.lb_barcode];
    [self.lb_barcode setTextColor:[UIColor blackColor]];
    [self.lb_barcode setFont:[UIFont systemFontOfSize:16]];
    [self.lb_barcode setText:[NSString stringWithFormat:@"%@",self.repastEntity.barcode]];
    
    self.ipc_commodityPic = [[UIImagePickerController alloc] init];
    //表示用户可编辑图片。
    self.ipc_commodityPic.allowsEditing = YES;
    self.ipc_commodityPic.delegate = self;
    
    self.tb_edit = [[UITableView alloc]initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tb_edit];
    self.tb_edit.delegate = self;
    self.tb_edit.dataSource = self;
    self.tb_edit.separatorColor = [UIColor clearColor];
    self.tb_edit.backgroundColor = [UIColor colorWithHexString:COLOR_GRAY_BG];
    if (self.repastEntity.barcodeType == YES) {
        self.tb_edit.tableFooterView = self.tb_footer;
    }else{
        self.tb_edit.tableFooterView = [UIView new];
    }
    
    self.v_commodityWeightUnit = [[CommodityWeightUnitView alloc]initWithFrame:CGRectMake(0, 0, 108, 162)];
    [self.view addSubview:self.v_commodityWeightUnit];
    [self.v_commodityWeightUnit setHidden:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(marerialSelectAction:) name:@"marerialSelect" object:nil];
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.repastEntity.barcodeType == NO) {
        if (section == 0) {
            return 0.01f;
        }else{
            return 44;
        }
    }else{
        return 0.01f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *str_title = @"";
    if (section == 0) {
        str_title = @"基本信息 （必填）";
    }else if(section == 1){
        str_title = @"规格信息（必填）";
    }else if (section == 2){
        str_title = @"商品原料 （肉,菜等，选填，可有多个）";
    }else if (section == 3){
        str_title = @"商品属性（辣度，甜度等，选填）";
    }
    AddCommoditySectionHeaderView *v_header = [[AddCommoditySectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) title:str_title];
    return v_header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.repastEntity.barcodeType == NO) {
        if (section == 0) {
            return nil;
        }else{
            NSString *str_title = @"";
            if (section == 1) {
                str_title = @"添加/管理规格";
            }else if(section == 2){
                str_title = @"添加/管理原料";
            }else if (section == 3){
                str_title = @"添加/管理属性";
            }
            AddCommoditySectionFooterView *v_footer = [[AddCommoditySectionFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) title:str_title];
            v_footer.btn_action.tag = section * 10000;
            [v_footer.btn_action addTarget:self action:@selector(v_footerAction:) forControlEvents:UIControlEventTouchUpInside];
            return v_footer;
        }
    }else{
        return nil;
    }
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.repastEntity.barcodeType == NO) {
        return 4;
    }else{
        return 2;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.repastEntity.barcodeType == NO) {
        if (section == 0) {
            return 1;
        }else if (section == 1){
            return [self.repastEntity.standards count];
        }else if (section == 2){
            return [self.repastEntity.materials count];
        }else if (section == 3){
            return [self.repastEntity.attributes count];
        }
    }else{
        if (section == 0) {
            return 1;
        }else if (section == 1){
            return 1;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"CommodityBasicInfoTableViewCell";
        CommodityBasicInfoTableViewCell *cell = (CommodityBasicInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[CommodityBasicInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.tf_commodityName.delegate = self;
        cell.tf_commodityName.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_commodityDsecrib.delegate = self;
        cell.tf_commodityDsecrib.tag = indexPath.section * 10000 + indexPath.row;
        
        [cell.btn_commodityBrand addTarget:self action:@selector(selectBrandAction) forControlEvents:UIControlEventTouchUpInside];
        cell.iv_commodityPic.tag = indexPath.section * 10000 + indexPath.row;
        UITapGestureRecognizer *iv_tgp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iv_commodityPicAction:)];
        [cell.iv_commodityPic addGestureRecognizer:iv_tgp];
        [cell.btn_commodityClassification addTarget:self action:@selector(btn_commodityClassificationAction) forControlEvents:UIControlEventTouchUpInside];
        [cell contentCellWithRepastEntity:self.repastEntity];
        return cell;
    }else if (indexPath.section == 1){
        static NSString *CellIdentifier = @"CommoditySpecificationTableViewCell";
        CommoditySpecificationTableViewCell *cell = (CommoditySpecificationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[CommoditySpecificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.tf_guigeName.delegate = self;
        cell.tf_guigeName.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_guigeDescrib.delegate = self;
        cell.tf_guigeDescrib.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_guigeWeight.delegate = self;
        cell.tf_guigeWeight.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_inventory.delegate = self;
        cell.tf_inventory.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_inStorePrice.delegate = self;
        cell.tf_inStorePrice.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_waimaiPrice.delegate = self;
        cell.tf_waimaiPrice.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_baozhuangNum.delegate = self;
        cell.tf_baozhuangNum.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.tf_baozhuangPrice.delegate = self;
        cell.tf_baozhuangPrice.tag = indexPath.section * 10000 + indexPath.row;
        
        cell.switch_Inventory.tag = indexPath.section * 10000 + indexPath.row;
        [cell.switch_Inventory addTarget:self action:@selector(switch_InventoryAction:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.switch_inStore.tag = indexPath.section * 10000 + indexPath.row;
        [cell.switch_inStore addTarget:self action:@selector(switch_inStoreAction:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.switch_waimai.tag = indexPath.section * 10000 + indexPath.row;
        [cell.switch_waimai addTarget:self action:@selector(switch_waimaiAction:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.iv_guigePic.tag = indexPath.section * 10000 + indexPath.row;
        UITapGestureRecognizer *iv_tgp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iv_commodityPicAction:)];
        [cell.iv_guigePic addGestureRecognizer:iv_tgp];
        cell.btn_guigeUnit.tag = indexPath.section * 10000 + indexPath.row;
        [cell.btn_guigeUnit addTarget:self action:@selector(btn_guigeUnitAction:) forControlEvents:UIControlEventTouchUpInside];
        
        StandardsEntity *entity = [self.repastEntity.standards objectAtIndex:indexPath.row];
        [cell contentCellWithStandardsEntity:entity];

        if (indexPath.row != self.repastEntity.standards.count - 1) {
            [cell.v_gray mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(11);
            }];
        }else{
            [cell.v_gray mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
        return cell;
    }else if (indexPath.section == 2){
        static NSString *CellIdentifier = @"CommodityMaterialsTableViewCell";
        CommodityMaterialsTableViewCell *cell = (CommodityMaterialsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[CommodityMaterialsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.btn_materials.tag = indexPath.section * 10000 + indexPath.row;
        cell.tf_weigth.delegate = self;
        cell.tf_weigth.tag = indexPath.section * 10000 + indexPath.row;
        cell.btn_materials.tag = indexPath.section * 10000 + indexPath.row;
        [cell.btn_materials addTarget:self action:@selector(btn_materialsAction:) forControlEvents:UIControlEventTouchUpInside];
        MaterialsEntity *entity = [self.repastEntity.materials objectAtIndex:indexPath.row];
        if (indexPath.row != self.repastEntity.materials.count - 1) {
            [cell.v_gray mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(11);
            }];
        }else{
            [cell.v_gray mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
        [cell contentCellWithMaterialsEntity:entity];
        return cell;
    }else if (indexPath.section == 3){
        static NSString *CellIdentifier = @"CommodityPropertyTableViewCell";
        CommodityPropertyTableViewCell *cell = (CommodityPropertyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell){
            cell = [[CommodityPropertyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.tf_propertyName.delegate = self;
        cell.tf_propertyName.tag = indexPath.section * 10000 + indexPath.row;
        cell.btn_addProperty.tag = indexPath.section * 10000 + indexPath.row;
        [cell.btn_addProperty addTarget:self action:@selector(addPropertyAction:) forControlEvents:UIControlEventTouchUpInside];
        AttributesEntity *entity = [self.repastEntity.attributes objectAtIndex:indexPath.row];
        [cell contentCellWithAttributesEntity:entity];
        if (indexPath.row != self.repastEntity.attributes.count - 1) {
            [cell.v_gray mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(11);
            }];
        }else{
            [cell.v_gray mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
        cell.deleteProperty = ^(NSInteger index) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:entity.contents];
            [array removeObjectAtIndex:index];
            entity.contents = array;
            [self.tb_edit reloadData];
        };
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)selectBrandAction{
    SelectBrandViewController *vc = [[SelectBrandViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.selectBrandComplete = ^(NSString *brandName, NSNumber *brandId) {
        self.repastEntity.brandName = brandName;
        self.repastEntity.brandId = brandId;
        [self.tb_edit reloadData];
    };
}

- (void)iv_commodityPicAction:(UITapGestureRecognizer *)tap{
    self.select_index = [tap view].tag;
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *addoneCAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.ipc_commodityPic.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.ipc_commodityPic animated:YES completion:nil];
    }];
    UIAlertAction *addtwoCAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.ipc_commodityPic.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:self.ipc_commodityPic animated:YES completion:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [actionSheetController addAction:addoneCAction];
    [actionSheetController addAction:addtwoCAction];
    [actionSheetController addAction:cancelAction];
    [self presentViewController:actionSheetController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey: @"UIImagePickerControllerEditedImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *imageLow = [ImageUtil imageWithCompressBigImage:image];
    NSData *img_data = UIImagePNGRepresentation(imageLow);
    //上传图片 上传成功后把图片名称  替换entity数据 刷新tableview 直接显示(通过objectKey)
    [RepastCommodityHandler getSecruityTokenPrepare:^{
        //        [MBProgressHUD showActivityMessageInView:nil];
    } success:^(id obj) {
        SecruityTokenEntity *entity = (SecruityTokenEntity *)obj;
        NSString *endpoint = @"http://oss-cn-zhangjiakou.aliyuncs.com";
        // 移动端建议使用STS方式初始化OSSClient。可以通过sample中STS使用说明了解更多(https://github.com/aliyun/aliyun-oss-ios-sdk/tree/master/DemoByOC)
        id<OSSCredentialProvider> credential = [[OSSStsTokenCredentialProvider alloc] initWithAccessKeyId:entity.accessKeyId secretKeyId:entity.accessKeySecret securityToken:entity.securityToken];
        self.client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
        OSSPutObjectRequest * put = [OSSPutObjectRequest new];
        
        put.bucketName =@"gouku-ware";
        put.objectKey = [AppUtils uuid];
        put.contentType = @"image/png";
        put.uploadingData = img_data; // 直接上传NSData
        
        put.uploadProgress = ^(int64_t bytesSent,int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
            //        NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
        };
        
        OSSTask * putTask = [self.client putObject:put];
        
        // 上传阿里云
        [putTask continueWithBlock:^id(OSSTask *task) {
            if (!task.error) {
                NSLog(@"upload object success!");
                //                [[NSNotificationCenter defaultCenter] postNotificationName:@"mbhudHide" object:nil];
                //                [MBProgressHUD hideHUD];
                int section = (int)self.select_index / 10000;
                int row = (int)self.select_index % 10000;
                if (section == 0) {
                    self.repastEntity.pictures = put.objectKey;
                }else if (section == 1){
                    StandardsEntity *entity = [self.repastEntity.standards objectAtIndex:row];
                    entity.pictures = put.objectKey;
                }
                [self.tb_edit reloadData];

            } else {
                NSLog(@"upload object failed, error: %@" , task.error);
            }
            return nil;
        }];
        
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
    
}

- (void)btn_commodityClassificationAction{
    ShopClassificationViewController *vc = [[ShopClassificationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    vc.goBackShop = ^(ShopClassificationEntity *shopClassificationEntity) {
        self.repastEntity.categoryName = shopClassificationEntity.name;
        self.repastEntity.categoryId = [NSNumber numberWithInt:(int)shopClassificationEntity._id];
        [self.tb_edit reloadData];
    };
}

- (void)btn_guigeUnitAction:(UIButton *)btn_sender{
    int row = (int)btn_sender.tag % 10000;
    UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
    CGRect rect = [btn_sender convertRect:self.view.bounds toView:window];
    [self.v_commodityWeightUnit setFrame:CGRectMake(rect.origin.x - 30, rect.origin.y + 35, 108, 162)];
    [self.v_commodityWeightUnit setHidden:NO];
    WS(weakSelf);
    self.v_commodityWeightUnit.selectWeightUnit = ^(NSString *weightUnit) {
        StandardsEntity *entity = [weakSelf.repastEntity.standards objectAtIndex:row];
        entity.weightNnit = weightUnit;
        [weakSelf.tb_edit reloadData];
        [weakSelf.v_commodityWeightUnit setHidden:YES];
    };
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    int section = (int)textField.tag / 10000;
    int row = (int)textField.tag % 10000;
    if (section == 0) {
        CommodityBasicInfoTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        if (cell.tf_commodityName == textField) {
            self.repastEntity.name = textField.text;
        }else if (cell.tf_commodityDsecrib == textField){
            self.repastEntity.desc = textField.text;
        }
        
    }
    else if (section == 1) {
        CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        NSMutableArray *arr_guige = [NSMutableArray arrayWithArray:self.repastEntity.standards];
        StandardsEntity *entity = [arr_guige objectAtIndex:row];
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
        
    }
    else if (section == 2){
        CommodityMaterialsTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        NSMutableArray *arr_yuanliao = [NSMutableArray arrayWithArray:self.repastEntity.materials];
        MaterialsEntity *entity = [arr_yuanliao objectAtIndex:row];
        if (cell.tf_weigth == textField) {
            entity.content = textField.text;
        }
    }else if (section == 3){
        CommodityPropertyTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        NSMutableArray *arr_attributes = [NSMutableArray arrayWithArray:self.repastEntity.attributes];
        AttributesEntity *entity = [arr_attributes objectAtIndex:row];
        if (cell.tf_property == textField) {
            entity.attribute = textField.text;
        }else if (cell.tf_propertyName == textField){
            entity.name = textField.text;
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    int section = (int)textField.tag / 10000;
    int row = (int)textField.tag % 10000;
    if (section == 0) {
        CommodityBasicInfoTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        if (cell.tf_commodityName == textField) {
            if (textField.text.length + string.length > 30) {
                return NO;
            }
            if (textField.text.length < range.location + range.length) {
                return NO;
            }
        }else if (cell.tf_commodityDsecrib == textField){
            if (textField.text.length + string.length > 250) {
                return NO;
            }
            if (textField.text.length < range.location + range.length) {
                return NO;
            }
        }
        
    }
    else if (section == 1) {
        CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        if (cell.tf_guigeName == textField) {
            if (textField.text.length + string.length > 10) {
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
        
    }
    else if (section == 2){
        CommodityMaterialsTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        if (cell.tf_weigth == textField) {
            if (textField.text.length + string.length > 6) {
                return NO;
            }
            if (textField.text.length < range.location + range.length) {
                return NO;
            }
        }
    }else if (section == 3){
        CommodityPropertyTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
        if (cell.tf_property == textField) {
            if (textField.text.length + string.length > 10) {
                return NO;
            }
            if (textField.text.length < range.location + range.length) {
                return NO;
            }
        }else if (cell.tf_propertyName == textField){
            if (textField.text.length + string.length > 10) {
                return NO;
            }
            if (textField.text.length < range.location + range.length) {
                return NO;
            }
        }
    }
    return YES;
}


- (void)btn_materialsAction:(UIButton *)sender{
    self.select_index = sender.tag;
    SelectMarerialsViewController *vc = [[SelectMarerialsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)switch_InventoryAction:(UISwitch *)sender{
    int section = (int)sender.tag / 10000;
    int row = (int)sender.tag % 10000;
    CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
    NSMutableArray *arr_guige = [NSMutableArray arrayWithArray:self.repastEntity.standards];
    StandardsEntity *entity = [arr_guige objectAtIndex:row];
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
}

- (void)switch_inStoreAction:(UISwitch *)sender{
    int section = (int)sender.tag / 10000;
    int row = (int)sender.tag % 10000;
    CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
    NSMutableArray *arr_guige = [NSMutableArray arrayWithArray:self.repastEntity.standards];
    StandardsEntity *entity = [arr_guige objectAtIndex:row];
    if (cell.switch_inStore.on == YES) {
        entity.storeUsing = YES;
        [cell.lb_tangshiT setHidden:NO];
        [cell.lb_tangshiT_xing setHidden:NO];
        [cell.tf_inStorePrice setHidden:NO];
    }else{
        entity.storeUsing = NO;
        [cell.lb_tangshiT setHidden:YES];
        [cell.lb_tangshiT_xing setHidden:YES];
        [cell.tf_inStorePrice setHidden:YES];
    }
}

- (void)switch_waimaiAction:(UISwitch *)sender{
    int section = (int)sender.tag / 10000;
    int row = (int)sender.tag % 10000;
    CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
    NSMutableArray *arr_guige = [NSMutableArray arrayWithArray:self.repastEntity.standards];
    StandardsEntity *entity = [arr_guige objectAtIndex:row];
    if (cell.switch_waimai.on == YES) {
        entity.onlineStoreUsing = YES;
        [cell.lb_waimaiT setHidden:NO];
        [cell.lb_waimaiT_xing setHidden:NO];
        [cell.tf_waimaiPrice setHidden:NO];
    }else{
        entity.onlineStoreUsing = NO;
        [cell.lb_waimaiT setHidden:YES];
        [cell.lb_waimaiT_xing setHidden:YES];
        [cell.tf_waimaiPrice setHidden:YES];
    }
}

- (void)addPropertyAction:(UIButton *)btn_sender{
    [self.view endEditing:YES];
    int section = (int)btn_sender.tag / 10000;
    int row = (int)btn_sender.tag % 10000;
    CommodityPropertyTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
    AttributesEntity *entity = [self.repastEntity.attributes objectAtIndex:row];
    NSMutableArray *arr_value = [NSMutableArray arrayWithArray:entity.contents];
    NSMutableArray *arr_attributes = [NSMutableArray arrayWithArray:self.repastEntity.attributes];
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
    [arr_attributes replaceObjectAtIndex:row withObject:entity];
    self.repastEntity.attributes = arr_attributes;
    [self.tb_edit reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:section]] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)v_footerAction:(UIButton *)sender{
    int section = (int)sender.tag / 10000;
    if (section == 1) {
        //规格管理
        ManagerSpecificationViewController *vc = [[ManagerSpecificationViewController alloc]init];
        vc.arr_specification = self.repastEntity.standards;
        [self.navigationController pushViewController:vc animated:YES];
        vc.selectSpecificationComplete = ^(NSArray *arr_Specification, NSMutableArray *arr_deleteIds) {
            self.repastEntity.standards = arr_Specification;
            [self.arr_deleteSkuIds addObjectsFromArray:arr_deleteIds];
            [self.tb_edit reloadData];
        };
    }else if (section == 2) {
        self.select_index = 999999;
        ManagerMaterialsViewController *vc = [[ManagerMaterialsViewController alloc]init];
        vc.arr_materials = self.repastEntity.materials;
        [self.navigationController pushViewController:vc animated:YES];
        vc.selectMaterialsComplete = ^(NSArray *arr_Materials,NSMutableArray *arr_deleteIds) {
            self.repastEntity.materials = arr_Materials;
            [self.arr_deleteIds addObjectsFromArray:arr_deleteIds];
            [self.tb_edit reloadData];
        };
    }else if (section == 3){
        ManagerPropertyViewController *vc = [[ManagerPropertyViewController alloc]init];
        vc.arr_property = self.repastEntity.attributes;
        [self.navigationController pushViewController:vc animated:YES];
        vc.selectPropertyComplete = ^(NSArray *arr_attritus,NSMutableArray *arr_deleteIds) {
            self.repastEntity.attributes = arr_attritus;
            [self.arr_deleteIds addObjectsFromArray:arr_deleteIds];
            [self.tb_edit reloadData];
        };
    }
}

- (void)marerialSelectAction:(NSNotification *)noti{
    if (self.select_index != 999999) {
        int row = (int)self.select_index % 10000;
        MaterialsEntity *entity = [self.repastEntity.materials objectAtIndex:row];
        entity.name = [noti.userInfo objectForKey:@"materialName"];
        entity.materialId = [noti.userInfo objectForKey:@"id"];
        [self.tb_edit reloadData];
    }
}

- (void)rightBarAction{
    
    if (self.repastEntity.barcodeType == NO) {
        NSDictionary *dic = [self getObjectData:self.repastEntity];
        if ([self.repastEntity.name isEqualToString:@""]) {
            [MBProgressHUD showErrorMessage:@"请填写商品名称"];
            return;
        }if ([self.repastEntity.categoryName isEqualToString:@""]){
            [MBProgressHUD showErrorMessage:@"请填选择分类"];
            return;
        }
        for (int i = 0; i < self.repastEntity.standards.count; i++) {
            CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
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
        for (MaterialsEntity *entity in self.repastEntity.materials) {
            if (entity.name.length == 0) {
                [MBProgressHUD showErrorMessage:@"请填写原料名称"];
                return;
            }
            if (entity.content.length == 0) {
                [MBProgressHUD showErrorMessage:@"请填写原料重量"];
                return;
            }
        }
        
        for (AttributesEntity *entity in self.repastEntity.attributes) {
            if ([entity.name isEqualToString:@""]) {
                [MBProgressHUD showErrorMessage:@"请填写属性名称"];
                return;
            }
            if (entity.contents.count < 2) {
                [MBProgressHUD showErrorMessage:@"每个属性至少要有两个属性选项"];
                return;
            }
        }
        for (StandardsEntity *entity_standards in self.repastEntity.standards) {
            if (entity_standards.storeUsing == NO) {
                self.repastEntity.storeUsing = NO;
            }
            if (entity_standards.onlineStoreUsing == NO) {
                self.repastEntity.onlineStoreUsing = NO;
            }
        }
        [self postCommodityInformationWithDic:dic];
    }else{
        self.repastEntity.barcodeType = YES;
        for (StandardsEntity *entity_standards in self.repastEntity.standards) {
            if (entity_standards.storeUsing == NO) {
                self.repastEntity.storeUsing = NO;
            }
            if (entity_standards.onlineStoreUsing == NO) {
                self.repastEntity.onlineStoreUsing = NO;
            }
        }
        NSDictionary *dic = [self getObjectData:self.repastEntity];
        if ([self.repastEntity.name isEqualToString:@""]) {
            [MBProgressHUD showErrorMessage:@"请填写商品名称"];
            return;
        }if ([self.repastEntity.categoryName isEqualToString:@""]){
            [MBProgressHUD showErrorMessage:@"请填选择分类"];
            return;
        }
        for (int i = 0; i < self.repastEntity.standards.count; i++) {
            CommoditySpecificationTableViewCell *cell = [self.tb_edit cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:1]];
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
        [self postCommodityInformationWithDic:dic];
    }
}

- (void)postCommodityInformationWithDic:(NSDictionary *)dic{
    if (self.arr_deleteSkuIds.count > 0) {
        [dic setValue:self.arr_deleteSkuIds forKey:@"deleteSkuIds"];
    }
    if (self.arr_deleteIds.count > 0) {
        [dic setValue:self.arr_deleteIds forKey:@"deleteIds"];
    }
    [RepastCommodityHandler addRepastCommodityWithDic:dic prepare:^{
        [MBProgressHUD showActivityMessageInView:@"上传中"];
    } success:^(id obj) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccessMessage:@"成功"];
        [self.navigationController popViewControllerAnimated:YES];
        if (self.changeRepastCommodity) {
            self.changeRepastCommodity(self.repastEntity);
        }
    } failed:^(NSInteger statusCode, id json) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showErrorMessage:[NSString stringWithFormat:@"%ld:%@",statusCode,json]];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.v_commodityWeightUnit setHidden:YES];
    if (scrollView.dragging == YES) {
        [self.view endEditing:YES];
    }
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

- (NSDictionary*)getObjectData:(id)obj
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);//获得属性列表
    for(int i = 0;i < propsCount; i++){
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];//获得属性的名称
        id value = [obj valueForKey:propName];//kvc读值
        if(value == nil){
            //            value = [NSNull null];
            value = @"";
        }
        else{
            value = [self getObjectInternal:value];//自定义处理数组，字典，其他类
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

- (id)getObjectInternal:(id)obj{
    
    if([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]]){
        return obj;
    }
    if([obj isKindOfClass:[NSArray class]]) {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    if([obj isKindOfClass:[NSDictionary class]]){
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys){
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getObjectData:obj];
}

@end
