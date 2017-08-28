//
//  XCFTopNavImageView.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFTopNavImageView : UIImageView

+ (nonnull XCFTopNavImageView *)imageViewWithTitle:(nonnull NSString *)title
                                    target:(nullable id)target
                                    action:(nullable SEL)action;

@end
