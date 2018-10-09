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
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitle:@"网络请求" forState:0];
    [btn addTarget:self action:@selector(netClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor grayColor];
    btn1.frame = CGRectMake(100, 180, 100, 50);
    [btn1 setTitle:@"文案提示" forState:0];
    [btn1 addTarget:self action:@selector(showClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.view showHUDIndicatorViewSuccessAtCenter:@"加载成功"];
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view showHUDIndicatorViewErrorAtCenter:@"加载失败"];
//    });
//}

- (void)netClick {
//    [self.view showHUDIndicatorViewAtCenter:@"加载中...."];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view hideHUDIndicatorViewAtCenter];
//    });
        [self.view showHUDIndicatorViewAtCenter:@"加载中...."];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.view showHUDIndicatorViewSuccessAtCenter:@"绑定成功"];
        });
    
    
    
}

-(void)showClick {
    
        [self.view showHUDIndicatorViewErrorAtCenter:@"绑定失败"];
    
}

@end
