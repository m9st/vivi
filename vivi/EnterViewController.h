//
//  EnterViewController.h
//  vivi
//
//  Created by MAC on 03.12.15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface EnterViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) UIButton * backButton;
@property (strong, nonatomic) UIButton * enterButton;
@property (strong, nonatomic) UIImageView * backGroundImage;
@property (strong, nonatomic) UIImageView * millureName;
@property (strong, nonatomic) UITextField * loginField;
@property (strong, nonatomic) UITextField * passField;
@property (strong, nonatomic) UITapGestureRecognizer * tapRecognize;
@property (strong, nonatomic) UIAlertController * alertController;

@end
