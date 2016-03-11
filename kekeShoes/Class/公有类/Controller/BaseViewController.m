//
//  BaseViewController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/10.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];//__MainBackgroundColor
    self.navigationController.navigationBarHidden = YES;
    
}

- (CGFloat)width
{
    return self.view.frame.size.width;
}

- (CGFloat)height
{
    return self.view.frame.size.height;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
