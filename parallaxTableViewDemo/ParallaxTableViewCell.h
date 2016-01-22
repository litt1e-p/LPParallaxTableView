//
//  ParallaxTableViewCell.h
//  parallaxTableViewDemo
//
//  Created by little-p paul on 16/1/22.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *parallaxImage;

//@property (nonatomic, strong) UIImageView *parallaxImage;
- (void)tableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

@end