//
//  PhotoPickerController.h
//  vivi
//
//  Created by Admin on 09.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoPickerController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIImageView *userPhoto;
@property (strong, nonatomic) UIImage *chosenImage;
@property (strong, nonatomic) UITapGestureRecognizer *openPhotoPicker;


@end
