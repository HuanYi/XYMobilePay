//
//  XYPayHelper.h
//  hospmall
//
//  Created by h on 16/5/16.
//  Copyright © 2016年 yuzhidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  支付结果调用(支付宝/微信)
 *
 *  @param result           支付结果:@"success",@"cancel",@"fail"
 *  @param error            错误信息
 */
typedef void(^payCompletionBlock)(NSString *result, NSString *error);

@interface XYPayHelper : NSObject

+ (XYPayHelper *)shareInstance;

/**
 *  支付调用接口(支付宝/微信)
 *
 *  @param order           Charge 对象(JSON 格式字符串 或 NSDictionary)
 *  @param scheme           URL Scheme，支付宝渠道回调需要
 *  @param completionBlock  支付结果回调 Block
 */
- (void)createPayOrder:(NSObject *)order appURLScheme:(NSString *)scheme withCompletion:(payCompletionBlock)completionBlock;

/**
 *  回调结果接口(支付宝/微信/测试模式)
 *
 *  @param url              结果url
 *  @param completion  支付结果回调 Block，保证跳转支付过程中，当 app 被 kill 掉时，能通过这个接口得到支付结果
 *
 *  @return                 当无法处理 URL 或者 URL 格式不正确时，会返回 NO。
 */
+ (BOOL)handleOpenURL:(NSURL *)url withCompletion:(payCompletionBlock)completion;

/**
 *  设置 Debug 是否开启(放在创建支付之前调用)
 *
 *  @param enabled    是否启用，默认不开启
 */
+ (void)setDebugEnable:(BOOL)enabled;

@end
