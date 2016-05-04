//
//  EnterViewController.m
//  vivi
//
//  Created by MAC on 03.12.15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "EnterViewController.h"

@interface EnterViewController ()

@end

@implementation EnterViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    self.backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.backGroundImage setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
    [self.view addSubview:self.backGroundImage];
    
    
    
    
    
    
    
    
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.backButton setAlpha:0];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:0.8]];
    [self.backButton addTarget:self action:@selector(backButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setFrame:CGRectMake(self.view.frame.size.width / 2 - 65, self.view.frame.size.height / 2 + 95, 130, 30)];
    [self.backButton setTitleColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0] forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor colorWithRed:0.80 green:0.39 blue:0.53 alpha:1.0] forState:UIControlStateHighlighted];
    [self.backButton setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.backButton clipsToBounds];
    [self.backButton.layer setCornerRadius:2];
    
    self.enterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.enterButton setAlpha:0];
    [self.enterButton setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:0.8]];
    [self.enterButton setTitle:@"Enter" forState:UIControlStateNormal];
    [self.enterButton clipsToBounds];
    [self.enterButton.layer setCornerRadius:2];
    [self.enterButton setTitleColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0] forState:UIControlStateNormal];
    [self.enterButton setTitleColor:[UIColor colorWithRed:0.80 green:0.39 blue:0.53 alpha:1.0] forState:UIControlStateHighlighted];
    [self.enterButton setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.enterButton addTarget:self action:@selector(enterMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.enterButton setFrame:CGRectMake(self.view.frame.size.width / 2 - 65, self.view.frame.size.height / 2 + 50, 130, 30)];
    
    self.millureName = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 150, 50, 300, 150)];
    [self.millureName setImage:[UIImage imageNamed:@"milier2.png"]];
    [self.millureName setAlpha:0];
    
    self.loginField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 6, self.view.frame.size.height / 2 - 50, self.view.frame.size.width / 1.5, 30)];
    self.passField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 6, self.view.frame.size.height / 2, self.view.frame.size.width / 1.5, 30)];
    

    
    [self.loginField setBackgroundColor:[UIColor colorWithRed:0.20 green:0.18 blue:0.17 alpha:1.0]];
    [self.passField setBackgroundColor:[UIColor colorWithRed:0.20 green:0.18 blue:0.17 alpha:1.0]];
    
    [self.loginField setPlaceholder:@"Phone number or e-mail"];
    [self.loginField setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    [self.passField setPlaceholder:@"Password"];
    [self.passField setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    
    [self.passField setBorderStyle:UITextBorderStyleRoundedRect];
    [self.loginField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [self.loginField setAlpha:0];
    [self.passField setAlpha:0];
    
    [self.passField setSecureTextEntry:YES];
    
    self.passField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.loginField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.loginField setReturnKeyType:UIReturnKeyNext];
    
    self.loginField.delegate = self;
    
    [self.passField addTarget:self action:@selector(enterMethod:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.passField setReturnKeyType:UIReturnKeyDone];
    
    self.tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardClose:)];
    [self.view addGestureRecognizer:self.tapRecognize];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.loginField]) {
        [self.passField becomeFirstResponder];
    }

    return NO;
}


-(void)viewWillAppear:(BOOL)animated {
    [UIImageView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.backGroundImage setFrame:CGRectMake(0 - (self.view.frame.size.width / 2), 0, self.view.frame.size.width * 2, self.view.frame.size.height * 2)];
        
    } completion:^(BOOL finished) {
        [self.view addSubview:self.backButton];
        [self.view addSubview:self.loginField];
        [self.view addSubview:self.passField];
        [self.view addSubview:self.enterButton];
        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.backButton setAlpha:1.0];
            [self.passField setAlpha:1.0];
            [self.loginField setAlpha:1.0];
            [self.enterButton setAlpha:1.0];
        } completion:^(BOOL finished) {}];
    }];
}

-(IBAction)enterMethod:(id)sender{
    if ([self.loginField.text isEqual: @""] || [self.passField.text  isEqual: @""]) {
        UIAlertController * alertController = [UIAlertController new];
        [alertController setTitle:@"Fill empty fields"];
        [alertController setMessage:@"Try again"];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
        self.loginField.text = @"";
        self.passField.text = @"";
    } else {
        NSURL *url = [NSURL URLWithString:@"file://localhost/Users/admin/Desktop/vivi/JSON/vivijson.json"];
        NSError *error;
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSMutableArray *jsonArrayFromURL = nil;
        if (data)
            jsonArrayFromURL = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (jsonArrayFromURL == nil)
        {
            jsonArrayFromURL = [[NSMutableArray alloc] init];
        }
        NSLog(@"%@",jsonArrayFromURL);
        
        for (int i=0; i < jsonArrayFromURL.count; ++i) {
            NSMutableDictionary *dict = nil;
            dict = [jsonArrayFromURL objectAtIndex:i];
            NSString *emailFromDict = [dict objectForKey:@"email"];
            NSString *numberFromDict = [dict objectForKey:@"number"];
            NSString *passwordFromDict = [dict objectForKey:@"password"];
            NSString *nameFromDict = [dict objectForKey:@"name"];
            NSString *lastNameFromDict = [dict objectForKey:@"lastName"];
            NSLog(@"%@",emailFromDict);
            if (([emailFromDict isEqual:self.loginField.text] || [numberFromDict isEqual:self.loginField.text]) && [passwordFromDict isEqual:self.passField.text]) {
                NSLog(@"YES");
                NSUserDefaults *userLogPass = [NSUserDefaults standardUserDefaults];
                [userLogPass setObject:self.loginField.text forKey:@"userLogin"];
                [userLogPass setObject:self.passField.text forKey:@"userPassword"];
                [userLogPass setObject:nameFromDict forKey:@"name"];
                [userLogPass setObject:lastNameFromDict forKey:@"lastName"];
                [userLogPass synchronize];
                NSLog(@"data saved - %@", userLogPass);
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
                EnterViewController *reveal = (EnterViewController *) [storyboard instantiateViewControllerWithIdentifier:@"RevealViewController"];
                [self.navigationController pushViewController:reveal animated:NO];
                break;
            } else {
                UILabel *invalidPass = [[UILabel alloc]init];
                invalidPass.text = @"Not valid login or password";
                [invalidPass sizeToFit];
                [invalidPass setAlpha:1];
                [invalidPass setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
                [invalidPass setFrame:CGRectMake(self.view.frame.size.width / 2 - invalidPass.frame.size.width / 2, self.view.frame.size.height / 2 + 30, invalidPass.frame.size.width, invalidPass.frame.size.height)];
                [self.view addSubview:invalidPass];
                [UIImageView animateKeyframesWithDuration:2 delay:0.5 options:0 animations:^{
                    [invalidPass setAlpha:0];
                } completion:^(BOOL finished) {}];
                }
            }
        }
}

-(IBAction)backButtonMethod:(id)sender {
    [UIView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.backGroundImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.backButton setAlpha:0];
        [self.enterButton setAlpha:0];
        [self.passField setAlpha:0];
        [self.loginField setAlpha:0];
        [self.view addSubview:self.millureName];
        [self.millureName setAlpha:1];
    } completion:^(BOOL finished) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        EnterViewController *ViewController = (EnterViewController *) [storyboard instantiateViewControllerWithIdentifier:@"PresentViewController"];
        [self.navigationController pushViewController:ViewController animated:NO];
    }];


};

-(IBAction)keyBoardClose:(id)sender{
    [self.view endEditing:YES];
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
