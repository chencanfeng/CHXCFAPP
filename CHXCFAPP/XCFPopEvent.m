//
//  XCFPopEvent.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFPopEvent.h"

@implementation XCFPopEvent

//mj_replacedKeyFromPropertyName

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"ID":@"id",
             @"thumbnail_280":@"dishes.dishes[0].thumbnail_280"
             };
    
    
}

@end
