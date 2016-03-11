//
//  HEFTribeViewController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "HEFTribeViewController.h"


@interface HEFTribeViewController ()

@end

@implementation HEFTribeViewController

+ (UINavigationController *)defaultTribeUINavigationController {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HEFTribeViewController *tribeVC = [[HEFTribeViewController alloc] init];
        navi = [[UINavigationController alloc] initWithRootViewController:tribeVC];

    });
    return navi;
}


// 存响应的控制器
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"部落";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_me_h"] style:UIBarButtonItemStylePlain target:self action:@selector(hhhh:)];
    [self.navigationItem setRightBarButtonItem:rightButton];
    
  //  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(hhhh:)];
    NSLog(@"%@",NSStringFromCGPoint(self.scrollView.contentOffset));
}

- (void)hhhh:(UIButton *)sender{

    
}


@end
