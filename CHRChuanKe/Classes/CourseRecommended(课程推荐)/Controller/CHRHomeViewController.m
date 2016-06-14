//
//  CHRHomeViewController.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/8.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "CHRHomeViewController.h"
#import "CHRHomeViewCell.h"
#import "CHRWeakTimerTargetObj.h"
#import "CHRNetworkSingleton.h"


@interface CHRHomeViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageCtl;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIScrollView *sv;

@property (nonatomic, strong) NSMutableArray *scrollData;


@end

@implementation CHRHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 100, ScreenW, ScreenH - 100 - 44);
    
    self.tableView.backgroundColor = [UIColor redColor];
  
    self.tableView.showsVerticalScrollIndicator = NO;

    
    [self setHanherView];
    
   
}

-(void)nextPage
{
   
    
    CGPoint offset = self.sv.contentOffset;
    
    if(self.pageCtl.currentPage == self.pageCtl.numberOfPages-1)
    {
        
        offset.x = 0;
     
        
    }
    else
    {
        offset.x = self.sv.contentOffset.x + ScreenW;
        
        
    }
    
    [self.sv setContentOffset:offset animated:YES];
    
}


-(void)setHanherView
{
    UIView * view = [[UIView alloc]init];
    
    view.frame = CGRectMake(0, 0, ScreenW, 260);
    
    self.tableView.tableHeaderView = view;
    
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    self.sv = scrollView;
    
    scrollView.delegate = self;
    
    scrollView.frame = CGRectMake(0, 0, ScreenW, 140);
    //scrollView.backgroundColor = [UIColor greenColor];
    [view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(6*ScreenW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    for(int i=0;i<3;i++)
    {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(ScreenW * i, 0, ScreenW, 160);
        btn.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        //取出模型中的数据  下载图片 并把 图片设置给btn的图片
        
        
        [scrollView addSubview:btn];
    }
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageCtl = pageControl;
    pageControl.numberOfPages = 6;
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    CGFloat pageCtlW = 100;
    CGFloat pageCtlH = 5;
    CGFloat pageCtlX = (ScreenW - pageCtlW) * 0.5;
    CGFloat pageCtlY = scrollView.bounds.size.height * 0.8;
    pageControl.frame = CGRectMake(pageCtlX, pageCtlY, pageCtlW, pageCtlH);
    [view addSubview:pageControl];
    
    //NSTimer  *timer = [CHRWeakTimerTargetObj timerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    self.timer = [CHRWeakTimerTargetObj scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    UIScrollView *scrollsmellView = [[UIScrollView alloc]init];
    scrollsmellView.frame = CGRectMake(0, CGRectGetMaxY(scrollView.frame), ScreenW, view.bounds.size.height - scrollView.bounds.size.height);
    scrollsmellView.showsHorizontalScrollIndicator = NO;
    
    scrollsmellView.backgroundColor = [UIColor whiteColor];
    [view addSubview:scrollsmellView];
    
    CGFloat btnW = 180;
    CGFloat margin = 8;
    CGFloat btnH = scrollsmellView.bounds.size.height - 2 *margin;
    CGFloat btnY = margin;
    
    NSString *strUrl = @"http://pop.client.chuanke.com/?mod=recommend&act=mobile&client=2&limit=20";
    
     [[CHRNetworkSingleton sharedManaager] getreCommendationsResult:nil andUrl:strUrl andSuccessBlock:^(id responseBody) {
         
         NSLog(@"%@",responseBody);
     } andFialureBlock:^(id error) {
         
     }];
    
    
    
    for (int i = 0; i < 6; ++i) {
        UIButton *btn = [[UIButton alloc]init];
        CGFloat btnX = margin + i * (btnW + margin);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
        
        btn.layer.cornerRadius = 8;
        btn.layer.masksToBounds = YES;
        
        [scrollsmellView addSubview:btn];
      
    };
    
    scrollsmellView.contentSize = CGSizeMake(6 *(btnW+margin) + margin, 0);
    
    
}

/**
 *  滚动时
 *
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    
    CGFloat width = ScreenW;
    int page = (scrollView.contentOffset.x + width *0.5) / width;
    
    self.pageCtl.currentPage = page;
    
}

/**
 *  开始滚动时
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //重置timer
    [self.timer invalidate];
    
}

/**
 *  当用户停止滚动时执行的方法
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.timer = [NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 20;
    
}
  static NSString *Id = @"cell";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHRHomeViewCell *cell = [CHRHomeViewCell cellWithTableView:tableView];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}



@end
