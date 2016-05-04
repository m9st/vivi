//
//  RevealMenuTableViewController.m
//  vivi
//
//  Created by Admin on 17.02.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "RevealMenuTableViewController.h"
#import "SWRevealViewController.h"
#import "PhotoPickerController.h"

@interface RevealMenuTableViewController ()

@end

@implementation RevealMenuTableViewController

-(void)viewDidLoad {
    self.revealMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.revealMenuTableView setScrollEnabled:NO];
    self.revealMenuTableView.delegate = self;
    self.revealMenuTableView.dataSource = self;
    self.revealMenuTableView.backgroundColor = [UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0];
    [self.view addSubview:self.revealMenuTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    int section = [indexPath section];
    int row = [indexPath row];
    
    UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"userPhotoInMillierApp.png"];
    
    UIImage *photoFromAppDirectory = [UIImage imageWithContentsOfFile:imagePath];
    if (photoFromAppDirectory != nil) {
        [photo setImage:photoFromAppDirectory];
    } else {

    
    [photo setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
        [photo setClipsToBounds:YES];
        [photo.layer setCornerRadius:photo.frame.size.width / 2];
    }
    

    
    UITableViewCell *photoNameCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    UITableViewCell *clientViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    UITableViewCell *settingsCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    UITableViewCell *exitCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    UITableViewCell *rulesCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    UILabel *nameLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(90, 40, 80, 30)];
    UILabel *lastNameLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(170, 40, 100, 30)];
    
    NSUserDefaults *nameLastName = [NSUserDefaults standardUserDefaults];
    
    NSString *nameString = [nameLastName objectForKey:@"name"];
    NSString *lastNameString = [nameLastName objectForKey:@"lastName"];
    
    nameLabel.text = nameString;
    lastNameLabel.text = lastNameString;
    
    nameLabel.textColor = [UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0];
    lastNameLabel.textColor = [UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0];
    
    [nameLabel sizeToFit];
    [lastNameLabel sizeToFit];
    
    [lastNameLabel setFrame:CGRectMake(110, 40, lastNameLabel.frame.size.width, 25)];
    [nameLabel setFrame:CGRectMake(lastNameLabel.frame.origin.x + lastNameLabel.frame.size.width + 10, 40, nameLabel.frame.size.width, 25)];
    
    [photoNameCell addSubview:nameLabel];
    [photoNameCell addSubview:lastNameLabel];
    [photoNameCell addSubview:photo];
    
    [photoNameCell setBackgroundColor:[UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0]];
    [clientViewCell setBackgroundColor:[UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0]];
    [settingsCell setBackgroundColor:[UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0]];
    [exitCell setBackgroundColor:[UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0]];
    [rulesCell setBackgroundColor:[UIColor colorWithRed:0.04 green:0.02 blue:0.01 alpha:1.0]];
    
    clientViewCell.textLabel.text = @"Make order";
    settingsCell.textLabel.text = @"Settings";
    rulesCell.textLabel.text = @"App Rules";
    exitCell.textLabel.text = @"Exit";
    
    [photoNameCell.textLabel setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    [clientViewCell.textLabel setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    [settingsCell.textLabel setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    [rulesCell.textLabel setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    [exitCell.textLabel setTextColor:[UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0]];
    
    if (section == 0) {
    
        if (row == 0)
        {
            return photoNameCell;
        }
            else if (row == 1)
        {
            return clientViewCell;
        }
            else if (row == 2)
        {
            return settingsCell;
        }
            else if (row == 3)
        {
            return rulesCell;
        }
    }
    
    if (section == 1) {
            if (row == 0) {
                return exitCell;
            }
    }
        return nil;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    int const section = [indexPath section];
    int const row = [indexPath row];
    if (section == 0) {
        if (row == 0) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
            RevealMenuTableViewController *PhotoPickerController = (RevealMenuTableViewController *) [storyboard instantiateViewControllerWithIdentifier:@"PhotoPickerController"];
            [self.revealViewController setFrontViewController:PhotoPickerController animated:NO];
            [self.revealViewController revealToggle:self];
        }
        if (row == 1) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
            RevealMenuTableViewController *ClientViewController = (RevealMenuTableViewController *) [storyboard instantiateViewControllerWithIdentifier:@"ClientViewController"];
            [self.revealViewController setFrontViewController:ClientViewController animated:NO];
            [self.revealViewController revealToggle:self];
        }
            if (row == 2) {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
                RevealMenuTableViewController *SettingsViewController = (RevealMenuTableViewController *) [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
                [self.revealViewController setFrontViewController:SettingsViewController animated:NO];
                [self.revealViewController revealToggle:self];
            }
        if (row == 3) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
            RevealMenuTableViewController *RulesViewController = (RevealMenuTableViewController *) [storyboard instantiateViewControllerWithIdentifier:@"RulesViewController"];
            [self.revealViewController setFrontViewController:RulesViewController animated:NO];
            [self.revealViewController revealToggle:self];
            
        }

    }
    if (section == 1) {
        if (row == 0) {
            [self exitCellMethod:self];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        return 1;
    }
        return self.view.frame.size.height - 320;
    }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    int const section = [indexPath section];
    
    if (section == 0) {
    if (indexPath.row == 0){
        return 100;
    }
    }
    return 40;
}

-(void)didReceiveMemoryWarning {
    
}

-(IBAction)exitCellMethod:(id)sender {
    NSUserDefaults *deleteUser = [NSUserDefaults standardUserDefaults];
    [deleteUser removeObjectForKey:@"userLogin"];
    [deleteUser removeObjectForKey:@"userPassword"];
    [deleteUser synchronize];
    NSLog(@"data - %@", deleteUser);
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RevealMenuTableViewController *PresentViewController = (RevealMenuTableViewController *) [storyboard instantiateViewControllerWithIdentifier:@"PresentViewController"];
    [self.navigationController pushViewController:PresentViewController animated:NO];
}


//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
//    SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
//    
//    swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
//        
//        UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
//        [navController setViewControllers: @[dvc] animated: NO ];
//        [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
//    };
//}
//}



@end
