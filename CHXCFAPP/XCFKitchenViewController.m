
//
//  XCFKitchenViewController.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFKitchenViewController.h"

#import "XCFSearchBar.h"

#import "UIBarButtonItem+Extension.h"

#import "XCFSearchViewController.h"

#import "XCFKitchenHeader.h"

#import <MJRefresh.h>

#import <AFNetworking.h>

#import "XCFNavContent.h"




@interface XCFKitchenViewController ()

@property (nonatomic, strong) XCFKitchenHeader * kitchenHeader;

@property (nonatomic, strong) AFHTTPSessionManager * mananger;

@property (nonatomic, strong) NSMutableArray * feedsArray;       // 动态数据
@property (nonatomic, strong) NSMutableArray * issuesArray;      // 菜谱数据

@end

@implementation XCFKitchenViewController

static CGFloat const headerHeight = 50;

static NSString const * recipeCellIdentifier = @"RecipeCell";
static NSString const * recipeHeaderIdentifier = @"RecipeHeader";





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = [UIColor blueColor];
    
    [self setupNavigationBar];
    
    [self setupTableView];
    
    [self setupTableViewHeaderView];
    
    [self setupRefresh];
    
    //请求数据
    
    [self loadNavData];
}

- (void)setupNavigationBar {
    
    XCFSearchBar * searchBar = [XCFSearchBar searchBarWithPlaceholder:@"菜谱、食材"];
    
    self.navigationItem.titleView = searchBar;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"homepageCreateRecipeButton" imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 8) target:self action:@selector(createRecipe)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"buylistButtonImage" imageEdgeInsets:UIEdgeInsetsMake(0, 8, 0, 0) target:self action:@selector(buylist)];
    
    
    WeakSelf;
    
    searchBar.searchBarShouldBeginEditingBlock = ^{
        
        XCFSearchViewController * vc = [[XCFSearchViewController alloc] initWithStyle:UITableViewStyleGrouped];
        
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    
    
    
    
}

- (void)setupTableView {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = XCFGlobalBackgroundColor;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    
    
    
}

- (void)setupTableViewHeaderView {
    
    
    // 顶部导航视图（流行菜谱、关注动态）高度 + 导航按钮高度 + 三餐导航按钮高度
    
    CGFloat reciperHeaderHeight = XCFKitchenViewHeightTopNav + XCFKitchenViewHeightNavButton * 2 + 20;
    self.kitchenHeader = [[XCFKitchenHeader alloc] initWithFrame:CGRectMake(0, 0, XCFScreenWidth, reciperHeaderHeight)];
    
    self.tableView.tableHeaderView = self.kitchenHeader;

}

- (void)setupRefresh {
    
    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    
    
    
}

- (void)createRecipe {
    
    
}


- (void)buylist {
    
    
}

- (void)loadNewData {
    
}


- (void)loadMoreData {
    
    
    
}

/**
 *  加载headerView中导航的数据
 */
- (void)loadNavData {
    
    [self.mananger GET:XCFRequestKitchenNav parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
        
        
        self.kitchenHeader.navContent = [XCFNavContent mj_objectWithKeyValues:responseObject[@"content"]];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        XCFLog(@"loadNavData --- failure");
    }];
    
    
    
    
    
    
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




#pragma mark - UITableView
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 1;
//}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = @"12312";
    
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

- (AFHTTPSessionManager *)mananger {
    
    if(_mananger == nil) {
        
        _mananger = [AFHTTPSessionManager manager];
        
    }
    
    
    return _mananger;
    
}

#pragma mark - 懒加载

- (NSMutableArray *)issuesArray {
    if (!_issuesArray) {
        _issuesArray = [NSMutableArray array];
    }
    return _issuesArray;
}

- (NSMutableArray *)feedsArray {
    if (!_feedsArray) {
        _feedsArray = [NSMutableArray array];
    }
    return _feedsArray;
}


@end
