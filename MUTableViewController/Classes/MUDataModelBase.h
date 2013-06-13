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
{
     NSMutableArray *_dataArray;   
}


@property(strong, nonatomic) MUAnonymousBlock selectionStartBlock;
@property(strong, nonatomic) MUAnonymousBlock selectionCompleteBlock;
@property(strong, nonatomic) MUAnonymousBlock selectionErrorBlock;

@property(strong, nonatomic, readonly) NSMutableArray *deletedIndexArray;
@property(strong, nonatomic, readonly) NSMutableArray *addedIndexArray;

-(void)setDataArray:(NSMutableArray *)dataArray;
-(NSMutableArray *)dataArray;

-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath;
-(void)insertObjectAtIndexPath:(NSObject *)inObject atIndex:(NSIndexPath *)inIndexPath;

-(NSString *)titleForSection:(NSInteger)inSection;
-(void)dataModelUpdated;
-(void)clearChangedIndexes;
@end
