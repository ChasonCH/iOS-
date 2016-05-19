//
//  CYCTabBarViewController.m
//  iOS开发架构
//
//  Copyright © 2016年 Chason. All rights reserved.
//

#import "CYCTabBarViewController.h"
#import "CYCNavigationController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
@interface CYCTabBarViewController ()

@end

@implementation CYCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建四个导航试图控制器
    CYCNavigationController *ANaVC = [[CYCNavigationController alloc] initWithRootViewController:[[AViewController alloc] init]];
    ANaVC.tabBarItem.title = @"A";
    
    CYCNavigationController *BNaVC = [[CYCNavigationController alloc] initWithRootViewController:[[BViewController alloc] init]];
    BNaVC.tabBarItem.title = @"B";
    
    CYCNavigationController *CNaVC = [[CYCNavigationController alloc] initWithRootViewController:[[CViewController alloc] init]];
    CNaVC.tabBarItem.title = @"C";
    
    CYCNavigationController *DNaVC = [[CYCNavigationController alloc] initWithRootViewController:[[DViewController alloc] init]];
    DNaVC.tabBarItem.title = @"D";
    
    //将导航试图控制器添加到标签试图控制器上
    NSArray *controllerArray = [[NSArray alloc] initWithObjects:ANaVC, BNaVC, CNaVC, DNaVC, nil];
    self.viewControllers = controllerArray;
    self.tabBar.tintColor = [UIColor orangeColor];
    
    //设置tabbar图标(22x22/44x44)
    ANaVC.tabBarItem.image=[[UIImage imageNamed:@"tab_home_pre.png" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ANaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_home.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BNaVC.tabBarItem.image  = [[UIImage imageNamed:@"tab_invest_pre.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    BNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_invest.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CNaVC.tabBarItem.image  = [[UIImage imageNamed:@"tab_account_pre.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_account.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DNaVC.tabBarItem.image  = [[UIImage imageNamed:@"tab_more_pre.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    DNaVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_more.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
