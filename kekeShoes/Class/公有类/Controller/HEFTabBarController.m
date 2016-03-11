//
//  HEFTabBarController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "HEFTabBarController.h"

#import "HEFTribeViewController.h"          //部落
#import "HEFClassifyViewController.h"       //分类
#import "HEFHomePageViewController.h"       //主页
#import "HEFCartViewController.h"           //购物车
#import "HEFMeViewController.h"             //我的

@interface HEFTabBarController ()

@end

@implementation HEFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *tribeVC = [HEFTribeViewController defaultTribeUINavigationController];
    [self setupChildController:tribeVC imageName:@"tabbar_find_n" selectedImage:@"tabbar_find_h"];
    
    HEFClassifyViewController *classifyVC = [[HEFClassifyViewController alloc] init];
    [self setupChildController:classifyVC imageName:@"tabbar_download_n" selectedImage:@"tabbar_download_h"];
    
    HEFHomePageViewController *homePageVC = [[HEFHomePageViewController alloc] init];
    [self setupChildController:homePageVC imageName:@"tabbar_np_normal" selectedImage:@"tabbar_np_normal"];
    
    HEFCartViewController *cartVC = [[HEFCartViewController alloc] init];
    [self setupChildController:cartVC imageName:@"tabbar_sound_n" selectedImage:@"tabbar_sound_h"];
    
    UINavigationController *meVC = [HEFMeViewController defaultMeUINavigationController];
    [self setupChildController:meVC imageName:@"tabbar_me_n" selectedImage:@"tabbar_me_h"];
    
}


/**  绑定各个控制器, 顺便设置属性 */
- (void)setupChildController:(UIViewController *)vc imageName:(NSString *)imgName selectedImage:(NSString *)selectedImgName {
    // 设置图片间距
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    // 设置图片的不渲染
    UIImage *image = [[UIImage imageNamed:selectedImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = image;
    [self addChildViewController:vc];
}

@end
