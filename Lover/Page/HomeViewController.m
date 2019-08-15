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
#import "SecondViewController.h"
#import "CountdownAnimationView.h"

#import <Masonry/Masonry.h>

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *bgButton;
@property (nonatomic, strong) NSArray                   *countArr;
@property (nonatomic, strong) NSArray                   *soundArr;
@property (nonatomic, strong) CountdownAnimationView    *animationView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *imageName = ZRIPhoneXAll ? @"bg_iPhoneX.jpg" : @"bg_normal.jpg";
    [self.bgButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];


    self.animationView = [[CountdownAnimationView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    
    [self.view addSubview:self.animationView];
    
    self.animationView.hidden = YES;

    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(300);
    }];
    
}

- (IBAction)actionEvent:(id)sender {
    [self showHeartBirthdayViewController];
}

- (void)showHeartBirthdayViewController {
    ZRBirthdayHeartModel *birthdayModel = [[ZRBirthdayHeartModel alloc] init];
    birthdayModel.birthdayTitle = @"亲爱的韩小姐";
    birthdayModel.birthdaySubTitle = @"我为你准备了";
    birthdayModel.birthdayDescriptionTitle = @"一份来自IT男盆友的惊喜！";
    
    [[ZRBirthdayHeartMgr shareInstance] showBirthdayViewInViewController:self birthdayModel:birthdayModel receiveBlock:^{
        self.animationView.hidden = NO;
        self.animationView
        .YlFromValue(2.f)
        .YlToValue(0.2f)
        .YlDurationTime(0.9f)
        .YlTitleArr(self.countArr)
        .YlSoundArr(self.soundArr)
        .YlStart()
        .YlClick = ^{
            SecondViewController * secondVC = [[SecondViewController alloc]init];
            [self presentViewController:secondVC animated:NO completion:^{
            }];
        };
    }];
}




- (NSArray *)soundArr
{
    if (!_soundArr) {
        NSArray *soundArr = @[@"num_6.mp3",
                              @"num_5.mp3",
                              @"num_4.mp3",
                              @"num_3.mp3",
                              @"num_2.mp3",
                              @"num_1.mp3",
                              @"orun_start.mp3"];
        _soundArr = soundArr;
    }
    return _soundArr;
}

- (NSArray *)countArr
{
    if (!_countArr) {
        NSArray *countArr = @[@"6",
                              @"5",
                              @"4",
                              @"3",
                              @"2",
                              @"1",
                              @"GO"];
        _countArr = countArr;
    }
    return _countArr;
}


@end
