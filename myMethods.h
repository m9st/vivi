//
//  Header.h
//  vivi
//
//  Created by Admin on 02.02.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#ifndef Header_h
#define Header_h


#endif /* Header_h */


"ftp://178.140.181.84/Desktop/vivi/JSON/vivijson.json"
#pragma mark JSON
if ([self.nameString isEqual:@""] || [self.passString isEqual:@"" ] || [self.numberString isEqual:@""] || [self.emailString isEqual:@""] || [self.lastNameString isEqual:@""]  ) {
    UIAlertController * alertController = [UIAlertController new];
    [alertController setTitle:@"Не верно введены данные"];
    [alertController setMessage:@"Повторите попытку"];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Закрыть" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
} else {
    NSURL *url = [NSURL URLWithString:@"file://localhost/Users/admin/Desktop/JSON/vivijson.json"];
    NSDictionary *regDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                             self.passString, @"password",
                             self.nameString, @"name",
                             self.lastNameString, @"lastName",
                             self.emailString, @"email",
                             self.numberString, @"number",  nil];
    NSError *error;
    NSMutableArray *regMutArray = [[NSMutableArray alloc] init];
    [regMutArray addObject:regDict];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSMutableArray *array = nil;
    if (data)
        array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (array == nil)
        {
            array = [[NSMutableArray alloc] init];
        }
    [array addObjectsFromArray:regMutArray];
    
    NSData *jsonConvRegArrayData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonRegString = [[NSString alloc] initWithData:jsonConvRegArrayData encoding:NSUTF8StringEncoding];
    [jsonRegString writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"%@",jsonRegString);
    
#pragma mark - delete User Data
    
    -(IBAction)exitCellMethod:(id)sender {
        NSUserDefaults *deleteUser = [NSUserDefaults standardUserDefaults];
        [deleteUser removeObjectForKey:@"userLogin"];
        [deleteUser removeObjectForKey:@"userPassword"];
        [deleteUser synchronize];
        NSLog(@"data - %@", deleteUser);
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RevealMenuTableViewController *EnterViewController = (RevealMenuTableViewController *) [storyboard instantiateViewControllerWithIdentifier:@"EnterViewController"];
        
        [self.navigationController pushViewController:EnterViewController animated:NO];
    }

