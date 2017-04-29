//
//  ViewController.m
//  半透明蒙版
//
//  Created by 王俊钢 on 2017/4/29.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "ShowAnimationView.h"
#import "AppDelegate.h"
@interface ViewController ()

@property (nonatomic,strong) UIView *bgview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //background init and tapped
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn01:(UIButton *)sender {
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    background.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    background.opaque = NO;
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
    [background addGestureRecognizer:gesture];
    self.bgview = background;
    self.bgview.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.window addSubview:self.bgview];
}


-(void)backgroundTapped:(UIGestureRecognizer *)tgp
{
    self.bgview.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [self.bgview removeFromSuperview];

}



@end
