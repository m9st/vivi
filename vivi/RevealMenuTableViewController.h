//
//  RevealMenuTableViewController.h
//  vivi
//
//  Created by Admin on 17.02.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RevealMenuTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *revealMenuTableView;
@property (strong, nonatomic) NSArray *cellsArray;
@property (strong, nonatomic) UIImageView *photo;


@end
