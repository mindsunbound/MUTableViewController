//
//  MUDataModelEnabledTableViewController.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "MUDataModelEnabledTableViewController.h"
#import "MUTableViewDataObject.h"
#import "MUConfigurableTableCell.h"
#import "MUDataModelBase.h"

@interface MUDataModelEnabledTableViewController ()

@end

@implementation MUDataModelEnabledTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    [self.tableView setTableFooterView:v];
    self.rowDeletionAnimation = UITableViewRowAnimationAutomatic;
    self.rowInsertionAnimation = UITableViewRowAnimationAutomatic;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"Table updated");
    NSArray *addedIndexes = self.dataModel.addedIndexArray;
    NSArray *deletedIndexes = self.dataModel.deletedIndexArray;
    if( addedIndexes.count > 0 || deletedIndexes.count > 0 )
    {
        [self.tableView beginUpdates];
        if( addedIndexes.count > 0 )
        {
            [self.tableView insertRowsAtIndexPaths:addedIndexes withRowAnimation:self.rowInsertionAnimation];
        }
        if( deletedIndexes.count > 0 )
        {
            [self.tableView deleteRowsAtIndexPaths:deletedIndexes withRowAnimation:self.rowDeletionAnimation];
        }
        [self.tableView endUpdates];
        [self.dataModel clearChangedIndexes];
        
    }
    else
    {
        [self.tableView reloadData];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MUTableViewDataObject *dataObject = [self.dataModel objectForRowAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:dataObject.storyBoardIdentifier forIndexPath:indexPath];
    
    if( [cell conformsToProtocol:@protocol(MUConfigurableTableCell)])
    {
        [cell performSelector:@selector(configureCellWithObject:) withObject:dataObject.modelObject];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( _dataModel == nil )
    {
        [self.dataModel dataModelUpdated];
    }
    
    MUTableViewDataObject *dataObject = [self.dataModel objectForRowAtIndexPath:indexPath];
    if( dataObject.selectionBlock != nil )
    {
        dataObject.selectionBlock();
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - extended kvo methods
-(void)observeWithKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options
{
    if( self.subscribedKeypaths == nil )
    {
        _subscribedKeypaths = [[NSMutableDictionary alloc] init];
    }
    NSNumber *keyExists = self.subscribedKeypaths[keyPath];
    if( !keyExists )
    {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
        self.subscribedKeypaths[keyPath] = @(1);
    }
    
}

-(void)removeObserverWithKeyPath:(NSString *)keyPath
{
    @try
    {
        [self.subscribedKeypaths removeObjectForKey:keyPath];
        [self removeObserver:self forKeyPath:keyPath];
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@ - %@", exception.name, exception.reason);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self removeObserverWithKeyPath:kDataModelKey];
    _dataModel = nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.dataModel deleteObjectAtIndexPath:indexPath];
    }
}

-(void)dealloc
{
    @try
    {
        for( NSString *keyPath in [self.subscribedKeypaths allKeys] )
        {
            [self removeObserver:self forKeyPath:keyPath];
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@ - %@", exception.name, exception.reason);
    }
    
    
}
@end
