//
//  MUDataModelBase.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUTableViewDataModeling.h"
#import "MUDefines.h"

@interface MUDataModelBase : NSObject<MUTableViewDataModeling>

@property(strong, nonatomic, readonly) NSMutableArray *dataArray;
@property(strong, nonatomic) NSMutableArray *headerArray;
@property(strong, nonatomic) dispatch_queue_t arrayQueue;

@property(strong, nonatomic) MUAnonymousBlock selectionStartBlock;
@property(strong, nonatomic) MUAnonymousBlock selectionCompleteBlock;
@property(strong, nonatomic) MUAnonymousBlock selectionErrorBlock;

-(void)setDataArray:(NSMutableArray *)dataArray;
-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath;
-(NSString *)titleForSection:(NSInteger)inSection;
-(void)dataModelUpdated;

@end
