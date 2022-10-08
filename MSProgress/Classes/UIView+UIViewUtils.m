//
//  UIView+UIViewUtils.m
//  HZProgress
//
//  Created by 王会洲 on 16/4/8.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "UIView+UIViewUtils.h"

typedef enum : NSUInteger {
    MSHUDStyleDefault, //头部有圆圈显示
    MSHUDStyleLabel, //只显示文字内容
    MSHUDStyleNormal ,    //常用样式
    MSHUDStyleCustom ,    //自定义

} MSShowHUDViewStyle;


#define kMSHUDTOPWINDOW [self getCurrentWindowView]

@implementation UIView (UIViewUtils)




/// 显示文字提示（自动隐藏）
/// @param indiTitle 提醒文字
- (void)showHUDIndicatorAtCenter:(NSString *)indiTitle {
    MSProgressHUD *hud = [self getHUDIndicatorViewAtCenter];
    if (hud) {
        [hud hide:YES]; // 如果有已经展示的隐藏
    }
    hud = [self createHUDIndicatorViewAtCenter:indiTitle HUDCase:MSHUDStyleLabel];
    [hud show:YES];
    [self hide:YES afterDelay:1.25];
}

/// 网络发起提示（不自动隐藏）
/// @param indiTitle 提醒文字
- (void)showHUDIndicatorSendAtCenter:(NSString *)indiTitle {
    MSProgressHUD *hud = [self getHUDIndicatorViewAtCenter];
    if (hud) {
        // 如果有已经展示的隐藏
        [hud hide:YES];
    }
    hud = [self createHUDIndicatorViewAtCenter:indiTitle HUDCase:MSHUDStyleDefault];
    [hud show:YES];
}

/// 只显示文字提示（自动隐藏）
/// @param indiTitle 提示文案
/// @param y 偏移量
- (void)showHUDIndicatorViewAtCenter:(NSString *)indiTitle yOffset:(CGFloat)y {
    MSProgressHUD *hud = [self getHUDIndicatorViewAtCenter];
    if (hud) {
        // 如果有已经展示的隐藏
        [hud hide:YES];
    } else {
        hud.labelText = indiTitle;
    }
    hud = [self createHUDIndicatorViewAtCenter:indiTitle icon:nil yOffset:y MPBCase:MSHUDStyleLabel];
    [hud show:YES];
    [self hide:YES afterDelay:1.25];
}

- (void)showHUDSuccess:(NSString *)indiTitle{
    [self showHUDAtCenter:indiTitle icon:@"2success"];
}
- (void)showHUDFail:(NSString *)indiTitle{
    [self showHUDAtCenter:indiTitle icon:@"2fail"];
}
- (void)showHUDAtCenter:(NSString *)indiTitle icon:(NSString*)icon {
    MSProgressHUD *hud = [self getHUDIndicatorViewAtCenter];
    if (hud) {
        [hud hide:YES]; // 如果有已经展示的隐藏
    }
    hud = [self createHUDIndicatorViewAtCenter:indiTitle icon:icon yOffset:0 MPBCase:MSHUDStyleCustom];
    
    [hud show:YES];
    [self hide:YES afterDelay:1.5];
}


/**隐藏弹层*/
- (void)hideHUDIndicatorViewAtCenter {
    MSProgressHUD *hud = [self getHUDIndicatorViewAtCenter];
    [hud hide:YES];
}

/**延迟加载控制*/
- (void)hide:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(hideDelayed:) withObject:[NSNumber numberWithBool:animated] afterDelay:delay];
}

- (void)hideDelayed:(NSNumber *)animated {
    [self hideHUDIndicatorViewAtCenter];
}



/// 创建HUD对象
/// @param indiTitle indiTitle 标题
/// @param ShowHUDStyle 显示样式
- (MSProgressHUD *)createHUDIndicatorViewAtCenter:(NSString *)indiTitle
                                          HUDCase:(MSShowHUDViewStyle)ShowHUDStyle {
    return [self createHUDIndicatorViewAtCenter:indiTitle icon:nil yOffset:0 MPBCase:ShowHUDStyle];
}

/// 创建HUD对象
/// @param indiTitle 标题
/// @param icon 图标
/// @param y y轴偏移量
/// @param ShowHUDStyle 显示样式
- (MSProgressHUD *)createHUDIndicatorViewAtCenter:(NSString *)indiTitle
                                             icon:(NSString *)icon
                                          yOffset:(CGFloat)y
                                          MPBCase:(MSShowHUDViewStyle)ShowHUDStyle {
    MSProgressHUD *hud = [[MSProgressHUD alloc] initWithView:self];
    hud.layer.zPosition = 10;
    hud.yOffset = y;
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = indiTitle;
    
    /**如果有图片名称*/
    if (icon) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, hud.size.width, 100)];
        
        UIImageView *imgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MSProgress.bundle/%@", icon]]];
        imgv.frame = CGRectMake((view.bounds.size.width-80)/2, 0, 80, 80);
        [view addSubview:imgv];

        hud.customView = view;
    }
    switch (ShowHUDStyle) {
        case MSHUDStyleDefault:
        {
            hud.mode = MSProgressHUD25X;
            hud.dimBackground = NO;
            hud.color = nil;
            hud.labelColor = [UIColor whiteColor];
        }
            break;
        case MSHUDStyleLabel:
        {
            hud.mode = MSProgressHUDModeText;
            hud.dimBackground = NO;
            hud.color = nil;
            hud.labelColor = [UIColor whiteColor];
        }
            break;
            
        case MSHUDStyleNormal:
        {
            hud.mode = MSProgressHUDModeNormal;
            hud.dimBackground = NO;
            hud.color = [UIColor whiteColor];
            hud.labelColor = [UIColor blackColor];
        }
            break;
        case MSHUDStyleCustom:
        {
            hud.mode = MSProgressHUDModeCustomView;
            hud.dimBackground = NO;
            hud.labelColor = [UIColor whiteColor];
            hud.square = YES;
            hud.cornerRadius = 6;
            hud.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.64];
//            hud.margin = 15;
        }
            break;
        default:
            break;
    }
    [self addSubview:hud];
    hud.tag = hudViewTag;
    return hud;
}


/// 获取HUD对象
- (MSProgressHUD *)getHUDIndicatorViewAtCenter {
    UIView *view = [self viewWithTagNotDeepCounting:hudViewTag];
    if (view != nil && [view isKindOfClass:[MSProgressHUD class]]){
        return (MSProgressHUD *)view;
    } else {
        return nil;
    }
}

- (UIView *)viewWithTagNotDeepCounting:(NSInteger)tag {
    for (UIView *view in self.subviews) {
        if (view.tag == tag) {
            return view;
            break;
        }
    }
    return nil;
}



/**获取当前window*/
- (UIWindow *)getCurrentWindowView {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

@end
