

//
//  UIBarButtonItem+Extension.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/24.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName
                           imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
                                    target:(id)target
                                    action:(SEL)action {
 
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 22)];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.imageEdgeInsets = imageEdgeInsets;
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return barButtonItem;
    
}

@end
