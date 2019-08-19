//
//  HeartManager.m
//  Lover
//
//  Created by BenJim on 2019/8/17.
//  Copyright © 2019 yqf. All rights reserved.
//

#import "HeartManager.h"

@implementation HeartManager

+ (instancetype)sharedManager {
    static HeartManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[HeartManager alloc] init];

        
    });
    return _instance;
}




@end
