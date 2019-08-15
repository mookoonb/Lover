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
    self.chatTextView.typewriteEffectBlock = ^(){
        
    };
}

// TODO
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _chatTextView.content = @"这是在项目开发中需要实现的效果，实现文字一个一个输出来的效果可以自定义文字的颜色，间隔时间，开始位置等。实现了UILabel和UITextView都可使用。";
    [_chatTextView startTypewrite];
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
        _chatTextView.typewriteTimeInterval = 0.1;
        _chatTextView.editable = NO;
        _chatTextView.userInteractionEnabled = NO;
    }
    return _chatTextView;
}


@end
