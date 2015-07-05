//
//  FirstViewController.m
//  RYFTopBarDemo
//
//  Created by renyufei on 15/7/5.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initModel];
    [self initUI];
}

- (void)initModel {
    self.items = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8"];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor redColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}


@end
