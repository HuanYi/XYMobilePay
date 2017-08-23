//
//  ViewController.m
//  XYTestPay
//
//  Created by xieyi on 2017/8/10.
//  Copyright © 2017年 HY. All rights reserved.
//

#import "ViewController.h"
#import "XYPayHelper.h"


#define kUrlScheme      @"mobilePay" // 这个是你定义的 URL Scheme，支付宝、微信支付、银联和测试模式需要。

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *alipayButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 80, 100, 60)];
    [self.view addSubview:alipayButton];
    alipayButton.backgroundColor = [UIColor yellowColor];
    [alipayButton setTitle:@"支付宝支付" forState:UIControlStateNormal];
    [alipayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alipayButton addTarget:self action:@selector(creatOrder:) forControlEvents:UIControlEventTouchUpInside];
    alipayButton.tag = 100;
    
    
    UIButton *wechatButton = [[UIButton alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(alipayButton.frame)+40, 100, 60)];
    [self.view addSubview:wechatButton];
    wechatButton.backgroundColor = [UIColor yellowColor];
    [wechatButton setTitle:@"微信支付" forState:UIControlStateNormal];
    [wechatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [wechatButton addTarget:self action:@selector(creatOrder:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)creatOrder:(UIButton *)sender{
    
    NSDictionary *dict = nil;
    if (sender.tag == 100) { // 支付宝
        dict = @{@"channel":@"alipay",@"credential":@{@"alipay":@{@"orderInfo":@"app_id=2015111900835425&method=alipay.trade.app.pay&format=JSON&charset=utf-8&sign_type=RSA2&timestamp=2017-08-22%2010%3A31%3A25&version=1.0&biz_content=%7B%22body%22%3A%22Your%20Body%20-%20%E8%AE%A2%E5%8D%95%E8%AF%A6%E6%83%85%22%2C%22subject%22%3A%22%E6%B5%8B%E8%AF%95%E8%AE%A2%E5%8D%95%20by%20demo%2020170822-103125%22%2C%22out_trade_no%22%3A%22220445929039e803%22%2C%22total_amount%22%3A0.1%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22timeout_express%22%3A%225m%22%7D&notify_url=https%3A%2F%2Fnotify.pingxx.com%2Fnotify%2Fcharges%2Fch_WfLOmLyzfHK0WPyTuTmbPiXT&sign=m67xEDoYUNWw5%2B1pW6Bfw3d9GyhqMgZ%2FWOwNfZydNw5nODrWqCJE%2FhcgDhhOlJ7Kgf9ThxDo1x3mDbNiTwBt8UY9CyT%2F%2F0dw%2BTqnHoFmXnXMm3E4ryfyO18AdsvktjVLMZ6Ee8FyJB6ra4BnRxH3Js1NE6mkB72hHXXk9kkUNcjwP4yrxn9KMWhEBxd%2BhZWhdAYNpMqFVcUujhByjo%2BiM%2BLQt6kiZvguv65o7pID7%2BguPxZWHeSxGkNay9Fy0IKpyuRNA%2FGmnoVTvWcMJRsAisZa9npHU46BbmfL%2Bbvpl3FhswP3xpVVPd3a7DjRT0vKxoMu%2BUgcYPyWPz3b8Tl%2BSw%3D%3D"}}};
        
    }else{ // 微信
        dict = @{@"channel":@"wx",@"credential":@{@"wx":@{
                                                          @"appId": @"wx3eba2286c6acb2b6",
                                                          @"partnerId": @"1250015001",
                                                          @"prepayId": @"wx2017082210283022c58751fd0442906086",
                                                          @"nonceStr": @"daace5fae915c01d143bca5ad40f09c8",
                                                          @"timeStamp": @1503368910,
                                                          @"packageValue": @"Sign=WXPay",
                                                          @"sign": @"44FC7B6FD4BC2B0ACFE9666F47660015"
                                                          
                                                          }}};
        
    }
    
    
    
    [[XYPayHelper shareInstance] createPayOrder:dict appURLScheme:kUrlScheme withCompletion:^(NSString *result, NSString *error) {
        
        NSLog(@"resultCode:%@",result);
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
