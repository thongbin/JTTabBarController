//
//  JTTabBar.h
//  JTTabBarControllerDemo
//
//  Created by Jarvis on 15/4/14.
//  Copyright (c) 2015年 com.thongbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JTTabBar;

@protocol JTTabBarDelegate <NSObject>

- (void)tabBar:(JTTabBar *)tabBar selectedFrom:(NSInteger) from to:(NSInteger)to;

@end

@interface JTTabBar : UIView

-(instancetype)initWithViewControllersCount:(NSInteger) count;
-(void)setSelectedIndex:(NSInteger)selectedIndex;

@property(nonatomic,weak)id<JTTabBarDelegate> delegate;
@property(nonatomic,strong)UIButton *selectedButton;

@end
