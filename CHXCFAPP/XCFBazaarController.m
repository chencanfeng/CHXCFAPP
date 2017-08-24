
//
//  XCFBazaarController.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFBazaarController.h"

#import "XCFSearchBar.h"

#import "UIBarButtonItem+Extension.h"

#import "XCFSearchViewController.h"



@interface XCFBazaarController ()

@end

@implementation XCFBazaarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavigationBar];
    self.view.backgroundColor = XCFGlobalBackgroundColor;
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


- (void)createRecipe {
    
    
}


- (void)buylist {
    
    
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
