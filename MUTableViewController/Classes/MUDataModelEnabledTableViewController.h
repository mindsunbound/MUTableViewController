//
//  MUDataModelEnabledTableViewController.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MUDataModelBase;

#define kDataModelKey @"self.dataModel.dataArray"

@interface MUDataModelEnabledTableViewController : UITableViewController
{
        MUDataModelBase *_dataModel;
}

@property(strong, nonatomic, readonly) MUDataModelBase *dataModel;
@property(strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property(strong, nonatomic, readonly) NSMutableDictionary *subscribedKeypaths;

@property(nonatomic) UITableViewRowAnimation rowInsertionAnimation;
@property(nonatomic) UITableViewRowAnimation rowDeletionAnimation;

-(void)observeWithKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options;

@end
