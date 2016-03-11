//
//  HEFMeViewController.h
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <WMPageController/WMPageController.h>


@interface HEFMeViewController : WMPageController

@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIButton *homeButton;


+ (UINavigationController *)defaultMeUINavigationController;
@end
