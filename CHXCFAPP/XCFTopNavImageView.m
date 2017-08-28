//
//  XCFTopNavImageView.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFTopNavImageView.h"



@interface XCFTopNavImageView ()

@property (nonatomic, strong) UIImageView * coverView; //覆盖层
@property (nonatomic, strong) UILabel * label; // 标题

@end

@implementation XCFTopNavImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        _coverView = [[UIImageView alloc] init];
        _coverView.backgroundColor = RGBA(0, 0, 0, 0.2);
        
        [self addSubview:_coverView];
        
        [_coverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:XCFRecipeCellFontSizeTitle];
        _label.textColor = [UIColor whiteColor];
        [self addSubview:_label];
        
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.mas_centerX);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
            
        }];
        
    }
    return self;
}


+ (XCFTopNavImageView *)imageViewWithTitle:(NSString *)title
                                    target:(id)target
                                    action:(SEL)action{
    
    XCFTopNavImageView * navImageView = [[XCFTopNavImageView alloc] init];
    
    navImageView.label.text = title;
    [navImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    
    
    
    
    return navImageView;
    
    
}





@end
