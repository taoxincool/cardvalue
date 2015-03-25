//
//  IndexController.m
//  cardvalue
//
//  Created by taoxin on 15-3-19.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import "IndexController.h"
#import "AccountController.h"
#import "MoreController.h"

@interface IndexController ()

@end

@implementation IndexController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark 页面加载事件
- (void)viewDidLoad
{
    self.scroll.delegate = self;
    
    //动态创建搜索框
    UISearchBar *searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(70, 00, 195,44)];
    searchBar.delegate = self;
    [searchBar setPlaceholder:@"搜索"];
    [self.navigationController.navigationBar addSubview:searchBar];
    
    
    //设置导航栏背景颜色
    self.navigationController.navigationBar.tintColor =  [UIColor whiteColor];//设置按钮颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg.png"] forBarMetrics:UIBarMetricsDefault];//设置背景图片
    
    //初始化当前tab文字与图标
    //UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"home.png"] tag:1];
    //tem1.selectedImage = [UIImage imageNamed:@"home2.png"];
    //self.tabBarItem.image = [UIImage imageNamed:@"home2.png"];
    //self.tabBarItem.title = @"首页";
    
    /**新增滚动视图*/
    
    //动态加载banner图片
    UIImageView *banner = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320,167)];
    banner.image = [UIImage imageNamed:@"banner1.png"];
    banner.tag = 1;//给标签banner图片控件设置唯一标示
    [self.scroll addSubview:banner];
    
    //加载分页
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(120, 120, 150, 50)];
    pageControl.tag = 2;//给标签page控件设置唯一标示
    //pageControl.
    pageControl.numberOfPages = 3; // 一共显示多少个圆点（多少页）
    //绑定pageView事件
    [pageControl addTarget:self action:@selector(changePageCount:) forControlEvents:(UIControlEventValueChanged)];
    // 设置非选中页的圆点颜色
    //pageControl.pageIndicatorTintColor = [UIColor redColor];
    // 设置选中页的圆点颜色
    //pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    // 禁止默认的点击功能
    //pageControl.enabled = NO;
    [self.scroll addSubview:pageControl];
    
    
    //动态首页方块
    CGPoint nextButtonPoint =  CGPointMake(0, 167);//上一个按钮的坐标
    
    for(int i = 1 ; i <= 9 ; i ++) {
        //构建button对象
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(nextButtonPoint.x, nextButtonPoint.y, 106, 101)];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png",i]] forState:UIControlStateNormal];
        button.adjustsImageWhenHighlighted = YES;
        
        if (nextButtonPoint.x == 0 && nextButtonPoint.y == banner.image.size.height) {
            //表示第一个
            nextButtonPoint.y += 101;//表示换行了增加y坐标
        } else {
            if( i % 3 == 0) {
                //表示一行的最后一个
                nextButtonPoint.y += 101;//表示换行了增加y坐标
                nextButtonPoint.x = 0;//换行x置为0
            } else {
                //表是还是在一行,增加x坐标
                nextButtonPoint.x += 106;
            }
        }
        
        
        //将当前button加入scrollView中
        [self.scroll addSubview:button];
        
    }
    
    //设置scroll大小
    self.scroll.contentSize = CGSizeMake(0, self.view.frame.size.height - 80);//自动高度
    //self.scroll.contentSize = CGSizeMake(1100, 1100);//自动高度
    
    //self.scroll.delaysContentTouches = NO;禁止scroll点击
    
    [super viewDidLoad];
    
    //自动轮换banner
    _timmerIsFirst = 1;//表示第一次
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoChangeBannerImage) userInfo:nil repeats:YES];
    [timer fire];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 点击屏幕隐藏键盘
-(IBAction)hideKeyboard:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}


#pragma mark 点击scroll隐藏键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark 点击分页切换banner
-(void)changePageCount:(id)sender {
    
    UIPageControl *pageController = sender;
    
    NSInteger currentPageIndex = pageController.currentPage;
    
    UIImageView *banner = (UIImageView *) [self.scroll viewWithTag:1];//通过tag获取banner控件
    
    banner.image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%li.png",currentPageIndex+1]];
    
}

#pragma mark 自动轮换banner
-(void)autoChangeBannerImage {
    
    if(_timmerIsFirst == 1 ) {
        //第一次进入显示第一张banner图
        _timmerIsFirst = 2;
    } else {
        UIPageControl *pageController = (UIPageControl *) [self.scroll viewWithTag:2];//通过tag获取page控件;
        if(pageController.currentPage == pageController.numberOfPages - 1) {
            pageController.currentPage = 0;
        } else {
            pageController.currentPage ++ ;
        }
        [self changePageCount:pageController];
    }
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
