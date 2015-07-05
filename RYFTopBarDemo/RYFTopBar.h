//
//  RYFTopBar.h
//  RYFTopBarDemo
//
//  Created by renyufei on 15/7/5.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kTopbarHeight 35
typedef void (^ButtonClickHander)(NSInteger currentPage);

@interface RYFTopBar : UIScrollView

@property (nonatomic,strong) NSMutableArray *titles;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,copy) ButtonClickHander blockHandler;
@end
