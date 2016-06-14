//
//  CHRCateViewController.m
//  CHRChuanKe
//
//  Created by 陈红荣 on 16/6/7.
//  Copyright © 2016年 chenHongRong. All rights reserved.
//

#import "CHRCateViewController.h"
#import "CHRHomeViewController.h"
#import "CHRSortViewController.h"


@interface CHRCateViewController ()

@property (nonatomic, assign) NSInteger type;

/**
 *  页数
 */
@property (nonatomic, assign) NSInteger page;

/**
 *  每一页的个数
 */
@property (nonatomic, assign) NSInteger limit;

/**
 *  是否收费  1 免费   2 收费
 */
@property (nonatomic, assign) NSInteger charge;

/**
 *  课程分类ID
 */
@property (nonatomic, copy) NSString *cateid;

/**
 *  数据源数组
 */
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

/**
 *  分割线View
 */
@property (nonatomic, strong) UIView *lineView;

/**
 *  当前课程分类按钮的下标
 */
@property (nonatomic, assign) NSInteger currnetIndex;

/**
 *  UISegmentedControl
 */
@property (nonatomic, strong) UISegmentedControl *SegmentedControl ;


@end

@implementation CHRCateViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"课程推荐";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    
    [self setNav];
    

}

-(void)initData
{
    self.page = 1;
    
    self.limit = 20;
    
    self.charge = 1;
    
    self.currnetIndex = 0;
    
//    if([self.cateType isEqualToString:@"feizhibo"])
//    {
//        
//        _cateid = self.cateIDArray[0];
//    }
    
    
}

-(void)setNav
{
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW,100)];
    backView.backgroundColor =  UICOLOR(67, 199, 176, 1);
    [self.view addSubview:backView];
    
    UILabel *lable = [UILabel new];
    lable.font = [UIFont systemFontOfSize:20];
    lable.textAlignment = NSTextAlignmentCenter;
    //lable.backgroundColor = [UIColor redColor];
    lable.text = @"百度传课";
    lable.textColor = [UIColor whiteColor];
    CGFloat lableW = 80;
    CGFloat lableH = 30;
    CGFloat lableX = (ScreenW - lableW) * 0.5;
    CGFloat lableY = (100 - lableH) * 0.3;
    
    lable.frame = CGRectMake(lableX, lableY, lableW, lableH);
    
    [backView addSubview:lable];
    
    UISegmentedControl *sc = [[UISegmentedControl alloc]initWithItems:@[@"精选推荐",@"课程分类"]];
    sc.selectedSegmentIndex = 0;
    self.SegmentedControl = sc;
    [sc addTarget:self action:@selector(SegmentedControlChange:) forControlEvents:UIControlEventValueChanged];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [sc setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
    
    sc.tintColor = UICOLOR(46, 158, 138, 1);
    
    CGFloat scX = (ScreenW - 200) * 0.5;
    CGFloat scY = 100 - 30 - 10;
    
    sc.frame = CGRectMake(scX, scY, 200, 30);
    
    [backView addSubview:sc];
    
    
    UIButton *leftBtn = [[UIButton alloc]init];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    leftBtn.frame = CGRectMake(10, 40, 60, 25);
    [leftBtn setTitle:@"点击这" forState:UIControlStateNormal];
    leftBtn.tintColor = [UIColor whiteColor];
    [backView addSubview:leftBtn];
    
    
    UIButton *rightBtn = [[UIButton alloc]init];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"search_btn_unpre_bg"] forState:UIControlStateNormal];
    CGFloat rigthBtnW = 45;
    CGFloat rightBtnH = 45;
    
    CGFloat rightBtnX = ScreenW - rigthBtnW -10;
    CGFloat rightBtnY = 30;
    rightBtn.frame = CGRectMake(rightBtnX, rightBtnY, rigthBtnW ,rightBtnH);
    [backView addSubview:rightBtn];
    
   
    [self setTableView];
    

}

-(void)SegmentedControlChange:(UISegmentedControl *)sender
{
    NSInteger index = sender.selectedSegmentIndex;
    
    if(index == 0)
    {
        [self setTableView];
        
    }
    else if(index == 1)
    {
        
        [self setFenXiangTableView];
        
    }
    
}

/**
 *  设置tableView
 */
-(void)setTableView
{
    
    
    CHRHomeViewController *homeTableVc = [[CHRHomeViewController alloc]init];
    [self addChildViewController:homeTableVc];
    
    [self.view addSubview:homeTableVc.view];
    
    
}

/**
 *  设置分享TableView
 */
-(void)setFenXiangTableView
{
    CHRSortViewController *vc = [[CHRSortViewController alloc]init];
    
    [self addChildViewController:vc];
    
    [self.view addSubview:vc.view];
    
    
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

-(NSMutableArray *)dataSourceArray
{
    if(_dataSourceArray == nil)
    {
        
        _dataSourceArray = [NSMutableArray array];
    }
    
    return _dataSourceArray;
    
}

@end
