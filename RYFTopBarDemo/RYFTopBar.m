//
//  RYFTopBar.m
//  RYFTopBarDemo
//
//  Created by renyufei on 15/7/5.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "RYFTopBar.h"

@interface RYFTopBar ()
@property (nonatomic,strong) UIView *markView;
@property (nonatomic,strong) NSMutableArray *buttons;

@end
@implementation RYFTopBar

- (void)setTitles:(NSMutableArray *)titles
{
    //水平方向滚动条隐藏
    self.showsHorizontalScrollIndicator = NO;
    _titles = titles;
    self.buttons = [[NSMutableArray alloc]init];
    
    CGFloat padding = 20;
    for (int i =0; i < titles.count; i ++) {
        if ([_titles[i] isKindOfClass:[NSNull class]]) {
            continue;
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:_titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        static CGFloat originX = 0;
        CGRect rect = CGRectMake(originX + padding, 0, button.intrinsicContentSize.width, kTopbarHeight);
        button.frame = rect;
        originX = CGRectGetMaxX(rect) + padding;
        [self addSubview:button];
        [self.buttons addObject:button];
    }
    
    self.contentSize = CGSizeMake(CGRectGetMaxX([self.buttons.lastObject frame]) + padding, self.frame.size.height);
    
    UIButton *firstButton = self.buttons.firstObject;
    CGRect frame = firstButton.frame;
    self.markView = [[UIView alloc]initWithFrame:CGRectMake(frame.origin.x, CGRectGetMaxY(frame)-3, frame.size.width, 3)];
    _markView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_markView];
}

- (void)buttonClick:(id)sender
{
    self.currentPage = [self.buttons indexOfObject:sender];
    if (_blockHandler) {
        _blockHandler(_currentPage);
    }
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
    UIButton *button = [_buttons objectAtIndex:_currentPage];
    CGRect frame = button.frame;
    frame.origin.x -= 5;
    frame.size.width -= 10;
    [self scrollRectToVisible:frame animated:YES];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.markView.frame = CGRectMake(button.frame.origin.x, CGRectGetMaxY(button.frame)-3, button.frame.size.width, 3);
    }];
}
@end
