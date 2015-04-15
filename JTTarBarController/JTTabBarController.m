//
//  JTTabBarController.m
//  JTTabBarControllerDemo
//
//  Created by Jarvis on 15/4/14.
//  Copyright (c) 2015年 com.thongbin. All rights reserved.
//

#import "JTTabBarController.h"
#import "JTTabBar.h"

@interface JTTabBarController()<JTTabBarDelegate>
{
    JTTabBar *_customTabbar;
}

@end

@implementation JTTabBarController

-(void)loadView
{
    [super loadView];
    
    //useful for clean the default data
    for (UIViewController *ob in self.viewControllers) {
        
        if ([ob tabBarItem]) {
            UITabBarItem *tabItem = [ob tabBarItem];
            [tabItem setTitle:@""];
            [tabItem setImage:nil];
            [tabItem setSelectedImage:nil];
        }
    }
    
    _customTabbar = [[JTTabBar alloc] initWithViewControllersCount:self.viewControllers.count];
    _customTabbar.frame = self.tabBar.bounds;
    _customTabbar.delegate = self;
    [_customTabbar setBackgroundColor:[UIColor clearColor]];
    [self.tabBar addSubview:_customTabbar];
    
    // default selected FirstViewController
    [_customTabbar setSelectedIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - setSelectedIndex

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    //must overwrite setSelectedIndex: and call-back this function when set selectedIndex in vc
    [_customTabbar setSelectedIndex:selectedIndex];
}

#pragma mark - JTTabBarDelegate

//JTTabBar call this function when some tapped
-(void)tabBar:(JTTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
