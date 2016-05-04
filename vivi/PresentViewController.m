//
//  ViewController.m
//  vivi
//
//  Created by MAC on 02.12.15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
//    [UIColor colorWithRed:0.60 green:0.40 blue:0.28 alpha:1.0]

    [super viewDidLoad];
    self.backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.backGroundImage setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
    [self.view addSubview:self.backGroundImage];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    
    self.millureName = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 150, 50, 300, 150)];
    [self.millureName setImage:[UIImage imageNamed:@"milier2.png"]];
    [self.view addSubview:self.millureName];

        //КНОПКИ
    self.enterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.enterButton setTitle:@"Enter" forState:UIControlStateNormal];
    [self.enterButton setAlpha:0];
    [self.enterButton addTarget:self action:@selector(openEnterPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.enterButton setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:0.8]];
    [self.enterButton setTitleColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0] forState:UIControlStateNormal];
    [self.enterButton setTitleColor:[UIColor colorWithRed:0.80 green:0.39 blue:0.53 alpha:1.0] forState:UIControlStateHighlighted];
    [self.enterButton setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.enterButton clipsToBounds];
    [self.enterButton.layer setCornerRadius:2];
    [self.view addSubview:self.enterButton];
    [self.enterButton setFrame:CGRectMake((self.view.frame.size.width / 2) - 110, self.view.frame.size.height / 2 + 175, 220, 35)];
        
    self.regButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.regButton setTitle:@"Registration" forState:UIControlStateNormal];
    [self.regButton addTarget:self action:@selector(openRegistrationViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.regButton setAlpha:0];
    [self.regButton setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:0.8]];
    [self.regButton setTitleColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0] forState:UIControlStateNormal];
    [self.regButton setTitleColor:[UIColor colorWithRed:0.80 green:0.39 blue:0.53 alpha:1.0] forState:UIControlStateHighlighted];
    [self.regButton setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.regButton clipsToBounds];
    [self.regButton.layer setCornerRadius:2];
    [self.view addSubview:self.regButton];
    [self.regButton setFrame:CGRectMake((self.view.frame.size.width / 2) - 110, (self.view.frame.size.height / 2) + 220, 220, 35)];
        
}

-(void)viewWillAppear:(BOOL)animated {
    [self.millureName setAlpha:1];
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
        [self.regButton setAlpha:1];
        [self.enterButton setAlpha:1];
    } completion:^(BOOL finished) {
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) openEnterPage:(id) sender {
    [UIImageView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.millureName setAlpha:0];
        [self.regButton setAlpha:0];
        [self.enterButton setAlpha:0];
    } completion:^(BOOL finished) {
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        PresentViewController * EnterViewController = (PresentViewController *) [storyboard instantiateViewControllerWithIdentifier:@"EnterViewController"];
        [self.navigationController pushViewController:EnterViewController animated:NO];
    }];
}

-(IBAction) openRegistrationViewController:(id)sender {
    [UIImageView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.millureName setAlpha:0];
        [self.regButton setAlpha:0];
        [self.enterButton setAlpha:0];
    } completion:^(BOOL finished) {
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PresentViewController * RegistrationViewController = (PresentViewController *) [storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
    [self.navigationController pushViewController:RegistrationViewController animated:NO];
    }];
}

@end





















