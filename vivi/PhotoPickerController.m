//
//  PhotoPickerController.m
//  vivi
//
//  Created by Admin on 09.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "PhotoPickerController.h"
#import "SWRevealViewController.h"


@interface PhotoPickerController ()

@end

@implementation PhotoPickerController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    self.openPhotoPicker = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPhotoPickerMethod)];
    self.openPhotoPicker.numberOfTapsRequired = 1;
    
    
    self.userPhoto = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 75, self.view.frame.size.height / 2 - 150, 150, 150)];
    self.userPhoto.clipsToBounds = YES;
    [self.userPhoto.layer setCornerRadius:self.userPhoto.frame.size.width / 2];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"userPhotoInMillierApp.png"];
    
    UIImage *photoFromAppDirectory = [UIImage imageWithContentsOfFile:imagePath];
    if (photoFromAppDirectory != nil) {
        [self.userPhoto setImage:photoFromAppDirectory];
    } else {
        [self.userPhoto setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
    }

    UIBarButtonItem *showRevealControllerButton = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self.revealViewController action:@selector(revealToggle:)];
    [showRevealControllerButton setWidth:30];
    [self.navigationItem setLeftBarButtonItem:showRevealControllerButton];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
    
    UILabel *nameLabel = [[UILabel alloc] init];    UILabel *lastNameLabel = [[UILabel alloc] init];
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    NSString *name = [userData objectForKey:@"name"];
    NSString *lastName = [userData objectForKey:@"lastName"];
    nameLabel.text = name;
    [nameLabel sizeToFit];
    lastNameLabel.text = lastName;
    [lastNameLabel sizeToFit];
    nameLabel.textColor = [UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0];
    lastNameLabel.textColor = [UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0];
    [nameLabel setFrame:CGRectMake(self.view.frame.size.width / 2 + 2.5, self.view.frame.size.height / 2 + 20, nameLabel.frame.size.width, 25)];
    [lastNameLabel setFrame:CGRectMake(self.view.frame.size.width / 2 - lastNameLabel.frame.size.width - 2.5, self.view.frame.size.height / 2 + 20, lastNameLabel.frame.size.width, 25)];
    
    [self.userPhoto setUserInteractionEnabled:YES];
    [self.userPhoto addGestureRecognizer:self.openPhotoPicker];
    
    
    
    [self.view addSubview:self.userPhoto];
    [self.userPhoto addGestureRecognizer:self.openPhotoPicker];
    [self.view addSubview:nameLabel];
    [self.view addSubview:lastNameLabel];

    }

-(void)openPhotoPickerMethod {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ClientStoryBoard" bundle:nil];
    PhotoPickerController *cameraCameraRollTabBarController = (PhotoPickerController *) [storyboard instantiateViewControllerWithIdentifier:@"cameraCameraRollTabBarController"];
    [self.navigationController presentViewController:cameraCameraRollTabBarController animated:YES completion:nil];
//    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        NSLog(@"NoCam");
//    } else {
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//    [self presentViewController:picker animated:YES completion:NO];
//    }
}





-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
        self.chosenImage = info[UIImagePickerControllerEditedImage];
        self.userPhoto.image = self.chosenImage;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:@"userPhotoInMillierApp.png"];
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]){
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        NSData *webData = UIImagePNGRepresentation(editedImage);
        [webData writeToFile:imagePath atomically:YES];
    }

    
        [picker dismissViewControllerAnimated:YES completion:NO];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NO];
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
