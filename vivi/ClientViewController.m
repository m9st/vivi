//
//  ClientViewController.m
//  vivi
//
//  Created by MAC on 06.12.15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "ClientViewController.h"
#import "SWRevealViewController.h"

@interface ClientViewController ()

@end

@implementation ClientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    UIBarButtonItem *showRevealControllerButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self.revealViewController action:@selector(revealToggle:)];
    [showRevealControllerButton setWidth:30];
    [self.navigationItem setLeftBarButtonItem:showRevealControllerButton];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    
    // Do any additional setup after loading the view.
}


-(void) viewDidAppear:(BOOL)animated {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)deleteMethod:(id)sender {
    NSUserDefaults *deleteUser = [NSUserDefaults standardUserDefaults];
    [deleteUser removeObjectForKey:@"userLogin"];
    [deleteUser removeObjectForKey:@"userPassword"];
    [deleteUser synchronize];
    NSLog(@"data - %@", deleteUser);
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ClientViewController *EnterViewController = (ClientViewController *) [storyboard instantiateViewControllerWithIdentifier:@"EnterViewController"];
    [self.navigationController pushViewController:EnterViewController animated:NO];
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
