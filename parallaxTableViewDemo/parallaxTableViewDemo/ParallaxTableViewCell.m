//
//  ParallaxTableViewCell.m
//  parallaxTableViewDemo
//
//  Created by little-p paul on 16/1/22.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "ParallaxTableViewCell.h"

@interface ParallaxTableViewCell()

//@property (nonatomic, strong) MenuView *menuView;

@end

@implementation ParallaxTableViewCell

- (void)tableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperView = [tableView convertRect:self.frame toView:view];
    CGFloat cellRadius = CGRectGetHeight(self.frame) * 0.5 - CGRectGetMinY(rectInSuperView);
    CGFloat diff = CGRectGetHeight(self.parallaxImage.frame) - CGRectGetHeight(self.frame);
    CGFloat move = (cellRadius / CGRectGetHeight(view.frame)) * diff;
    
    CGRect imageRect = CGRectMake(self.parallaxImage.frame.origin.x, -(diff * 0.5) + move, self.parallaxImage.frame.size.width, self.parallaxImage.frame.size.height);
    self.parallaxImage.frame = imageRect;
    self.menuView.frame = CGRectMake(0, 0, self.menuView.frame.size.width, self.menuView.frame.size.height);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)awakeFromNib
{
    if (!self.menuView) {
        
        NSArray *titles = [@[@"menu1", @"menu2", @"menu3", @"menu4", @"menu5", @"menu6", @"menu7"] mutableCopy];
        CGRect menuFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 160);
        MenuView *menu = [MenuView menuViewWithTitleArr:titles andFrame:menuFrame];
        [self.contentView addSubview:menu];
        self.menuView = menu;
    }
}

@end
