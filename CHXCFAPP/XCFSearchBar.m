//
//  XCFSearchBar.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFSearchBar.h"

@interface XCFSearchBar () <UISearchBarDelegate>



@end

@implementation XCFSearchBar

+ (XCFSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder {
    
 
    XCFSearchBar * searchBar = [[XCFSearchBar alloc] init];
    searchBar.delegate = searchBar;
    searchBar.placeholder = placeholder;
    
    searchBar.tintColor = XCFSearchBarTintColor;
    [searchBar setImage:[UIImage imageNamed:@"searchIcon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    UIView * searchBarSub = searchBar.subviews[0];
    
    for (UIView * subView  in searchBarSub.subviews) {
        
        if([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            
            [subView setBackgroundColor:RGB(247, 247, 240)];
        }
        
        
        if([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            
            [subView removeFromSuperview];
            
        }
        
    }

    return searchBar;
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    !self.searchBarShouldBeginEditingBlock ? : self.searchBarShouldBeginEditingBlock();
    
    return YES;
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    !self.searchBarTextDidChangedBlock ? : self.searchBarTextDidChangedBlock();
    
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    !self.searchBarDidSearchBlock ? : self.searchBarDidSearchBlock();
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
