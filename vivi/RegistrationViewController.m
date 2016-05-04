//
//  RegistrationViewConctroller.m
//  vivi
//
//  Created by MAC on 02.12.15.
//  Copyright © 2015 MAC. All rights reserved.
//

#import "RegistrationViewController.h"


@interface RegistrationViewController ()

@end

@implementation RegistrationViewController{
    
}


-(void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    
     self.backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.backGroundImage setImage:[UIImage imageNamed:@"backGroundImage.jpg"]];
    [self.view addSubview:self.backGroundImage];
    
     self.millureName = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 2) - 150, 10, 280, 120)];
    [self.millureName setImage:[UIImage imageNamed:@"milier2.png"]];
    [self.millureName setAlpha:0];
    
     self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setFrame:CGRectMake(self.view.frame.size.width / 2 + 25, (self.view.frame.size.height / 2) + 140, 50, 50)];
    
     self.regButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.regButton setTitle:@"Registration" forState:UIControlStateNormal];
    [self.regButton addTarget:self action:@selector(regButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.regButton setFrame:CGRectMake((self.view.frame.size.width / 2) - 100, (self.view.frame.size.height / 2) + 140, 100, 50)];

    UIGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:tapRecognize];
}

-(void)viewWillAppear:(BOOL)animated {
    [UIImageView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.backGroundImage setFrame:CGRectMake(0 - (self.view.frame.size.width / 2), 0 - (self.view.frame.size.height / 2), self.view.frame.size.width * 2, self.view.frame.size.height * 2)];
    } completion:^(BOOL finished) {

        
        
         self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) - 140, self.view.frame.size.width / 1.5, 30)];
         self.lastNameField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) - 90, self.view.frame.size.width / 1.5, 30)];
         self.numberField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) - 40, self.view.frame.size.width / 1.5, 30)];
         self.passField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) + 10, self.view.frame.size.width / 1.5, 30)];
         self.checkPassField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) + 60, self.view.frame.size.width / 1.5, 30)];
         self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(50, (self.view.frame.size.height / 2) + 110, self.view.frame.size.width / 1.5, 30)];

        
        
        [self.nameField setPlaceholder:@"Name"];
        [self.lastNameField setPlaceholder:@"Last Name"];
        [self.numberField setPlaceholder:@"Phone Number"];
        [self.emailField setPlaceholder:@"E-MAIL"];
        [self.passField setPlaceholder:@"Password"];
        [self.checkPassField setPlaceholder:@"Check Password"];
        
        [self.nameField setBackgroundColor:[UIColor grayColor]];
        [self.lastNameField setBackgroundColor:[UIColor grayColor]];
        [self.emailField setBackgroundColor:[UIColor grayColor]];
        [self.numberField setBackgroundColor:[UIColor grayColor]];
        [self.passField setBackgroundColor:[UIColor grayColor]];
        [self.checkPassField setBackgroundColor:[UIColor grayColor]];
        
        [self.nameField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.lastNameField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.emailField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.numberField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.passField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.checkPassField setBorderStyle:UITextBorderStyleRoundedRect];
        
        [self.passField setSecureTextEntry:YES];
        [self.checkPassField setSecureTextEntry:YES];
        
        
        self.nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.lastNameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.numberField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.emailField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.passField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.checkPassField.clearButtonMode  = UITextFieldViewModeWhileEditing;
        
        self.numberField.keyboardType = UIKeyboardTypeNumberPad;
        
        self.numberField.returnKeyType = UIReturnKeyNext;
        self.lastNameField.returnKeyType = UIReturnKeyNext;
        self.nameField.returnKeyType = UIReturnKeyNext;
        self.passField.returnKeyType = UIReturnKeyNext;
        self.checkPassField.returnKeyType = UIReturnKeyNext;
        
        self.numberField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.lastNameField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        self.nameField.autocapitalizationType = UITextAutocapitalizationTypeWords;
//        self.emailText.autocapitalizationType = UITextAutocapitalizationTypeWords;
        
        self.numberField.delegate = self;
        self.nameField.delegate = self;
        self.lastNameField.delegate = self;
        self.passField.delegate = self;
        self.checkPassField.delegate = self;
        self.emailField.delegate = self;
        
       
        [self.emailField addTarget:self action:@selector(regButtonMethod:) forControlEvents:UIControlEventEditingDidEndOnExit];
        [self.emailField setReturnKeyType:UIReturnKeyDone];
        
        [self.regButton setAlpha:0];
        [self.passField setAlpha:0];
        [self.backButton setAlpha:0];
        [self.nameField setAlpha:0];
        [self.lastNameField setAlpha:0];
        [self.numberField setAlpha:0];
        [self.emailField setAlpha:0];
        [self.checkPassField setAlpha:0];
        
        [self.view addSubview:self.regButton];
        [self.view addSubview:self.passField];
        [self.view addSubview:self.backButton];
        [self.view addSubview:self.nameField];
        [self.view addSubview:self.lastNameField];
        [self.view addSubview:self.numberField];
        [self.view addSubview:self.emailField];
        [self.view addSubview:self.checkPassField];
        [self.view addSubview:self.millureName];

        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.millureName setAlpha:1.0];
            [self.backButton setAlpha:1.0];
            [self.passField setAlpha:1.0];
            [self.nameField setAlpha:1.0];
            [self.emailField setAlpha:1.0];
            [self.numberField setAlpha:1.0];
            [self.checkPassField setAlpha:1.0];
            [self.lastNameField setAlpha:1.0];
            [self.regButton setAlpha:1.0];
        } completion:^(BOOL finished) {}];
    }];
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([textField isEqual:self.checkPassField]) {
        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.view setFrame:CGRectMake(0, -130, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {}];
    } else if ([textField isEqual:self.emailField]) {
        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.view setFrame:CGRectMake(0, -130, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {}];
    } else if ([textField isEqual:self.passField]) {
        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.view setFrame:CGRectMake(0, -130, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {}];
    } else {
        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        } completion:^(BOOL finished) {}];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if ([textField isEqual:self.numberField]) {
    NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([components count] > 1) {
        return NO;
    }
    NSString* newString = [self.numberField.text stringByReplacingCharactersInRange:range withString:string];
    NSArray* validComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    newString = [validComponents componentsJoinedByString:@""];
    
    static const int localNumberMaxLength = 7;
    static const int areaCodeMaxLength = 3;
    static const int countryCodeMaxLength = 1;
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
        return NO;
    }
    
    NSMutableString* resultString = [NSMutableString string];
    NSInteger localNumberLength = MIN([newString length], localNumberMaxLength);
    
    if (localNumberLength > 0) {
        NSString* number = [newString substringFromIndex:(int)[newString length] - localNumberLength];
        [resultString appendString:number];
        if ([resultString length] > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if ([newString length] > localNumberMaxLength) {
        NSInteger areaCodeLength = MIN((int)[newString length] - localNumberMaxLength, areaCodeMaxLength);
        NSRange areaRange = NSMakeRange((int)[newString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
        NSString* area = [newString substringWithRange:areaRange];
        area = [NSString stringWithFormat:@"(%@) ", area];
        [resultString insertString:area atIndex:0];
    }
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength) {
        NSInteger countryCodeLength = MIN((int)[newString length] - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        NSString* countryCode = [newString substringWithRange:countryCodeRange];
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        [resultString insertString:countryCode atIndex:0];
    }
    
    self.numberField.text = resultString;
        return NO;
    }
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.nameField]) {
        [self.lastNameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    if ([textField isEqual:self.lastNameField]) {
        [self.numberField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    if ([textField isEqual:self.numberField]) {
        [self.passField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    if ([textField isEqual:self.passField]) {
        [self.checkPassField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    if ([textField isEqual:self.checkPassField]) {
        [self.emailField becomeFirstResponder];
    }
    if ([textField isEqual:self.emailField]) {
        [self regButtonMethod:self];
    }

    
    return NO;
}

#pragma mark - BUTTONS

-(IBAction)regButtonMethod:(id)sender {
    NSURL *url = [NSURL URLWithString:@"file://localhost/Users/admin/Desktop/vivi/JSON/vivijson.json"];
    NSError *error;
    NSMutableArray *regMutArray = nil;
    NSDictionary *regDict = nil;
    regDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                             self.numberField.text, @"number",
                             self.emailField.text, @"email",
                             self.passField.text, @"password",
                             self.nameField.text, @"name",
                             self.lastNameField.text, @"lastName",
                             nil, @"photoUrl",
                             nil];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *jsonArrayFromURL = nil;

    if (data)
        jsonArrayFromURL = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (jsonArrayFromURL == nil)
    {
        jsonArrayFromURL = [[NSMutableArray alloc] init];
    }
    for (int i=0; i < jsonArrayFromURL.count; ++i) {
        NSMutableDictionary *dict = nil;
        dict = [jsonArrayFromURL objectAtIndex:i];
        self.emailFromDict = [dict objectForKey:@"email"];
        self.numberFromDict = [dict objectForKey:@"number"];

        if ([self.numberFromDict isEqual:self.numberField.text] || [self.emailFromDict isEqual:self.emailField.text]) {
            UIAlertController * alertCharCount = [UIAlertController new];
            [alertCharCount setTitle:@"Number or Email alredy registred"];
            [alertCharCount setMessage:@"Try again"];
            UIAlertAction *alertCharCountAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
            [alertCharCount addAction:alertCharCountAction];
            [self presentViewController:alertCharCount animated:YES completion:nil];
            break;
        }
    }
    
        
    if ([self.nameField.text isEqual:@""] || [self.passField.text isEqual:@"" ] || [self.numberField.text isEqual:@""] || [self.emailField.text isEqual:@""] || [self.lastNameField.text isEqual:@""]  ) {
        UIAlertController * alertController = [UIAlertController new];
        [alertController setTitle:@"Some fields is empty"];
        [alertController setMessage:@"Fill rest fields"];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alertController addAction:alertAction];
        [self presentViewController:alertController animated:YES completion:nil];
        self.passField.text = @"";
        self.checkPassField.text = @"";
        
    } else if ([self.passField.text length] < 6) {
            UIAlertController * alertCharCount = [UIAlertController new];
            [alertCharCount setTitle:@"Password character count are must be much then 6"];
            [alertCharCount setMessage:@"Try again"];
            UIAlertAction *alertCharCountAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
            [alertCharCount addAction:alertCharCountAction];
            [self presentViewController:alertCharCount animated:YES completion:nil];
            self.passField.text = @"";
            self.checkPassField.text = @"";
        
    } else if ([self.passField.text isEqualToString:self.checkPassField.text]) {
        regMutArray = [[NSMutableArray alloc] initWithObjects:regDict, nil];
        [jsonArrayFromURL addObjectsFromArray:regMutArray];
        NSData *jsonConvRegArrayData = [NSJSONSerialization dataWithJSONObject:jsonArrayFromURL options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonRegString = [[NSString alloc] initWithData:jsonConvRegArrayData encoding:NSUTF8StringEncoding];
        [jsonRegString writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&error];

        [UIImageView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
            [self closeKeyBoard:self];
            [self.backGroundImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            [self.millureName setFrame:CGRectMake((self.view.frame.size.width / 2) - 150, (self.view.frame.size.height / 2) - 200, 280, 130)];
            [self.numberField setAlpha:0];
            [self.nameField setAlpha:0];
            [self.lastNameField setAlpha:0];
            [self.passField setAlpha:0];
            [self.emailField setAlpha:0];
            [self.checkPassField setAlpha:0];
            [self.regButton setAlpha:0];
            [self.backButton setAlpha:0];
            [self.backGroundImage setAlpha:0];
        } completion:^(BOOL finished) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            RegistrationViewController *RegCheckViewController = (RegistrationViewController *) [storyboard instantiateViewControllerWithIdentifier:@"regCheckViewController"];
            [self.navigationController pushViewController:RegCheckViewController animated:NO];
            }];

    } else {
        UIAlertController * alertPassIsntEqual = [UIAlertController new];
        [alertPassIsntEqual setTitle:@"Typed passwords isnt equals"];
        [alertPassIsntEqual setMessage:@"Try again"];
        UIAlertAction *alertalertPassIsntEqualAction = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertPassIsntEqual addAction:alertalertPassIsntEqualAction];
        [self presentViewController:alertPassIsntEqual animated:YES completion:nil];
        self.passField.text = @"";
        self.checkPassField.text = @"";
        }

}

-(IBAction)backButtonMethod:(id)sender {
    [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
        [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self closeKeyBoard:self];
    } completion:^(BOOL finished) {
    [UIView animateKeyframesWithDuration:0.7 delay:0 options:0 animations:^{
        [self.backGroundImage setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.backButton setAlpha:0];
        [self.nameField setAlpha:0];
        [self.lastNameField setAlpha:0];
        [self.numberField setAlpha:0];
        [self.passField setAlpha:0];
        [self.emailField setAlpha:0];
        [self.regButton setAlpha:0];
        [self.checkPassField setAlpha:0];
        [self.view addSubview:self.millureName];
        [self.millureName setAlpha:1];
        [self.millureName setFrame:CGRectMake((self.view.frame.size.width / 2) - 150, 50, 300, 150)];
    } completion:^(BOOL finished) {
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RegistrationViewController * PresentViewController = (RegistrationViewController *) [storyboard instantiateViewControllerWithIdentifier:@"PresentViewController"];
        [self.navigationController pushViewController:PresentViewController animated:NO];;
        }];
    }];
}

-(IBAction)closeKeyBoard:(id)sender{
        [UIImageView animateKeyframesWithDuration:0.3 delay:0 options:0 animations:^{
            [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            [self.view endEditing:YES];
        } completion:^(BOOL finished) {}];
    ;
}

#pragma mark - memory warning

-(void)didReceiveMemoryWarning {
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
