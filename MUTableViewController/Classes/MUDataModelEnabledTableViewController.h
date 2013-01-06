//
//  MUDataModelEnabledTableViewController.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
//

#import <UIKit/UIKit.h>

@class MUDataModelBase;

#define kDataModelKey @"self.dataModel.dataDictionary"

@interface MUDataModelEnabledTableViewController : UITableViewController
{
        MUDataModelBase *_dataModel;
}

@property (strong, nonatomic, readonly) MUDataModelBase *dataModel;
@property (strong, nonatomic) IBOutlet UIImageView *headerImageView;
@property (strong, nonatomic, readonly) NSMutableDictionary *subscribedKeypaths;

-(void)observeWithKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options;

@end
