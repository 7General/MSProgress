//
//  MSViewController.m
//  MSProgress
//
//  Created by wanghuizhou21@163.com on 08/07/2018.
//  Copyright (c) 2018 wanghuizhou21@163.com. All rights reserved.
//

#import "MSViewController.h"
#import <MSProgress/UIView+UIViewUtils.h>

@interface MSViewController ()

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor grayColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"网络强求" forState:0];
    [btn addTarget:self action:@selector(netClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor grayColor];
    btn1.frame = CGRectMake(100, 300, 100, 100);
    [btn1 setTitle:@"文案提示" forState:0];
    [btn1 addTarget:self action:@selector(showClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIImageView * jiazaiView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MSProgress.bundle/%@", @"jiazai"]]];
    jiazaiView.frame = CGRectMake(100, 500, 100, 100);
    jiazaiView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:jiazaiView];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view showHUDIndicatorViewSuccessAtCenter:@"加载成功"];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view showHUDIndicatorViewErrorAtCenter:@"加载失败"];
    });
}

- (void)netClick {
    [self.view showHUDIndicatorViewAtCenter:@"加载中...."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view hideHUDIndicatorViewAtCenter];
    });
}

-(void)showClick {
    [self.view showHUDIndicatorLabelAtCenter:@"提示文案"];
}

@end
