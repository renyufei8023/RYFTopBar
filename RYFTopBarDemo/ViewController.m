//
//  ViewController.m
//  RYFTopBarDemo
//
//  Created by renyufei on 15/7/5.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "ViewController.h"
#import "RYFTopBar.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) RYFTopBar *topBar;
@property (nonatomic,assign) NSInteger currentPage;
@end

@implementation ViewController

- (id)initWithViewControllers:(NSArray *)viewControllers
{
    if(self = [super init]){
        _viewControllers = viewControllers;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (RYFTopBar *)topBar{
    if (!_topBar) {
        _topBar = [[RYFTopBar alloc]initWithFrame:CGRectMake(0, [[UIApplication sharedApplication] statusBarFrame].size.height + 44, CGRectGetWidth(self.view.frame), kTopbarHeight)];
        _topBar.backgroundColor = [UIColor darkGrayColor];
        __block ViewController *_self = self;
        _topBar.blockHandler = ^(NSInteger currentPage){
            [_self setCurrentPage:currentPage];
        };
        [self.view addSubview:_topBar];
    }
    return _topBar;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView ) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topBar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-kTopbarHeight)];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    _viewControllers = [NSArray arrayWithArray:viewControllers];
    CGFloat x = 0.0;
    for (UIViewController *viewController in _viewControllers) {
        [viewController willMoveToParentViewController:self];
        viewController.view.frame = CGRectMake(x, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
        x += CGRectGetWidth(self.scrollView.frame);
        _scrollView.contentSize = CGSizeMake(x, _scrollView.frame.size.width);
    }
    self.topBar.titles = [_viewControllers valueForKey:@"title"];
}

- (void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    [self.scrollView setContentOffset:CGPointMake(_currentPage*_scrollView.frame.size.width, 0) animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    _topBar.currentPage = currentPage;
    _currentPage = currentPage;
}
@end
