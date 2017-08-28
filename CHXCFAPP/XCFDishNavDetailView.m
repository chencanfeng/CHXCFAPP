//
//  XCFDishNavDetailView.m
//  CHXCFAPP
//
//  Created by 陈灿锋 on 2017/8/25.
//  Copyright © 2017年 陈灿锋. All rights reserved.
//

#import "XCFDishNavDetailView.h"

#import "XCFPopEvent.h"

@interface XCFDishNavDetailView ()

/** 背景图 */
@property (nonatomic, strong) UIImageView *backImageView;
/** 右侧小图 */
@property (nonatomic, strong) UIImageView *rightImageView;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 作品数label */
@property (nonatomic, strong) UILabel *dishCountLabel;

@end

@implementation XCFDishNavDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _backImageView = [[UIImageView alloc] init];
        
        [self addSubview:_backImageView];
        
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        
        _rightImageView = [[UIImageView alloc] init];
        
        [self addSubview:_rightImageView];
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(15);
            make.bottom.equalTo(self).offset(-15);
            make.right.equalTo(self).offset(-10);
            make.width.equalTo(@(60));
            
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:XCFRecipeCellFontSizeTitle];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self);
            make.bottom.equalTo(self.mas_centerY).offset(-5);
            
        }];
        _dishCountLabel = [[UILabel alloc] init];
        _dishCountLabel.font = [UIFont systemFontOfSize:XCFRecipeCellFontSizeDesc];
        _dishCountLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_dishCountLabel];
        [_dishCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
            make.centerX.equalTo(self);
            make.bottom.equalTo(self.mas_centerY).offset(5);
            
        }];
        
        
    }
    return self;
}

- (void)setPopEvent:(XCFPopEvent *)popEvent {
    
    
    /*
     id = 100320138;
     "n_dishes" = 3842;
     name = "早餐•2017年8月25日";
     */
    
    _popEvent = popEvent;
    
    [_rightImageView sd_setImageWithURL:[NSURL URLWithString:popEvent.thumbnail_280]];
    
    NSString * name = [popEvent.name substringToIndex:2];
    
    _titleLabel.text = [NSString stringWithFormat:@"- %@ -",name];
    
    _dishCountLabel.text = [NSString stringWithFormat:@"%@作品",popEvent.n_dishes];
    
    if([name isEqualToString:@"早餐"]) {
        
        _backImageView.image = [UIImage imageNamed:@"themeSmallPicForBreakfast"];
        
    }else if([name isEqualToString:@"午餐"]) {
        _backImageView.image = [UIImage imageNamed:@"themeSmallPicForLaunch"];
    }else if([name isEqualToString:@"晚餐"]) {
        _backImageView.image = [UIImage imageNamed:@"themeSmallPicForSupper"];
    }

}

+ (XCFDishNavDetailView *)viewWithPopEvent:(XCFPopEvent *)popEvent
                                    target:(id)target
                                    action:(SEL)action {
    XCFDishNavDetailView * dishView = [[XCFDishNavDetailView alloc] init];
    
    dishView.popEvent = popEvent;
    [dishView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    
    return dishView;
    
    
    
}





@end
