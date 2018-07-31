//
//  RepastCommodityHandler.m
//  GouKuRepast
//
//  Created by 窦建斌 on 2018/7/23.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "RepastCommodityHandler.h"
#import "SecruityTokenEntity.h"
#import "RepastEntity.h"

@implementation RepastCommodityHandler
//图片上传获取Secruity-Token
+ (void)getSecruityTokenPrepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_GET_SecruityToken];
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestGet
                                       parameters:nil
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  SecruityTokenEntity *entity = [SecruityTokenEntity parseSecruityTokenEntityWithJson:[responseObject objectForKey:@"data"]];
                                                  success(entity);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//获取一级原料分类
+ (void)getFirstMaterialCategoryWithPage:(int)page prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_GET_MaterialFirstCategory];
    NSDictionary *dic = @{@"page":[NSNumber numberWithInt:page + 1]
                          };
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr = [responseObject objectForKey:@"data"];
                                                  success(arr);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//获取二级原料分类
+ (void)getSecondMaterialCategoryWithPage:(int)page materialId:(NSString *)materialId prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_GET_MaterialSecondCategory];
    NSDictionary *dic = @{@"page":[NSNumber numberWithInt:page + 1],
                          @"materialId":materialId
                          };
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr = [responseObject objectForKey:@"data"];
                                                  success(arr);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//获取三级原料分类
+ (void)getThiredMaterialCategoryWithPage:(int)page materialId:(NSString *)materialId prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_GET_MaterialThriedCategory];
    NSDictionary *dic = @{@"page":[NSNumber numberWithInt:page + 1],
                          @"materialId":materialId
                          };
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr = [responseObject objectForKey:@"data"];
                                                  success(arr);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//搜索原料
+(void)materialSearchWithpage:(int)page material:(NSString *)material prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_MaterialSearch];
    NSDictionary *dic = @{@"material":material,
                          @"page":[NSNumber numberWithInt:page]
                          };
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr = [responseObject objectForKey:@"data"];
                                                  success(arr);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//搜索品牌
+ (void)brandSearchWithPage:(int)page brand:(NSString *)brand prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_BrandSearch];
    NSDictionary *dic = @{@"brand":brand,
                          @"page":[NSNumber numberWithInt:page + 1]
                          };
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  NSArray *arr = [responseObject objectForKey:@"data"];
                                                  success(arr);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//新建商品
+ (void)addRepastCommodityWithDic:(NSDictionary *)dic prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_AddRepastCommodity];
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0) {
                                                  success(nil);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//获取所有商品
+ (void)repastCommodityListWithKeyWord:(NSString *)keyWord categoryId:(NSNumber *)categoryId status:(NSNumber *)status prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_RepastCommodityList];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (categoryId) {
        [dic setObject:categoryId forKey:@"categoryId"];
    }
    if ([status intValue] != 999) {
        [dic setObject:status forKey:@"status"];
    }
    if (keyWord) {
        [dic setObject:keyWord forKey:@"keyWord"];
    }
//    [dic setObject:[NSNumber numberWithInt:pageNum] forKey:@"page"];
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0 ) {
                                                  NSArray *arr_data = [RepastEntity parseRepastEntityListWithJson:[responseObject objectForKey:@"data"]];
                                                  success(arr_data);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//餐饮商品上下架
+ (void)repastCommodityUpdateWithSpu:(NSNumber *)spu type:(NSNumber *)type prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_RepastUpdateStatus];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (spu) {
        [dic setObject:spu forKey:@"spu"];
    }
    if (type) {
        [dic setObject:type forKey:@"type"];
    }
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:dic
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0 ) {
                                                  success(nil);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//餐饮商品批量上下架
+ (void)repastCommodityUpdateListWithArr:(NSArray *)arr prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_RepastUpdateStatusList];
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:arr
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0 ) {
                                                  success(nil);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//餐饮商品删除
+ (void)repastCommodityDeleteWithSpu:(NSNumber *)spu prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@%@",API_Other,API_GET_RepastDelete,spu];   
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestGet
                                       parameters:nil
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0 ) {
                                                  success(nil);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//餐饮商品批量删除
+ (void)repastCommodityDeleteListWithArr:(NSArray *)arr prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@",API_Other,API_POST_RepastDeleteList];
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestPost
                                       parameters:arr
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0 ) {
                                                  success(nil);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
}

//通过条形码查询商品信息
+ (void)getRepastInformationWithBarCode:(NSString *)barcode prepare:(PrepareBlock)prepare success:(SuccessBlock)success failed:(FailedBlock)failed{
    NSString *str_url = [NSString stringWithFormat:@"%@%@%@",API_Other,API_GET_RepastWithBarcode,barcode];
    [[RTHttpClient defaultClient] requestWithPath:str_url
                                           method:RTHttpRequestGet
                                       parameters:nil
                                          prepare:prepare
                                          success:^(NSURLSessionDataTask *task, id responseObject) {
                                              if ([[responseObject objectForKey:@"errCode"] intValue] == 0 ) {
                                                  RepastEntity *entity = [RepastEntity parseRepastEntityWithJson:[responseObject objectForKey:@"data"]];
                                                  success(entity);
                                              }else{
                                                  [MBProgressHUD hideHUD];
                                                  [MBProgressHUD showErrorMessage:[responseObject objectForKey:@"errMessage"]];
                                              }
                                          } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                              [self handlerErrorWithTask:task error:error complete:failed];
                                          }];
    
}
@end
