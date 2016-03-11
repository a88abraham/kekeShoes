//
//  HEFTribeViewController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "HEFTribeViewController.h"

#import "HomePageViewController.h"      //(部落)推荐页面
#import "HealthtipsViewController.h"    //(部落)养生页面
#import "WitticismViewController.h"     //(部落)心灵鸡汤页面
#import "CateViewController.h"          //(部落)美食页面
#import "EmotionViewController.h"       //(部落)情感页面

@interface HEFTribeViewController ()

@end

@implementation HEFTribeViewController

+ (UINavigationController *)defaultTribeUINavigationController {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        HEFTribeViewController *tribeVC = [[HEFTribeViewController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"推荐",@"养生",@"心灵鸡汤",@"美食",@"情感",@"美女",@"图片"]];
        //        WMPageController的设置
        tribeVC.menuViewStyle = WMMenuViewStyleFoold;
        tribeVC.titleColorSelected = [UIColor blackColor];
        tribeVC.progressColor = [UIColor orangeColor];
//        tribeVC.menuViewStyle = WMMenuViewStyleLine;
//        tribeVC.titleColorSelected = [UIColor orangeColor];
//        tribeVC.progressColor = [UIColor redColor];
//        tribeVC.progressHeight = 3.5;
        navi = [[UINavigationController alloc] initWithRootViewController:tribeVC];

    });
    return navi;
}


// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[HomePageViewController class],[HealthtipsViewController class], [WitticismViewController class], [CateViewController class], [EmotionViewController class], [CateViewController class], [CateViewController class]];
}

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
