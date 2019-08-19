//
//  ThreeViewController.m
//  Lover
//
//  Created by yaoquanfeng on 2019/8/11.
//  Copyright © 2019 yqf. All rights reserved.
//

#import "ThreeViewController.h"
#import "XJTypeWriterLabel.h"
#import "XJTypeWriterTextView.h"
#import <Masonry/Masonry.h>
#import "SecondViewController.h"
#import "ZRAudioPlayerMgr.h"

#define kLabelFont [UIFont boldSystemFontOfSize:16]
#define marginLeft 15
#define distanceOfHeadImageWithText 4
#define textEdgeInsetHorizontal 10
#define textEdgeInsetVertical 10

#define maxWidth kMainScreenOfWidth - marginLeft*2 - textEdgeInsetHorizontal*2 - 40

@interface ThreeViewController ()

@property (nonatomic,strong) XJTypeWriterTextView * chatTextView;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.chatTextView];
    [self.chatTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.inset(0);
    }];
    
    [[ZRAudioPlayerMgr sharedInstance] playMusic:@"许嵩 - 有何不可.mp3" isLoops:YES];

    __weak typeof(self) weakSelf = self;

    self.chatTextView.typewriteEffectBlock = ^(){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [LOAleartHandler showTitle:@"提示" msg:@"没有情书，会不会有点失望，那接下来看看风景，好不好？" cancel:nil confirm:@"确定" handler:^(BOOL tapConfirm) {
                if (tapConfirm) {
                    SecondViewController * secondVC = [[SecondViewController alloc]init];
                    [weakSelf presentViewController:secondVC animated:NO completion:^{
                    }];
                }
             }];

        });
    };
    
    _chatTextView.content = @"2019年8月9号10:34分，本应很平淡的一刻，却因你一个字变得有意义。\n\n其实本来想写封情书，但写了一点后，真的太酸了\n\n就说点中心思想吧\n\n愿深情不被辜负\n\n并感谢下彼此的勇敢\n\n我们已经认识六个赛季，虽然我们彼此之间没有很深的了解，没关系，我们可以从头开始。我保证，今后我会照顾好你，让你感受到爱和温暖。\n";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.chatTextView startTypewrite];
    
    });
    
}

- (XJTypeWriterTextView *)chatTextView{
    
    if (!_chatTextView) {
        _chatTextView = [[XJTypeWriterTextView alloc] initWithFrame:CGRectZero];
        _chatTextView.backgroundColor = [UIColor clearColor];
        _chatTextView.font = kLabelFont;
        _chatTextView.hasSound = NO;
        _chatTextView.typewriteEffectColor = [UIColor blackColor];
        _chatTextView.textColor = [UIColor yellowColor];
        _chatTextView.textAlignment = NSTextAlignmentCenter;
        _chatTextView.typewriteTimeInterval = 0.5;
        _chatTextView.editable = NO;
        _chatTextView.userInteractionEnabled = NO;
    }
    return _chatTextView;
}


@end
