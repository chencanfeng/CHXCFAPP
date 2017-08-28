//
//  XCFPopEvents.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCFPopEvent;

@interface XCFPopEvents : NSObject

@property (nonatomic ,assign) NSInteger count;

@property (nonatomic ,strong) NSArray<XCFPopEvent *> *events;

@end
