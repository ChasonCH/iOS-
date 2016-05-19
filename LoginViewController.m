//
//  LoginViewController.m
//
//  Copyright (c) 2015年 54贷客. All rights reserved.
//

#import "LoginViewController.h"
#import "myView.h"
//手机屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,copy)UITextField * userNametextField;
@property (nonatomic,copy)UITextField * passwordtextField;
@end

@implementation LoginViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor  whiteColor];
    self.navigationItem.title = @"登录";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self addLoginView];
    //添加退出键盘手势
    UITapGestureRecognizer *exitKeyBoard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    exitKeyBoard.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:exitKeyBoard];
    
}

- (void)viewTapped:(UITapGestureRecognizer*)tap1
{
    [self.view endEditing:YES];
}

-(void)addLoginView{
    NSArray *arr = @[@"账号",@"密码"];
    NSArray *imageArr = @[@"user",@"password"];
    for (int i = 0; i<2; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 94 + 40 * i, kScreenWidth - 20, 40)];
        label.layer.borderWidth = 0.4f;
        label.layer.cornerRadius = 10;
        [self.view addSubview:label];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 12, 13, 16)];
        imageView.image = [[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imageArr[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [label addSubview:imageView];
        label.userInteractionEnabled = YES;
        if (i==0) {
            _userNametextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 00, kScreenWidth - 100, 40)];
            _userNametextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            _userNametextField.delegate = self;
            _userNametextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
            _userNametextField.layer.cornerRadius = 10;
            _userNametextField.placeholder = arr[i];
            [label addSubview:_userNametextField];
        }else if(i==1){
            _passwordtextField = [[UITextField alloc]initWithFrame:CGRectMake(50, 00, kScreenWidth - 100, 40)];
            _passwordtextField.clearButtonMode = UITextFieldViewModeWhileEditing;
            _passwordtextField.delegate = self;
            _passwordtextField.layer.cornerRadius = 10;
            _passwordtextField.secureTextEntry = YES;
            _passwordtextField.placeholder = arr[i];
            [label addSubview:_passwordtextField];
        }
    }
    
    //忘记密码
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"忘记密码?" forState:UIControlStateNormal];
    button.frame = CGRectMake(kScreenWidth - 100, 180, 80, 20);
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(forgetPwdClick) forControlEvents:UIControlEventTouchUpInside];
    button.tintColor = [UIColor grayColor];
    [self.view addSubview:button];
    
    //登录 免费注册按钮
    UIButton *loginBtn = [myView creatButtonWithFrame:CGRectMake(10, 220, kScreenWidth-20, 40) title:@"登录" tag:10001 tintColor:[UIColor whiteColor] backgroundColor:[UIColor orangeColor]];
    [loginBtn addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.cornerRadius  = 20;
    [self.view addSubview:loginBtn];
    
    UIButton *registBtn = [myView creatButtonWithFrame:CGRectMake(10, 280, kScreenWidth-20, 40) title:@"注册" tag:10002 tintColor:[UIColor whiteColor] backgroundColor:[UIColor lightGrayColor]];
    [registBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    registBtn.layer.cornerRadius = 20;
    [self.view addSubview:registBtn];
}
-(void)forgetPwdClick{
    //跳转到忘记密码控制器
    NSLog(@"忘记密码啦!");
}
-(void)registerClick{
    //跳转到用户注册控制器
    NSLog(@"快来注册吧!");
}
-(void)clickLoginButton:(UITextField *)textField{
//登录成功
//本地持久化
[[NSUserDefaults standardUserDefaults] setObject:_userNametextField.text forKey:@"loginName"];
[[NSUserDefaults standardUserDefaults] setObject:_passwordtextField.text forKey:@"loginPwd"];
//登陆成功之后 隐藏输入框内容
[_passwordtextField resignFirstResponder];

    [self popToRootVC];//登陆成功后返回
}

- (void)popToRootVC
{
    _userNametextField.text = @"";
    _passwordtextField.text = @"";
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
