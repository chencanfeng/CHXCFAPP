
//
//  XCFTabBarController.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFTabBarController.h"

#import "XCFKitchenViewController.h"
#import "XCFBazaarController.h"
#import "XCFCommunityViewController.h"
#import "XCFMeController.h"

#import "XCFNavigationController.h"

@interface XCFTabBarController ()

@end

@implementation XCFTabBarController

+ (void)initialize
{
    NSMutableDictionary * normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:11.f];
    normalAttribute[NSForegroundColorAttributeName] = XCFTabBarNormalColor;
    
    NSMutableDictionary * selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSFontAttributeName] = normalAttribute[NSFontAttributeName];
    selectedAttribute[NSForegroundColorAttributeName] = XCFThemeColor;
    
    UITabBarItem * tabbarItem = [UITabBarItem appearance];
    [tabbarItem setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    [tabbarItem setTitleTextAttributes:selectedAttribute forState:UIControlStateSelected];
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setupChildViewController:[[XCFKitchenViewController alloc] initWithStyle:UITableViewStyleGrouped] title:@"下厨房" image:@"tabADeselected" selectedImage:@"tabASelected"];
    
    [self setupChildViewController:[[XCFBazaarController alloc] init] title:@"市集" image:@"tabBDeselected" selectedImage:@"tabBSelected"];
    
    [self setupChildViewController:[[XCFCommunityViewController alloc] init] title:@"社区" image:@"tabCDeselected" selectedImage:@"tabCSelected"];
    
    [self setupChildViewController:[[XCFMeController alloc] init] title:@"我" image:@"tabDDeselected" selectedImage:@"tabDSelected"];
    
    
    
    
}


- (void)setupChildViewController:(UIViewController *)childController
                           title:(NSString *)title
                           image:(NSString *)image
                   selectedImage:(NSString *)selectedImage {
 
    childController.title = title;
    
    [childController.tabBarItem setImage:[UIImage imageNamed:image]];
    [childController.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    
    
    XCFNavigationController * nav = [[XCFNavigationController alloc] initWithRootViewController:childController];
    
    nav.title = title;
    
    [self addChildViewController:nav];
    
    
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
