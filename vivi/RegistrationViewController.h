//
//  RegistrationViewConctroller.h
//  vivi
//
//  Created by MAC on 02.12.15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegistrationViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) UIImageView *backGroundImage;
@property (strong, nonatomic) UIScrollView *regScrollView;
@property (strong, nonatomic) UIButton * backButton;
@property (strong, nonatomic) UITextField *passField;
@property (strong, nonatomic) UITextField *nameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UITextField *numberField;
@property (strong, nonatomic) UITextField *checkPassField;
@property (strong, nonatomic) UIImageView *millureName;
@property (strong, nonatomic) UITapGestureRecognizer * tapRecognize;
@property (strong, nonatomic) UIButton *regButton;
@property (strong, nonatomic) NSArray *numberFromDict;
@property (strong, nonatomic) NSArray *emailFromDict;


@end
