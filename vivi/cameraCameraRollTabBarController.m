//
//  cameraCameraRollTabBarControllerViewController.m
//  vivi
//
//  Created by Admin on 17.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "cameraCameraRollTabBarController.h"

@interface cameraCameraRollTabBarController ()

@end

@implementation cameraCameraRollTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
//    cameraCameraRollTabBarController *CameraViewController = (cameraCameraRollTabBarController *) [storyboard instantiateViewControllerWithIdentifier:@"CameraViewController"];
    cameraCameraRollTabBarController *CameraRollViewController = (cameraCameraRollTabBarController *) [storyboard instantiateViewControllerWithIdentifier:@"CameraRollViewController"];
    NSArray *camViewControllersArray = [NSArray arrayWithObjects:/* CameraViewController */ CameraRollViewController, nil];
    [self setViewControllers:camViewControllersArray animated:YES];
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:0];
//    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:1];
    [self.tabBar setTranslucent:NO];
    [self.tabBar setBarTintColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    [self.tabBar setTintColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    tabBarItem1.title = @"Camera R";
//    tabBarItem2.title = @"Camera Roll";
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

@end
