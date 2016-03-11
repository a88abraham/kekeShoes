//
//  HEFNavigationController.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "HEFNavigationController.h"
#import "HEFCartViewController.h"
#import "HEFMeViewController.h"


@interface HEFNavigationController ()
{
    UIView *serviceView;
    UIView *QQshowView;
    NSString *qqnumber;
    NSInteger goodNumber;
}
@property (nonatomic, strong) NSString * messageTxt;
@property (nonatomic, strong) NSString * carTxt;
@property (nonatomic,strong) UILabel *carGoodsNumberLabel;
@property (nonatomic,strong) UILabel *messageNumberLabel;
@property (nonatomic, strong) NSMutableArray *arrynumber;
@property (nonatomic, strong) NSMutableArray *mutableArray;@end

@implementation HEFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNaviBar];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self getmessage];
    //[self getGoods];
    self.homeButton.selected = NO;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _mask.hidden = YES;
    _rightView.hidden  = YES;
    [serviceView removeFromSuperview];
    [QQshowView removeFromSuperview];
    
}
- (void)createNaviBar
{
    self.navigationController.navigationBarHidden = YES;
    _arrynumber = [NSMutableArray array];
    _mutableArray = [NSMutableArray array];
    
    [_backBtn removeFromSuperview];
    [_titleLabel removeFromSuperview];
    [_homeButton removeFromSuperview];
    [_navibarView removeFromSuperview];
    
    [_mask removeFromSuperview];
    [_rightView removeFromSuperview];
    
    _navibarView = [[UIView alloc] initWithFrame:CGRectZero];
//    _navibarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"GridViewRed"]];
    _navibarView.backgroundColor = [UIColor redColor];//__RedGridBgColor
    _navibarView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_navibarView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_navibarView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_navibarView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_navibarView(64)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_navibarView)]];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.backgroundColor = [UIColor clearColor];
    [_backBtn setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
    _backBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [_navibarView addSubview:_backBtn];
    [_backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_navibarView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_backBtn(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_backBtn)]];
    [_navibarView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_backBtn(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_backBtn)]];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:19];
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [_navibarView addSubview:_titleLabel];
    
    [_navibarView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_backBtn]-5-[_titleLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel,_backBtn)]];
    
    [_navibarView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_titleLabel(40)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_titleLabel)]];
    
    [_navibarView addConstraint:[NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_navibarView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    _homeButton = [[UIButton alloc]initWithFrame:CGRectMake(self.width - 44 - 10,  +20, 44 + 10, 44 - 4)];
    [_homeButton setBackgroundImage:[UIImage imageNamed:@"more_home"] forState:UIControlStateNormal];
    [_navibarView addSubview:_homeButton];
    
    _mask = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    _mask.backgroundColor = [UIColor blackColor];
    _mask.alpha = 0.5f;
    [self.view addSubview:_mask];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHideMask:)];
    [_mask addGestureRecognizer:tap];
    _rightView = [[UIView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width - 101, 65.0f, 100.0f, 200)];
    [_rightView setBackgroundColor:[UIColor redColor]];//__MainBackgroundColor
    
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
        [car setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"GridViewRed"]]];//__RedGridBgColor
        [car setFrame:CGRectMake(0, i * 41, 100, 40)];
        [car setTag:800 + i];
        [car addTarget:self action:@selector(ButtonPressedCar:) forControlEvents:UIControlEventTouchUpInside];
        [_rightView addSubview:car];
        
        
    }
    
    [self.view addSubview:_rightView];
    _mask.hidden = YES;
    _rightView.hidden  = YES;
    
    [_homeButton addTarget:self action:@selector(homeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self hideHomeButton];
    
    
}
- (void)hideHomeButton{
//    NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:__KUserLoginRemenber_UserNameOrPhoneRecord];
//    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:__KUserLoginRemenber_UserPasswordRecord];
//    NSInteger iType = [self useriType];
//    if ((name == nil && password == nil)|| ( iType!=1&&iType!=2&&iType!=3 ))
//    {
//        self.homeButton.hidden = YES;
//    }else self.homeButton.hidden = NO;
}
- (void)backAction:(UIButton *)btn
{
    _mask.hidden = YES;
    _rightView.hidden  = YES;
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)homeBtnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        _mask.hidden = NO;
        _rightView.hidden = NO;
        
   //     [self getGoods];
        [self getmessage];
        [serviceView removeFromSuperview];
        [QQshowView removeFromSuperview];
        
    }else{
        _mask.hidden = YES;
        _rightView.hidden  = YES;
        [serviceView removeFromSuperview];
        [QQshowView removeFromSuperview];
    }
    
}

-(void)ButtonPressedCar:(UIButton * )sender{
    _mask.hidden = YES;
    _rightView.hidden  = YES;
    _homeButton.selected = NO;
    
    
    
    switch (sender.tag - 800) {
        case 0:
        {
            if ( [self isKindOfClass:[HEFCartViewController class]]){
                return;
            }
            else {
                [self.navigationController popToRootViewControllerAnimated:NO];
               // [[RootViewController sharedRootVc]tabBarSelectedAtIndex:3];
            }
            
            break;
        case 1:
            {
//                if ( [self isKindOfClass:[messageCenterViewController class]]) {
//                    return;
//                }
//                else {
//                    
//                    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"PersonalInformationStoryboard" bundle:nil];
//                    messageCenterViewController *messageVC = [storyboard instantiateViewControllerWithIdentifier:@"messageCenterViewController"];
//                    
//                    [self.navigationController pushViewController: messageVC animated:YES];
//                    
//                }
            
                break;
            case 2:
                {
                    
                    [self.navigationController popToRootViewControllerAnimated:NO];
                    //[[RootViewController sharedRootVc]tabBarSelectedAtIndex:0];
                    
                    
                }
                
                break;
                
            case 3:
                {
                    if ( [self isKindOfClass:[HEFMeViewController class]]) {
                        return;
                    }
                    
                    else  {
                        
                        [self.navigationController popToRootViewControllerAnimated:NO];
                       // [[RootViewController sharedRootVc]tabBarSelectedAtIndex:4];
                        
                    }
                    
                }
                
                break;
            case 4:
                {
                    
                   // [self showcustomerService]; //联系客服
                    
                }
                
                break;
                
                
            default:
                
                break;
            }
        }
    }
}
/*
- (void)showcustomerService
{
    [_arrynumber removeAllObjects];
    [_mutableArray removeAllObjects];
    [[CommandDataManager manager] doCommand:__COMMAND_QQCustomerService_GetAllList Parameters:nil Success:^(id responseObject) {
        
        _arrynumber = responseObject[@"rows"];
        for (int i = 0; i< [_arrynumber count]; i++)
        {
            NSString *QQnumber = [NSString stringWithFormat:@"%@",_arrynumber[i][@"sQQ"]];
            if (QQnumber.length != 0)
            {
                [_mutableArray addObject:QQnumber];
                
            }
            
        }
        serviceView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        serviceView.backgroundColor = [UIColor blackColor];
        serviceView.alpha = 0.4;
        [self.view addSubview:serviceView];
        
        QQshowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 300)];
        QQshowView.backgroundColor = [UIColor whiteColor];
        QQshowView.layer.borderColor = [UIColor whiteColor].CGColor;
        QQshowView.layer.borderWidth = 1.0;
        QQshowView.layer.masksToBounds = YES;
        QQshowView.layer.cornerRadius = 5.0;
        QQshowView.center = self.view.center;
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 150, 255)];
        
        
        for (int i = 0; i <  [_mutableArray count]; i ++)
        {
            UIButton * car = [UIButton buttonWithType:UIButtonTypeCustom];
            [car setImage:[UIImage imageNamed:@"QQimage"] forState:UIControlStateNormal];
            [car setTitle:@"  克女郎" forState:UIControlStateNormal];
            car.titleLabel.font = [UIFont systemFontOfSize: 14.0];
            [car setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [car.titleLabel setTextAlignment:NSTextAlignmentLeft];
            car.layer.borderWidth = 1.0;
            car.layer.masksToBounds = YES;
            car.layer.cornerRadius = 4.0;
            car.layer.borderColor = [UIColor blackColor].CGColor;
            [car setFrame:CGRectMake(15, i * 41+10, 120, 30)];
            
            car.tag = [[_mutableArray objectAtIndex:i] integerValue];
            
            [car addTarget:self action:@selector(QQButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [scrollView addSubview:car];
            
        }
        int y = [_mutableArray count]*40+10;
        scrollView.contentSize = CGSizeMake(0, y);
        [QQshowView addSubview:scrollView];
        
        
        UIButton * phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        phoneBtn.frame =   CGRectMake(5,260,140, 30);
        [phoneBtn setTitle:@"4006-028-020" forState:UIControlStateNormal];
        [phoneBtn setImage:[UIImage imageNamed:@"phoneImage"] forState:UIControlStateNormal];
        phoneBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        [phoneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        phoneBtn.layer.borderWidth = 1.0;
        phoneBtn.layer.masksToBounds = YES;
        phoneBtn.layer.cornerRadius = 4.0;
        phoneBtn.layer.borderColor = [UIColor blackColor].CGColor;
        [phoneBtn addTarget:self action:@selector(phoneAction:) forControlEvents:UIControlEventTouchUpInside];
        [QQshowView addSubview:phoneBtn];
        
        [self.view addSubview:QQshowView];
        
        UITapGestureRecognizer *gest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        [serviceView addGestureRecognizer:gest];
        
    } Failure:^(NSError *error) {
        
    } Complete:^{
        
    }];
    
}
*///联系客服
/*
-(void)phoneAction:(UIButton *)sender
{
    SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"温馨提示" andMessage:@"确定拨打电话:4006-028-020?"];
    
    [alert addButtonWithTitle:@"取消"
                         type:SIAlertViewButtonTypeCancel
                      handler:^(SIAlertView *alert) {
                      }];
    [alert addButtonWithTitle:@"确定"
                         type:SIAlertViewButtonTypeDestructive
                      handler:^(SIAlertView *alert) {
                          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://4006028020"]];
                      }];
    alert.transitionStyle = SIAlertViewTransitionStyleDropDown;
    
    [alert show];
    
    
}

*///确认拨打电话
- (void)QQButtonAction:(UIButton *)sender
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    
    qqnumber = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    
    NSString *qqurl = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",qqnumber];
    
    NSURL *url = [NSURL URLWithString:qqurl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.delegate = self;
    [webView loadRequest:request];
    [self.view addSubview:webView];
    [serviceView removeFromSuperview];
    [QQshowView removeFromSuperview];
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [serviceView removeFromSuperview];
    [QQshowView removeFromSuperview];
}

- (void)tapHideMask:(UITapGestureRecognizer *)tapMask{
    _mask.hidden = YES;
    _rightView.hidden = YES;
    _homeButton.selected = NO;
}
- (NSInteger)useriType
{
    return 0;
  //  return [ConfigManager manager].userLoginInfoModel.iType;
}

- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(30, 30)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName: font}
                                       context:nil];
    
    return rect.size;
}
- (void)getmessage{
    NSMutableDictionary *input = [NSMutableDictionary dictionary];
    
//    input[@"iClientID"] = @([ConfigManager manager].userLoginInfoModel.ID);
//    [[CommandDataManager manager] doCommand:__COMMAND_MessageCenter_GetUnReadCount Parameters:input Success:^(id responseObject) {
//        
//        
//        _messageTxt =  [responseObject[@"count"]stringValue];
//        
//    } Failure:^(NSError *error) {
//        
//    } Complete:^{
//        [self reloadMessageNumber];
//    }];
    
}
/*
- (void)getGoods{
    
    UserLoginInfoModel *userLoginInfoModel = [[ConfigManager manager] userLoginInfoModel];
    if (!userLoginInfoModel) {
        return;
    }
    _homeButton.enabled = NO;
    __block NSMutableArray * shoppingCarProducts = [NSMutableArray array];
    __block NSMutableArray * goodsArray = [NSMutableArray array];
    NSMutableDictionary *input = [NSMutableDictionary dictionary];
    [input setValue:@([[ConfigManager manager] userLoginInfoModel].ID) forKey:@"iClientID"];
    [input setValue:@"true" forKey:@"bIsBuyCar"];
    goodNumber = 0;
    [[CommandDataManager manager] getGoodsPurchaseOrderWithInputDict:input Success:^(id responseObject) {
        
        [shoppingCarProducts removeAllObjects];
        [goodsArray removeAllObjects];
        
        goodsArray = [ShoppingCarGoodsModel mj_objectArrayWithKeyValuesArray:responseObject[@"GoodRows"]];
        
        
        for (int a = 0; a< [goodsArray count]; a++)
        {
            
            ShoppingCarGoodsModel *model = goodsArray[a];
            
            for (int i = 0; i<[model.Standards  count]; i++)
            {                    ShoppingCarGoodsStandardModel *standardModel = (ShoppingCarGoodsStandardModel *)model.Standards[i];
                
                if ([standardModel.iPurchaseVolume integerValue] > 0)
                {
                    
                    goodNumber += [standardModel.iPurchaseVolume integerValue];
                    
                }
            }
            
        }
        _carTxt = [NSString stringWithFormat:@"%ld",(long)goodNumber];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shopNumber" object:[NSString stringWithFormat:@"%ld",(long)goodNumber]];
        
        
    } Failure:^(NSError *error) {
        
    } Complete:^{
        [self reloadGoodsNumber];
        _homeButton.enabled = YES;
    }];
    
    
}
 */
- (void)reloadGoodsNumber
{
    [_carGoodsNumberLabel removeFromSuperview];
    _carGoodsNumberLabel = [[UILabel alloc]init];
    _carGoodsNumberLabel.numberOfLines = 1;
    _carGoodsNumberLabel.font = [UIFont systemFontOfSize:12];
    _carGoodsNumberLabel.backgroundColor = [UIColor whiteColor];
    _carGoodsNumberLabel.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"GridViewRed"]];//__RedGridBgColor;;
    _carGoodsNumberLabel.textAlignment = NSTextAlignmentCenter;
    _carGoodsNumberLabel.text = _carTxt;
    
    CGSize size =  [self sizeWithString:_carGoodsNumberLabel.text font:_carGoodsNumberLabel.font];
    if (size.width > size.height) {
        size.height = size.width;
    }else size.width = size.height;
    
    _carGoodsNumberLabel.frame = CGRectMake(_rightView.frame.size.width - size.width -2, 2, size.width, size.height);
    _carGoodsNumberLabel.layer.cornerRadius = size.width /2;
    _carGoodsNumberLabel.layer.masksToBounds = YES;
    [_rightView addSubview:_carGoodsNumberLabel];
}
- (void)reloadMessageNumber{
    
    [_messageNumberLabel removeFromSuperview];
    _messageNumberLabel = [[UILabel alloc]init];
    _messageNumberLabel.numberOfLines = 1;
    _messageNumberLabel.font = [UIFont systemFontOfSize:12];
    _messageNumberLabel.backgroundColor = [UIColor whiteColor];
    _messageNumberLabel.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"GridViewRed"]];//__RedGridBgColor;;
    _messageNumberLabel.textAlignment = NSTextAlignmentCenter;
    _messageNumberLabel.text = _messageTxt;
    
    
    CGSize msize =  [self sizeWithString:_messageNumberLabel.text font:_messageNumberLabel.font];
    if (msize.width > msize.height) {
        msize.height = msize.width;
    }else msize.width = msize.height;
    _messageNumberLabel.frame = CGRectMake(_rightView.frame.size.width - msize.width -2, 42, msize.width, msize.height);
    _messageNumberLabel.layer.cornerRadius = msize.width /2;
    _messageNumberLabel.layer.masksToBounds = YES;
    [_rightView addSubview:_messageNumberLabel];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
