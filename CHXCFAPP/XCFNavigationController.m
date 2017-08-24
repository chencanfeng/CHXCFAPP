//
//  XCFNavigationController.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFNavigationController.h"

#import "UIBarButtonItem+Extension.h"

@interface XCFNavigationController ()

@end

@implementation XCFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor = [UIColor whiteColor];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if(self.viewControllers.count >0) {
        
        UIBarButtonItem * barButtonItem = [UIBarButtonItem barButtonItemWithImageName:@"backStretchBackgroundNormal" imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0) target:self action:@selector(back)];
        
        viewController.navigationItem.leftBarButtonItem = barButtonItem;
        
        viewController.tabBarController.hidesBottomBarWhenPushed = YES;

    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    
    [self popViewControllerAnimated:YES];
    
    
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
