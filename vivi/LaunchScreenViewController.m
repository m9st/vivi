//
//  LaunchViewController.m
//  vivi
//
//  Created by Admin on 16.02.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "LaunchScreenViewController.h"

@interface LaunchScreenViewController ()

@end

@implementation LaunchScreenViewController



-(void) viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    self.backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2,0, 0)];
    [self.backGroundImage setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
    [self.view addSubview:self.backGroundImage];
    [UIImageView animateKeyframesWithDuration:1 delay:2 options:0 animations:^{
        [self.backGroundImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    } completion:^(BOOL finished) {
        
    }];
    self.millureName = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 75, (self.view.frame.size.height / 2) - 50, 150, 100)];
    [self.millureName setImage:[UIImage imageNamed:@"milier2.png"]];
    [self.view addSubview:self.millureName];
    
    [UIImageView animateKeyframesWithDuration:1 delay:2 options:0 animations:^{
        [self.millureName setFrame:CGRectMake((self.view.frame.size.width / 2) - 150, 50, 300, 150)];
    } completion:^(BOOL finished) {
        
        NSUserDefaults *userLogPass = [NSUserDefaults standardUserDefaults];
        NSString *loginString = [userLogPass objectForKey:@"userLogin"];
        NSString *passString = [userLogPass objectForKey:@"userPassword"];
        NSLog(@"\nlogin - %@\npassword - %@", loginString, passString);
        
        if ([passString length] > 1 && [loginString length] > 1) {
            NSURL *url = [NSURL URLWithString:@"file://localhost/Users/admin/Desktop/vivi/JSON/vivijson.json"];
            NSError *error;
            
            NSData *data = [NSData dataWithContentsOfURL:url];
            NSMutableArray *jsonArrayFromURL = nil;
            if (data)
                jsonArrayFromURL = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (jsonArrayFromURL == nil) {
                jsonArrayFromURL = [[NSMutableArray alloc] init];
            NSLog(@"jsonArrayFromURL is NIL");
                [self nextController];
            } else {
            for (int i=0; i < jsonArrayFromURL.count; ++i) {
                NSMutableDictionary *dict = nil;
                dict = [jsonArrayFromURL objectAtIndex:i];
                NSArray *emailFromDict = [dict objectForKey:@"email"];
                NSArray *numberFromDict = [dict objectForKey:@"number"];
                NSArray *passwordFromDict = [dict objectForKey:@"password"];
                NSLog(@"%@",emailFromDict);
                if (([emailFromDict isEqual:loginString ] || [numberFromDict isEqual:loginString]) && [passwordFromDict isEqual:passString]) {
                    NSLog(@"YES");
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
                    LaunchScreenViewController *reveal = (LaunchScreenViewController *) [storyboard instantiateViewControllerWithIdentifier:@"RevealViewController"];
                    [self.navigationController pushViewController:reveal animated:NO];
                    break;
                    }
                }
            }
        } else {
        [self nextController];
        }
    }];
}

-(void) nextController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LaunchScreenViewController *PresentViewController = (LaunchScreenViewController *) [storyboard instantiateViewControllerWithIdentifier:@"PresentViewController"];
    [self.navigationController pushViewController:PresentViewController animated:NO];
    NSLog(@"NO");
}




-(void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
