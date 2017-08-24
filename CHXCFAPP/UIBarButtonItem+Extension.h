//
//  UIBarButtonItem+Extension.h
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName
                           imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                                    target:(id)target
                                    action:(SEL)actio;

@end
