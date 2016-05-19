//
//  ViewController.m
//  iOS开发架构
//
//  Copyright © 2016年 Chason. All rights reserved.
//

#import "ViewController.h"
#import "CYCTabBarViewController.h"
//手机屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, retain) UIPageControl *page;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加app引导图
    self.navigationController.navigationBarHidden = YES;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KScreenHeight)];
    scrollView.contentSize = CGSizeMake(5 *kScreenWidth, KScreenHeight);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.contentOffset = CGPointMake(0, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KScreenHeight)];
    [imageView setImage:[UIImage imageNamed:@"lead1.jpg"]];
    [scrollView addSubview:imageView];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, KScreenHeight)];
    [imageView1 setImage:[UIImage imageNamed:@"lead2.jpg"]];
    [scrollView addSubview:imageView1];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(2 * kScreenWidth, 0, kScreenWidth, KScreenHeight)];
    [imageView2 setImage:[UIImage imageNamed:@"lead3.jpg"]];
    [scrollView addSubview:imageView2];
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(3 * kScreenWidth, 0, kScreenWidth, KScreenHeight)];
    [imageView3 setImage:[UIImage imageNamed:@"lead4.jpg"]];
    [scrollView addSubview:imageView3];
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(4 * kScreenWidth, 0, kScreenWidth, KScreenHeight)];
    [imageView4 setImage:[UIImage imageNamed:@"lead5.jpg"]];
    imageView4.userInteractionEnabled = YES;
    [scrollView addSubview:imageView4];
    
    //添加体验按钮
    UIImageView *imageBtn = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth / 2 - 75, KScreenHeight - 120, 150, 40)];
    imageBtn.image = [UIImage imageNamed:@"sign.png"];
    imageBtn.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap )];
    [imageBtn addGestureRecognizer:tap];
    [imageView4 addSubview:imageBtn];
    [self.view addSubview:scrollView];
    
    //设置翻页控件
    _page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, KScreenHeight - 50, kScreenWidth, 40)];
    _page.numberOfPages = 5;//总页数
    _page.pageIndicatorTintColor = [UIColor lightGrayColor];//主题颜色
    _page.currentPageIndicatorTintColor = [UIColor whiteColor];//当前页的小球颜色
    [self.view addSubview:_page];//添加到self.view上面，因为如果添加到滚动视图上面的话 就会随着滚动从屏幕显示范围内离开。
}

//在滚动视图停止减速，也就是静止的方法内部，我们改变UIPageControl的currentPage
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前滚动视图的偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //计算当前是第几页
    NSInteger page = offset.x / kScreenWidth;
    
    //给currentPage属性赋值
    _page.currentPage = page;
    
}

- (void)handleTap
{
    //进入程序主界面
    [self presentViewController:[[CYCTabBarViewController alloc] init] animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
