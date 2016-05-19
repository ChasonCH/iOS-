//
//  AViewController.m
//  iOS开发架构
//
//  Copyright © 2016年 Chason. All rights reserved.
//

#import "AViewController.h"
#import "LoginViewController.h"
@interface AViewController ()
@property (nonatomic, strong) UIButton *loginBtn;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"A";
}

//跳转到登录注册界面
- (void)pushToLoginAndRegistVC
{
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)userOutLogin
{
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginName"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginPwd"];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"登录|注册" style:UIBarButtonItemStylePlain target:self action:@selector(pushToLoginAndRegistVC)];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    //判断用户是否登录(本地存储免登陆)
    //根据用户登录状况添加/移除登录|注册按钮
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"loginName"] isEqualToString:@""] || [[[NSUserDefaults standardUserDefaults] objectForKey:@"loginPwd"] isEqualToString:@""]) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"登录|注册" style:UIBarButtonItemStylePlain target:self action:@selector(pushToLoginAndRegistVC)];
        self.navigationItem.rightBarButtonItem = rightItem;
        self.navigationController.navigationBar.tintColor = [UIColor redColor];
    }else
    {
        //用户处于登录状态
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(userOutLogin)];
        self.navigationItem.rightBarButtonItem = rightItem;
        self.navigationController.navigationBar.tintColor = [UIColor redColor];
    }
}

@end
