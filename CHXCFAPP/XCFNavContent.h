//
//  XCFNavContent.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCFPopEvents;
@class XCFNav;

@interface XCFNavContent : NSObject

/** 早餐午餐晚餐数据 */
@property (nonatomic, strong) XCFPopEvents *pop_events;
/** 导航按钮数据 */
@property (nonatomic, strong) NSArray<XCFNav *> *navs;
/** 菜谱导航图片 */
@property (nonatomic, copy) NSString *pop_recipe_picurl;

@end
