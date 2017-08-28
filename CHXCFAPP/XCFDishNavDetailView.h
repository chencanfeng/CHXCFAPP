//
//  XCFDishNavDetailView.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFPopEvent;

@interface XCFDishNavDetailView : UIView


@property (nonatomic ,strong) XCFPopEvent * popEvent;

+ (nonnull XCFDishNavDetailView *)viewWithPopEvent:(nonnull XCFPopEvent *)popEvent
                                    target:(nullable id)target
                                    action:(nullable SEL)actio;

@end
