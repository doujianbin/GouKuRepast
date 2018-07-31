//
//  AccountCashEntity.h
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/4/8.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "BaseEntity.h"
#import "BankCardEntity.h"

@interface AccountCashEntity : BaseEntity

@property (nonatomic ,assign)double            money;                 //购酷账户余额
@property (nonatomic ,assign)double            moneyNeedCheck;        //购酷待结算金额
@property (nonatomic ,assign)int               toCashNum;             //购酷提现次数
@property (nonatomic ,assign)double            lowMoney;
@property (nonatomic ,strong)BankCardEntity    *bankCard;
@property (nonatomic ,assign)double            elemeMoney;            //饿了么账户余额
@property (nonatomic ,assign)double            elemeMoneyNeedCheck;   //饿了么待结算金额
@property (nonatomic ,assign)int               elemeToCashNum;        //饿了么提现次数
@property (nonatomic ,assign)double            mtMoney;               //美团账户余额
@property (nonatomic ,assign)double            mtMoneyNeedCheck;      //美团待结算金额
@property (nonatomic ,assign)int               mtToCashNum;           //美团提现次数

+ (NSArray *)parseStandardListWithJson:(id)json;
+ (AccountCashEntity *)parseStandardEntityWithJson:(id)json;

@end

/*
 "mtMoney":<double>                  //美团账户余额
 "mtMoneyNeedCheck"<double>          //美团待结算金额
 "mtToCashNum":<int>                 //美团提现次数
"money":<double>                    //账户余额
"moneyNeedCheck":<double>           //待结算金额
"toCashNum"<int>                    //提现次数
"lowMoney"<double>                  //最低提现金额
"cards":<BankCard>                  //银行卡信息  为null时没有绑定
 */
