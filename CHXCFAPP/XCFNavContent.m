//
//  XCFNavContent.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFNavContent.h"
#import "XCFNav.h"

@implementation XCFNavContent

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"navs":[XCFNav class]};
}

@end
