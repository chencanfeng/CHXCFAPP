//
//  XCFSearchBar.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface XCFSearchBar : UISearchBar

@property (nonatomic ,copy) void (^searchBarShouldBeginEditingBlock)(); //点击回调

@property (nonatomic ,copy) void  (^searchBarTextDidChangedBlock)(); // 编辑回调

@property (nonatomic ,copy) void  (^searchBarDidSearchBlock)(); // 搜索回调


+ (XCFSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder;

@end
