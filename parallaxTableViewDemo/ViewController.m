//
//  ViewController.m
//  parallaxTableViewDemo
//
//  Created by little-p paul on 16/1/22.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import "ParallaxTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *imageCollection;

@end

@implementation ViewController

static NSString *const kCellId = @"kCellId";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.imageCollection = [@[
                              [UIImage imageNamed:@"cover1"],
                              [UIImage imageNamed:@"cover2"],
                              [UIImage imageNamed:@"cover3"],
                              [UIImage imageNamed:@"cover4"],
                              [UIImage imageNamed:@"cover5"],
                              [UIImage imageNamed:@"cover6"],
                              [UIImage imageNamed:@"cover7"],
                              [UIImage imageNamed:@"cover8"],
                              [UIImage imageNamed:@"cover1"],
                              [UIImage imageNamed:@"cover2"],
                              [UIImage imageNamed:@"cover3"],
                              [UIImage imageNamed:@"cover4"],
                              [UIImage imageNamed:@"cover5"],
                              [UIImage imageNamed:@"cover6"],
                              [UIImage imageNamed:@"cover7"],
                              [UIImage imageNamed:@"cover8"],
                              ] mutableCopy];
}

#pragma mark - tableViewDataSource 📌

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageCollection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId forIndexPath:indexPath];
    cell.parallaxImage.image = self.imageCollection[indexPath.row];
    
    return cell;
}

#pragma mark - tableViewDelegate 📌

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - scrollDelegate 📌
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *visibleCells = self.tableView.visibleCells;
    for (ParallaxTableViewCell *cell in visibleCells) {
        [cell tableView:self.tableView didScrollOnView:self.view];
    }
}

- (NSMutableArray *)imageCollection
{
    if (!_imageCollection) {
        self.imageCollection = [[NSMutableArray alloc] init];
    }
    return _imageCollection;
}

@end
