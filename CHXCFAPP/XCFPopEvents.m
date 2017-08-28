//
//  XCFPopEvents.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFPopEvents.h"
#import "XCFPopEvent.h"

@implementation XCFPopEvents

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{
             
             @"events":[XCFPopEvent class]
             
             };
    
}

@end
