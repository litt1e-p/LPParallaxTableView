//
//  MenuView.m
//  parallaxAnimation
//
//  Created by little-p paul on 16/1/21.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

+ (instancetype)menuViewWithTitleArr:(NSArray *)menuTitles andFrame:(CGRect)frame
{
    MenuView *menu = nil;
    if (menuTitles.count > 0) {
        CGFloat margin = 28;
        menu = (MenuView *)[[UIView alloc] initWithFrame:frame];
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        CGFloat btnWidth = 70;
        CGFloat btnHeight = 30;
        UIButton *prevBtn = nil;
        for (int i = 0; i < menuTitles.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:menuTitles[i] forState:UIControlStateNormal];
            if (i < 3) {
                btnX = i * btnWidth + margin;
                btnY = margin;
            } else {
                btnX = (i - 3) * btnWidth + margin;
                btnY = margin + btnHeight;
            }
            btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            prevBtn = btn;
            [menu addSubview:btn];
        }
        menu.layer.borderColor = [UIColor redColor].CGColor;
        menu.layer.borderWidth = 1;
        menu.backgroundColor = [UIColor blackColor];
    }
    return menu;
}

@end
