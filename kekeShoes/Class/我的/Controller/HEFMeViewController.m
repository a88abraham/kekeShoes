//
//  HEFMeViewController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "HEFMeViewController.h"

@interface HEFMeViewController ()

@end

@implementation HEFMeViewController

+ (UINavigationController *)defaultMeUINavigationController {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HEFMeViewController *tribeVC = [[HEFMeViewController alloc] init];
        
        navi = [[UINavigationController alloc] initWithRootViewController:tribeVC];
        
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"用户个人中心";
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more_home"] style:UIBarButtonItemStylePlain target:self action:@selector(createRightView)];
    [self.navigationItem setRightBarButtonItem:rightButton];
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
    //[self createRightView];
}

- (void) createRightView{
    
//    _homeButton = [[UIButton alloc]initWithFrame:CGRectMake(kWindowW - 44 - 10,  +20, 44 + 10, 44 - 4)];
//    [_homeButton setBackgroundImage:[UIImage imageNamed:@"more_home"] forState:UIControlStateNormal];
    
    
    _rightView = [[UIView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width - 101, 0, 100.0f, 200)];
    [_rightView setBackgroundColor:[UIColor redColor]];
    
#pragma mark 定制右上角菜单
    NSArray * imageArray = @[@"order001",@"return001",@"home001",@"user001",@"service001"];
    NSArray * titleArray = @[@"购物车   ",@"消息中心",@"商城首页",@"个人中心",@"联系客服"];
    for (int i = 0; i < 5; i ++) {
        UIButton * car = [UIButton buttonWithType:UIButtonTypeCustom];
        [car setTitle:titleArray[i] forState:UIControlStateNormal];
        [car setImage:[UIImage imageNamed:(imageArray[i])] forState:UIControlStateNormal];
        car.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        [car setImageEdgeInsets:UIEdgeInsetsMake(0, -16, 0, 0) ];
        [car setTitleEdgeInsets:UIEdgeInsetsMake(0, -16, 0, 0)];
        [car setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [car.titleLabel setTextAlignment:NSTextAlignmentLeft];
        [car setTintColor:[UIColor whiteColor]];
        [car setBackgroundColor: [UIColor clearColor]];
        [car setFrame:CGRectMake(0, i * 41, 100, 40)];
        [car setTag:800 + i];
        [car addTarget:self action:@selector(ButtonPressedCar:) forControlEvents:UIControlEventTouchUpInside];
        [_rightView addSubview:car];
        
        
    }
    
    [self.view addSubview:_rightView];


}

-(void)ButtonPressedCar:(UIButton * )sender{


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
