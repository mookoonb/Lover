//
//  UIViewController+Lover.h
//  Lover
//
//  Created by BenJim on 2019/8/18.
//  Copyright © 2019 yqf. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIViewController (Lover)

+ (UIViewController *)imx_CurrentViewCtrl;
+ (UIWindow *)imx_window;
+ (void)changeStatusBarBackgroundColor:(UIColor *)color;

@end
