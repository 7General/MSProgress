//
//  UIView+UIViewUtils.h
//  HZProgress
//
//  Created by 王会洲 on 16/4/8.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#define hudViewTag                     0x98751237
#import <UIKit/UIKit.h>
#import "MSProgressHUD.h"

@interface UIView (UIViewUtils)

/// 只显示文字提示（自动隐藏）
/// @param indiTitle 提示文案
-(void)showHUDIndicatorAtCenter:(NSString *)indiTitle;

/// 网络发起提示（不自动隐藏）
/// @param indiTitle 提示文案
-(void)showHUDIndicatorSendAtCenter:(NSString *)indiTitle;

/// 隐藏弹层
- (void)hideHUDIndicatorViewAtCenter;

/// 只显示文字提示（自动隐藏）
/// @param indiTitle 提示文案
/// @param y 偏移量
- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle yOffset:(CGFloat)y;

/// 带成功图标的提示
/// @param indiTitle 提示语
- (void)showHUDSuccess:(NSString *)indiTitle;

/// 带失败图标的提示
/// @param indiTitle 提示语
- (void)showHUDFail:(NSString *)indiTitle;

@end
