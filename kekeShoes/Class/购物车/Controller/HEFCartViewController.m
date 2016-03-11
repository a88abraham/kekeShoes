//
//  HEFCartViewController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "HEFCartViewController.h"

@interface HEFCartViewController ()

@end

@implementation HEFCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    // 1. 创建webView, 展示首页
    UIWebView *homeWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    
    // 根据屏幕大小自动调整页面尺寸
    homeWebView.scalesPageToFit = YES;
    homeWebView.scrollView.bounces = NO;
    [self.view addSubview:homeWebView];
    
    // 2. 设置请求URL
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.kknx6.com/Mobile/Client/Login?RedirctUrl=/Mobile/UserInfo/User"]];
    
    // 加载页面
    [homeWebView loadRequest:request];
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
