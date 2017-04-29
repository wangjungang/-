//
//  ShowAnimationView.m
//  半透明蒙版
//
//  Created by 王俊钢 on 2017/4/29.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "ShowAnimationView.h"
@interface ShowAnimationView ()

@property (nonatomic, strong) UIView  *contentView;
@end

@implementation ShowAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutAllSubviews];
    }
    return self;
}

- (void)layoutAllSubviews{
    
    /*创建灰色背景*/
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.alpha = 0.3;
    bgView.backgroundColor = [UIColor blackColor];
    [self addSubview:bgView];
    
    
    /*添加手势事件,移除View*/
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissContactView:)];
    [bgView addGestureRecognizer:tapGesture];
    
    /*创建显示View*/
    _contentView = [[UIView alloc] init];
    _contentView.frame = CGRectMake(0, 0, self.frame.size.width - 40, 180);
    _contentView.backgroundColor=[UIColor whiteColor];
    _contentView.layer.cornerRadius = 4;
    _contentView.layer.masksToBounds = YES;
    [self addSubview:_contentView];
    /*可以继续在其中添加一些View 虾米的*/
    
}
#pragma mark - 手势点击事件,移除View
- (void)dismissContactView:(UITapGestureRecognizer *)tapGesture{
    
    [self dismissContactView];
}

-(void)dismissContactView
{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
    
}

// 这里加载在了window上
-(void)showView
{
    UIWindow * window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self];
}



@end

