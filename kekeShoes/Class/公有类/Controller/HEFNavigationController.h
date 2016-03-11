//
//  HEFNavigationController.h
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface HEFNavigationController : BaseViewController<UIWebViewDelegate>

@property (nonatomic,strong) UIView *navibarView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *homeButton;
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic,strong) UIView *mask;
@property (nonatomic,strong) UIButton *closeBtn;


- (void)createNaviBar;


@end
