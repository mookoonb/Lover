//
//  UIViewController+Lover.m
//  Lover
//
//  Created by BenJim on 2019/8/18.
//  Copyright © 2019 yqf. All rights reserved.
//

#import "UIViewController+Lover.h"

@implementation UIViewController (Lover)
+ (UIViewController *)imx_CurrentViewCtrl{
    UIWindow * window = [self imx_window];
    
    UIViewController *rootViewController = window.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}
//设置状态栏颜色
+ (void)changeStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
+ (UIWindow *)imx_window{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

@end
