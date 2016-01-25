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
@property (nonatomic, assign) NSInteger expandRow;
@property (nonatomic, assign) NSInteger prevExpandRow;

@end

@implementation ViewController

static NSString *const kCellId00 = @"kCellId00";
static NSString *const kCellId01 = @"kCellId01";
static NSString *const kCellId02 = @"kCellId02";
static NSString *const kCellId03 = @"kCellId03";
static NSString *const kCellId04 = @"kCellId04";
static NSString *const kCellId05 = @"kCellId05";
static NSString *const kCellId06 = @"kCellId06";
static NSString *const kCellId07 = @"kCellId07";

static CGFloat const kNormalHeight = 160.f;
static CGFloat const kExpandHeight = 260.f;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.expandRow                = -1;
    self.prevExpandRow            = -1;
    self.view.backgroundColor     = [UIColor purpleColor];
    self.tableView.dataSource     = self;
    self.tableView.delegate       = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.imageCollection = [@[
                              [UIImage imageNamed:@"cover1"],
                              [UIImage imageNamed:@"cover2"],
                              [UIImage imageNamed:@"cover3"],
                              [UIImage imageNamed:@"cover4"],
                              [UIImage imageNamed:@"cover5"],
                              [UIImage imageNamed:@"cover6"],
                              [UIImage imageNamed:@"cover7"],
                              [UIImage imageNamed:@"cover8"]
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == self.expandRow ? kExpandHeight : kNormalHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"kCellId%02ld", (long)indexPath.row];
    ParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.parallaxImage.image = self.imageCollection[indexPath.row];
//    if (self.prevExpandRow >= 0 && self.prevExpandRow == indexPath.row) {
//        [self transFormView:cell.menuView expand:NO];
//    }
    if (self.expandRow >= 0 && self.expandRow == indexPath.row) {
        [cell.contentView bringSubviewToFront:cell.menuView];
        cell.menuView.frame = (CGRect){cell.menuView.bounds.origin, cell.bounds.size.width, 260};
        [self transFormView:cell.menuView expand:YES];
    }
    cell.menuView.hidden = self.expandRow == indexPath.row ? NO : YES;
    return cell;
}

#pragma mark - tableViewDelegate 📌

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.expandRow >= 0 && self.expandRow == indexPath.row) {
        self.expandRow = -1;
        [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    } else {
        self.expandRow = indexPath.row;
        if (self.prevExpandRow >= 0 && self.prevExpandRow != self.expandRow) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.prevExpandRow inSection:0];
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        }
        [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
    self.prevExpandRow = self.expandRow;
}

#pragma mark - scrollDelegate 📌
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *visibleCells = self.tableView.visibleCells;
    for (ParallaxTableViewCell *cell in visibleCells) {
        [cell tableView:self.tableView didScrollOnView:self.view];
    }
}

- (void)transFormView:(UIView *)view expand:(BOOL)exoand
{
    CGFloat fromValue = exoand ? 0.0001 : 1.0;
    CGFloat toValue = exoand ? 1.0 : 0.0001;
    view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, fromValue);
    
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, toValue);
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

- (NSMutableArray *)imageCollection
{
    if (!_imageCollection) {
        self.imageCollection = [[NSMutableArray alloc] init];
    }
    return _imageCollection;
}

@end
