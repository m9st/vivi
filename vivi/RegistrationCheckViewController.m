//
//  RegistrationCheckViewController.m
//  vivi
//
//  Created by Admin on 11.02.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "RegistrationCheckViewController.h"

@interface RegistrationCheckViewController ()

@end

@implementation RegistrationCheckViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    self.backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height)];
    [self.backGroundImage setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
    [self.backGroundImage setAlpha:0];
    [self.view addSubview:self.backGroundImage];
    self.millureImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 150, (self.view.frame.size.height / 2) - 200, 280, 130)];
    [self.millureImage setImage:[UIImage imageNamed:@"milier2.png"]];
    
    self.checkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.checkButton setAlpha:0];
    [self.checkButton setTitle:@"Check SMS code" forState:UIControlStateNormal];
    [self.checkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.checkButton addTarget:self action:@selector(checkButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.checkButton setBackgroundColor:[UIColor whiteColor]];
    [self.checkButton setFrame:CGRectMake((self.view.frame.size.width / 2) - 155, (self.view.frame.size.height / 2) - 10, 150, 30)];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.backButton setAlpha:0];
    [self.backButton setBackgroundColor:[UIColor whiteColor]];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setFrame:CGRectMake((self.view.frame.size.width / 2) + 5, (self.view.frame.size.height / 2) - 10, 150, 30)];
    
    self.checkTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) - 55, self.view.frame.size.width / 1.5, 30)];
    [self.checkTextField setAlpha:0];
    [self.checkTextField setPlaceholder:@"Type code from SMS"];
    [self.checkTextField setReturnKeyType:UIReturnKeyDone];
    [self.checkTextField addTarget:self action:@selector(checkButtonMethod:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.checkTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.checkTextField setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.millureImage];
    [self.view addSubview:self.checkButton];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.checkTextField];
    
    
    UIGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:tapRecognize];
}

-(void) viewWillAppear:(BOOL)animated {
    [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
        [self.millureImage setAlpha:1];
        [self.checkButton setAlpha:1];
        [self.backButton setAlpha:1];
        [self.checkTextField setAlpha:1];
    } completion:^(BOOL finished) {
    }];
}


-(IBAction)checkButtonMethod:(id)sender {
    NSString *checkString = [NSString stringWithString:self.checkTextField.text];
    NSLog(@"string - %@", checkString);
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Typed code is not valid"
                                                                   message:@"You need to take new code"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Send again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self tryAgainAlertButton:self];
    }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(IBAction)tryAgainAlertButton:(id)sender {
    self.checkTextField.text = @"";
}

-(IBAction) closeKeyBoard:(id)sender{
    [self.view endEditing:YES];
}

-(IBAction)backButtonMethod:(id)sender {
    [UIImageView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.millureImage setAlpha:0];
        [self.backGroundImage setAlpha:1];
        [self.checkTextField setAlpha:0];
        [self.checkButton setAlpha:0];
        [self.backButton setAlpha:0];
    } completion:^(BOOL finished) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RegistrationCheckViewController *RegistrationViewController = (RegistrationCheckViewController *) [storyboard instantiateViewControllerWithIdentifier:@"RegistrationViewController"];
        [self.navigationController pushViewController:RegistrationViewController animated:NO];
    }];
    
}

@end
