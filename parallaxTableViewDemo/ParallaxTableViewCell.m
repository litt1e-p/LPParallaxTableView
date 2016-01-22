//
//  ParallaxTableViewCell.m
//  parallaxTableViewDemo
//
//  Created by little-p paul on 16/1/22.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "ParallaxTableViewCell.h"

@implementation ParallaxTableViewCell

- (void)tableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperView = [tableView convertRect:self.frame toView:view];
    CGFloat cellRadius = CGRectGetHeight(self.frame) * 0.5 - CGRectGetMinY(rectInSuperView);
    CGFloat diff = CGRectGetHeight(self.parallaxImage.frame) - CGRectGetHeight(self.frame);
    CGFloat move = (cellRadius / CGRectGetHeight(view.frame)) * diff;
    
    CGRect imageRect = CGRectMake(self.parallaxImage.frame.origin.x, -(diff * 0.5) + move, self.parallaxImage.frame.size.width, self.parallaxImage.frame.size.height);
    self.parallaxImage.frame = imageRect;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
