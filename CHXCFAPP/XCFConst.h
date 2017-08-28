//
//  XCFConst.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <UIKit/UIKit.h>





/**
 *  下厨房 - 菜谱cell中控件的字体大小
 */
typedef enum {
    XCFRecipeCellFontSizeTitle = 16,        // 标题
    XCFRecipeCellFontSizeDesc = 12,         // 描述
    XCFRecipeCellFontSizeFirstTitle = 20,   // 大标题
    XCFRecipeCellFontSizeSecondTitle = 14   // 小标题
} XCFRecipeCellFontSize;


/** 下厨房 - 头像宽高 */
UIKIT_EXTERN CGFloat const XCFAuthorHeaderWidth;
/** 下厨房 - 顶部导航视图高度（流行菜谱、关注动态） */
UIKIT_EXTERN CGFloat const XCFKitchenViewHeightTopNav;
/** 下厨房 - 导航按钮高度（排行榜、看视频、买买买、菜谱分类） */
UIKIT_EXTERN CGFloat const XCFKitchenViewHeightNavButton;



