//
//  LOAleartHandler.h
//  Lover
//
//  Created by BenJim on 2019/8/18.
//  Copyright © 2019 yqf. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LOAleartHandler : NSObject

+ (void)showTitle:(NSString *)title msg:(NSString *)msg cancel:(NSString *)cancel confirm:(NSString *)confirm handler:(void(^)(BOOL tapConfirm))handler;

+ (void)showTitle:(NSString *)title msg:(NSString *)msg;

@end

NS_ASSUME_NONNULL_END
