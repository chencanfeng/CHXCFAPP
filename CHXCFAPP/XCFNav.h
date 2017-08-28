//
//  XCFNav.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCFNav : NSObject
/** 导航跳转URL */
@property (nonatomic, copy) NSString *url;
/** 导航标题 */
@property (nonatomic, copy) NSString *name;
/** 图片地址 */
@property (nonatomic, copy) NSString *picurl;
@end
