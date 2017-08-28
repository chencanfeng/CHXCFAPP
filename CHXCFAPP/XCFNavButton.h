//
//  XCFNavButton.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCFNav;

@interface XCFNavButton : UIButton

+ (nonnull XCFNavButton *)buttonWithImageName:(nonnull NSString *)name
                                title:(nonnull NSString *)title
                               target:(nullable id)target
                               action:(nullable SEL)action;

+ (nonnull XCFNavButton *)buttonWithNav:(nonnull XCFNav *)nav
                                 target:(nullable id)target
                                 action:(nullable SEL)action;
    
@end
