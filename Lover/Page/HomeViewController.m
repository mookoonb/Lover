//
//  HomeViewController.m
//  Lover
//
//  Created by yaoquanfeng on 2019/8/11.
//  Copyright © 2019 yqf. All rights reserved.
//

#import "HomeViewController.h"
#import "ZRBirthdayHeartMgr.h"
#import "ZRBirthdayEnvelopeMgr.h"
#import "ZRBirthdayEnvelopeModel.h"
#import "ZRAudioPlayerMgr.h"
#import "ZRDevice.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *bgButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *imageName = ZRIPhoneXAll ? @"bg_iPhoneX.jpg" : @"bg_normal.jpg";
    [self.bgButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    self.title = @"生日快乐";

}


- (IBAction)actionEvent:(id)sender {
    [self showHeartBirthdayViewController];
}

// 心形生日快乐
- (void)showHeartBirthdayViewController {
    ZRBirthdayHeartModel *birthdayModel = [[ZRBirthdayHeartModel alloc] init];
    birthdayModel.birthdayTitle = @"亲爱的韩小姐";
    birthdayModel.birthdaySubTitle = @"我为你准备了";
    birthdayModel.birthdayDescriptionTitle = @"一份来自IT男盆友的惊喜！";
    [[ZRBirthdayHeartMgr shareInstance] showBirthdayViewInViewController:self birthdayModel:birthdayModel receiveBlock:^{

            

    }];
}

- (void)dealloc {
    NSLog(@"%@",[self class]);
}


@end
