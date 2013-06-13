//
//  ExampleTableViewController.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "ExampleTableViewController.h"
#import "ExampleDataModel.h"
#import <QuartzCore/QuartzCore.h>
#import "MUTableDataModel.h"

@interface ExampleTableViewController ()

@end

@implementation ExampleTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(performColorSegue:) name:PERFORM_COLOR_SEGUE_NOTIFICATION object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateWelcomeLabel) name:@"autoLoginSuccessful" object:nil];
    if([self.dataModel respondsToSelector:@selector(dataModelUpdated)] )
    {
        [self.dataModel performSelector:@selector(dataModelUpdated)];
    }
}


-(MUDataModelBase *)dataModel
{
    if( _dataModel == nil )
    {
        _dataModel = [[ExampleDataModel alloc] init];
        [self observeWithKeyPath:kDataModelKey options:NSKeyValueObservingOptionNew];
    }
    return _dataModel;
}

-(void)performColorSegue:(NSNotification *)notification
{
    NSString *segueIdentifier = (NSString *)notification.object;
    [self performSegueWithIdentifier:segueIdentifier sender:self];
}

- (IBAction)addItemClicked:(id)sender
{
    if( self.tableView.editing )
    {
        [self editButtonClicked:nil];
    }
    [((ExampleDataModel *)self.dataModel)addItemNewExampleItem];
}

- (IBAction)editButtonClicked:(id)sender
{
    NSString *title = [self.editButton.title isEqualToString:@"Edit"] ? @"Done" : @"Edit";
    self.editButton.title = title;
    self.tableView.editing = !self.tableView.editing;
    
}


@end
