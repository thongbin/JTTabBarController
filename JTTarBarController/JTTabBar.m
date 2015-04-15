//
//  JTTabBar.m
//  JTTabBarControllerDemo
//
//  Created by Jarvis on 15/4/14.
//  Copyright (c) 2015年 com.thongbin. All rights reserved.
//

#import "JTTabBar.h"
#import "JTTabBarButton.h"

@interface JTTabBar()
{
    NSInteger _viewControllersCount;
    NSMutableArray *_tabbarItemButtonArray;
}

@end

@implementation JTTabBar

- (instancetype)initWithViewControllersCount:(NSInteger) count
{
    self = [super init];
    if (self) {
        _viewControllersCount = count;
        _tabbarItemButtonArray = [NSMutableArray new];
        for (int i = 0; i < _viewControllersCount; i++) {
            JTTabBarButton *btn = [JTTabBarButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_%d",i + 1]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_selected_%d",i + 1]] forState:UIControlStateHighlighted];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_icon_selected_%d",i + 1]] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [_tabbarItemButtonArray addObject:btn];
        }
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIButton * btn in _tabbarItemButtonArray) {
        
        [btn setFrame:CGRectMake([_tabbarItemButtonArray indexOfObject:btn] * (self.bounds.size.width/_viewControllersCount), 0, (self.bounds.size.width/_viewControllersCount), self.bounds.size.height)];
    }
    
}

-(void)buttonTapped:(UIButton*)button
{
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:self.selectedButton.tag to:button.tag];
    }
}

#pragma mark - JTTabBarController Call-back Function
-(void)setSelectedIndex:(NSInteger)selectedIndex
{
    UIButton *button = [_tabbarItemButtonArray objectAtIndex:selectedIndex];
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

@end
