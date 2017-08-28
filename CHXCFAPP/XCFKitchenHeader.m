
//
//  XCFKitchenHeader.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFKitchenHeader.h"


#import <UIImageView+WebCache.h>

#import "XCFTopNavImageView.h"

#import "XCFNavButton.h"
#import "XCFDishNavDetailView.h"

#import "XCFPopEvents.h"

@interface XCFKitchenHeader () <UIScrollViewDelegate>
/** 流行菜谱 */
@property (nonatomic, strong) XCFTopNavImageView *popRecipeView;
/** 关注动态 */
@property (nonatomic, strong) XCFTopNavImageView *feedsView;
/** 导航按钮view */
@property (nonatomic, strong) UIView *navButtonView;
/** 餐导航view */
@property (nonatomic, strong) UIView *dishNavView;
/** scrollView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 指示器 */
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation XCFKitchenHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _popRecipeView = [XCFTopNavImageView imageViewWithTitle:@"本周流行菜谱" target:self action:@selector(popDidClicked)];
        
        [self addSubview:_popRecipeView];
        
        [_popRecipeView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.width.equalTo(self.mas_width).offset(-0.5).multipliedBy(0.5);
            make.height.equalTo(@(XCFKitchenViewHeightTopNav));
            
        }];
        
        
        
        
        _feedsView = [XCFTopNavImageView imageViewWithTitle:@"关注动态" target:self action:@selector(feedsDidClicked)];
        
        [self addSubview:_feedsView];
        
        [_feedsView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.popRecipeView.mas_top);
            make.right.equalTo(self.mas_right);
            make.width.equalTo(self.popRecipeView.mas_width);
            make.height.equalTo(self.popRecipeView.mas_height);
            
        }];
        
        
        _navButtonView = [[UIView alloc] init];
        
        [self addSubview:_navButtonView];
        
        [_navButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.top.mas_equalTo(self.popRecipeView.mas_bottom);
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.height.mas_equalTo(@(XCFKitchenViewHeightNavButton));
            
            
        }];
        
        
        
        
        
        _dishNavView = [[UIView alloc] init];
        [self addSubview:_dishNavView];
        
        [_dishNavView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self);
            make.right.mas_equalTo(self);
            make.top.mas_equalTo(self.navButtonView.mas_bottom);
            make.height.mas_equalTo(@(XCFKitchenViewHeightNavButton));
            
        }];
        
        
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        [_dishNavView addSubview:_scrollView];
        
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.edges.mas_equalTo(self.dishNavView);
        }];
        
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = XCFThemeColor;
        [_dishNavView addSubview:_pageControl];
        
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.mas_equalTo(self.dishNavView);
            make.bottom.mas_equalTo(self.dishNavView.mas_bottom).offset(-10);
            
        }];
        
        
        
        
        
        
        
        
        
    }
    return self;
}

- (void)setNavContent:(XCFNavContent *)navContent {
    
    _navContent = navContent;
    
    [self.popRecipeView sd_setImageWithURL:[NSURL URLWithString:navContent.pop_recipe_picurl]];
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    CGFloat buttonWidth = self.navButtonView.frame.size.width / [navContent.navs count];
    
    for (NSInteger index = 0; index < [navContent.navs count]; index ++) {
        
        XCFNavButton * navButton = [XCFNavButton buttonWithNav:navContent.navs[index] target:self action:@selector(buttonDidClicked)];
        
        x = index * buttonWidth;
        
        navButton.frame = CGRectMake(x, y, buttonWidth, buttonWidth);
        
        navButton.tag = index + 2;
        
        [self.navButtonView addSubview:navButton];
        
    }
    
    
    XCFPopEvents * popEvents = navContent.pop_events;
    
    CGFloat scrollWidth = self.scrollView.frame.size.width;
    CGFloat scrollheight = self.scrollView.frame.size.height;
    
    
    for (NSInteger index = 0 ; index< [popEvents.events count]; index ++) {
        
        XCFDishNavDetailView * dishView = [XCFDishNavDetailView viewWithPopEvent:popEvents.events[index] target:self action:@selector(viewDidClicked:)];
        CGFloat x = index * scrollWidth;
        
        dishView.frame = CGRectMake(x, y, scrollWidth, scrollheight);
        [self.scrollView addSubview:dishView];
        
        dishView.tag = index +6;
        
    }
    
    self.scrollView.contentSize = CGSizeMake(scrollWidth * [popEvents.events count], 0);
    self.pageControl.numberOfPages = popEvents.count;

}

- (void)viewDidClicked:(id)sender {
    
    
}

- (void)buttonDidClicked {
    
    
    
}



- (void)popDidClicked {
    
    
    
}


- (void)feedsDidClicked {
    
    
    
}





@end
