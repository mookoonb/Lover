//
//  LOAleartHandler.m
//  Lover
//
//  Created by BenJim on 2019/8/18.
//  Copyright © 2019 yqf. All rights reserved.
//

#import "LOAleartHandler.h"
#import "UIViewController+Lover.h"

static BOOL tips_show_flag = NO;

@implementation LOAleartHandler

+ (void)showTitle:(NSString *)title msg:(NSString *)msg{
    if(tips_show_flag){
        return;
    }
    tips_show_flag = YES;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    NSString *ok = NSLocalizedString(@"确定",nil);
    UIAlertAction *action = [UIAlertAction actionWithTitle:ok
                                                     style:UIAlertActionStyleCancel
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       tips_show_flag = NO;
                                                   }];
    [alert addAction:action];
    UIViewController *ctrl = [UIViewController imx_CurrentViewCtrl];
    [ctrl presentViewController:alert animated:YES completion:nil];
}

+ (void)showTitle:(NSString *)title msg:(NSString *)msg cancel:(NSString *)cancel confirm:(NSString *)confirm handler:(void(^)(BOOL tapConfirm))handler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:msg
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if(!cancel && !confirm){
        NSString *ok = NSLocalizedString(@"确定",nil);
        UIAlertAction *action = [UIAlertAction actionWithTitle:ok
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           if(handler){
                                                               handler(NO);
                                                           }
                                                       }];
        [alert addAction:action];
    }else{
        if(cancel){
            NSString *btnmsg = cancel;
            UIAlertAction *action = [UIAlertAction actionWithTitle:btnmsg
                                                             style:UIAlertActionStyleCancel
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               if(handler){
                                                                   handler(NO);
                                                               }
                                                           }];
            [alert addAction:action];
        }
        if(confirm){
            NSString *btnmsg = confirm;
            UIAlertAction *action = [UIAlertAction actionWithTitle:btnmsg
                                                             style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * _Nonnull action) {
                                                               if(handler){
                                                                   handler(YES);
                                                               }
                                                           }];
            [alert addAction:action];
        }
    }
    
    UIViewController *ctrl = [UIViewController imx_CurrentViewCtrl];
    [ctrl presentViewController:alert animated:YES completion:nil];
}

@end
