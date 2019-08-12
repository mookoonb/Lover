//
//  SecondViewController.m
//  Lover
//
//  Created by yaoquanfeng on 2019/8/11.
//  Copyright © 2019 yqf. All rights reserved.
//

#import "SecondViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <Masonry/Masonry.h>

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *contentImgV;

@property (nonatomic, strong) UIButton * antionBtn;

@property (nonatomic, strong) UIImageView * dreamImgV;

@end

@implementation SecondViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.contentImgV addSubview:self.dreamImgV];
    
    [self.dreamImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentImgV);
        make.bottom.mas_equalTo(-80);
        make.width.mas_equalTo (200);
        make.height.mas_equalTo(300);
    }];
    
    CAEmitterLayer * snowEmitterLayer = [CAEmitterLayer layer];
    snowEmitterLayer.emitterPosition = CGPointMake(100, -30);
    snowEmitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width * 2, 0);
    snowEmitterLayer.emitterMode = kCAEmitterLayerOutline;
    snowEmitterLayer.emitterShape = kCAEmitterLayerLine;
    
    CAEmitterCell * snowCell = [CAEmitterCell emitterCell];
    snowCell.contents = (__bridge id)[UIImage imageNamed:@"樱花瓣2"].CGImage;
    
    // 花瓣缩放比例
    snowCell.scale = 0.02;
    snowCell.scaleRange = 0.5;
    
    // 每秒产生的花瓣数量
    snowCell.birthRate = 7;
    snowCell.lifetime = 80;
    
    // 每秒花瓣变透明的速度
    snowCell.alphaSpeed = -0.01;
    
    // 秒速“五”厘米～～
    
    snowCell.velocity = 40;
    
    snowCell.velocityRange = 60;
    
    // 花瓣掉落的角度范围
    snowCell.emissionRange = M_PI;
    
    // 花瓣旋转的速度
    snowCell.spin = M_PI_4;
    
    snowEmitterLayer.shadowOpacity = 1;
    // 阴影化开的程度（就像墨水滴在宣纸上化开那样）
    snowEmitterLayer.shadowRadius = 8;
    // 阴影的偏移量
    snowEmitterLayer.shadowOffset = CGSizeMake(3, 3);
    // 阴影的颜色
    snowEmitterLayer.shadowColor = [[UIColor whiteColor] CGColor];
    
    snowEmitterLayer.emitterCells = [NSArray arrayWithObject:snowCell];
    
    [self.backgroundView.layer addSublayer:snowEmitterLayer];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [snowEmitterLayer removeFromSuperlayer];
        self.contentImgV.image = [UIImage imageNamed:@"jiguang"];
    });
    
    self.dreamImgV.userInteractionEnabled = YES;
    
    [self.dreamImgV addSubview:self.antionBtn];
    
    [self.antionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(0);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.antionBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    });
}

- (void)actionBtnAction:(id)sender{
    NSLog(@"show masg");
}

- (UIButton *)antionBtn{
    if (!_antionBtn) {
        _antionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_antionBtn addTarget:self action:@selector(actionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _antionBtn;
}

- (UIImageView *)dreamImgV{
    if (!_dreamImgV) {
        _dreamImgV = [[UIImageView alloc]init];
        _dreamImgV.image = [UIImage imageNamed:@"boyandgirl"];
    }
    return _dreamImgV;
}

@end
