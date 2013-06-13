//
//  MUSquareBadgeView.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUDataModelEnabledTableViewController.h"

@interface ExampleTableViewController : MUDataModelEnabledTableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

- (IBAction)addItemClicked:(id)sender;
- (IBAction)editButtonClicked:(id)sender;

@end
