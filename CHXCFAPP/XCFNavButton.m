
//
//  XCFNavButton.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFNavButton.h"

#import "XCFNav.h"

#import <UIImageView+WebCache.h>



@interface XCFNavButton ()

@property (nonatomic, strong) UIImageView * imageV;

@property (nonatomic , strong) UILabel * titleL;

@property (nonatomic, strong) NSURL * url;



@end

@implementation XCFNavButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        _imageV = [[UIImageView alloc] init];
        [self addSubview:_imageV];
        
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-15);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
        
        _titleL = [[UILabel alloc] init];
        [self addSubview:_titleL];
        
        _titleL.font = [UIFont systemFontOfSize:12.f];
        
        [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(15);
        }];
        
        
        
    }
    return self;
}

+ (XCFNavButton *)buttonWithNav:(XCFNav *)nav
                         target:(id)target
                         action:(SEL)action {
    XCFNavButton *button = [[XCFNavButton alloc] init];
    [button.imageV sd_setImageWithURL:[NSURL URLWithString:nav.picurl]];
    button.titleL.text = nav.name;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    return button;
}



+ (XCFNavButton *)buttonWithImageName:(NSString *)name
                                title:(nonnull NSString *)title
                               target:(id)target
                               action:(SEL)action {
    XCFNavButton * navButton = [[XCFNavButton alloc] init];
    
    navButton.imageV.contentMode = UIViewContentModeScaleAspectFill;
    [navButton.imageV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(navButton);
        make.top.equalTo(navButton).offset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    
    navButton.imageV.image = [UIImage imageNamed:name];
    
    
    [navButton.titleL mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(navButton);
        make.top.equalTo(navButton.mas_bottom).offset(5);
        
    }];
    
    navButton.titleL.text = title;
    
    [navButton addTarget:target action:action forControlEvents:UIControlEventTouchDown];

    return navButton;

    
}




@end
