//
//  HEFTribeViewController.h
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <WMPageController/WMPageController.h>

/**
 *  部落页面 --- 继承 WMPageController
 */
@interface HEFTribeViewController : WMPageController

/** 单例一个带有WMPageController的Navi*/
+ (UINavigationController *)defaultTribeUINavigationController;

@end
