//
//  MUDataModelBase.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "MUDataModelBase.h"

@interface MUDataModelBase()
{
    NSMutableArray *_dataArray;
}

@property(strong, nonatomic, readonly) NSMutableArray *dataArray;
@property(strong, nonatomic) NSMutableArray *headerArray;
@property(strong, nonatomic) dispatch_queue_t arrayQueue;

@end

@implementation MUDataModelBase

-(id)init
{
    self = [super init];
    if( self != nil )
    {
        _arrayQueue = dispatch_queue_create("com.mudatamodelbase.dataqueue", NULL);
        _dataArray = [[NSMutableArray alloc] init];
        _headerArray = [[NSMutableArray alloc] init];
        _deletedIndexArray = [[NSMutableArray alloc] init];
        _addedIndexArray = [[NSMutableArray alloc] init];
    }
    return self;
}


-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath
{
    __block id returnObject = nil;
    __block NSMutableArray *bDataArray = _dataArray;
    dispatch_sync(self.arrayQueue, ^{
        NSArray *array = bDataArray[inIndexPath.section];
        @try
        {
            if( array != nil && inIndexPath.row < array.count )
            {
                returnObject = array[inIndexPath.row];
            }
        }
        @catch (NSException *exception)
        {
            
        }
        
    });
    return returnObject;
}

-(id)objectForSection:(NSInteger)inSection
{
    return [self objectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:inSection]];
}

-(id)objectForRow:(NSInteger)inRow
{
    return [self objectForRowAtIndexPath:[NSIndexPath indexPathForRow:inRow inSection:0]];
}

-(NSInteger)numberOfRowsInSection:(NSInteger)inSection
{
    __block NSInteger returnCount;
    __block NSMutableArray *bArray = _dataArray;
    dispatch_sync(self.arrayQueue, ^{
        NSArray *array = bArray[inSection];
        returnCount = array.count;
    });
    return returnCount;
}

-(NSInteger)numberOfSections
{
    __block NSInteger returnCount;
    __block NSMutableArray *bArray = _dataArray;
    dispatch_sync(self.arrayQueue, ^{
        returnCount = bArray.count;
    });
    return returnCount;
}

-(NSMutableArray *)dataArray
{
   __block NSMutableArray *bDataArray;
    dispatch_sync(self.arrayQueue, ^{
        bDataArray = _dataArray;
    });
    return bDataArray;
}

-(void)setDataArray:(NSMutableArray *)dataArray
{
    __block NSMutableArray *bArray = _dataArray;
    dispatch_async(self.arrayQueue, ^{
        [bArray setArray:dataArray];
    });
}

-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath
{
    __weak MUDataModelBase *bSelf = self;
    __block NSMutableArray *bDeletedIndexes = self.deletedIndexArray;
    dispatch_async(self.arrayQueue, ^{
        __strong MUDataModelBase *sSelf = bSelf;
        NSMutableArray *objectArray = sSelf.dataArray[inIndexPath.section];
        [objectArray removeObjectAtIndex:inIndexPath.row];
        [bDeletedIndexes addObject:inIndexPath];
    });
}

-(void)insertObjectAtIndexPath:(NSObject *)inObject atIndex:(NSIndexPath *)inIndexPath
{
    __weak MUDataModelBase *bSelf = self;
    __block NSMutableArray *bAddedIndexes = self.addedIndexArray;
    dispatch_async(self.arrayQueue, ^{
        __strong MUDataModelBase *sSelf = bSelf;
        NSMutableArray *objectArray = sSelf.dataArray[inIndexPath.section];
        [objectArray insertObject:inObject atIndex:inIndexPath.row];
        [bAddedIndexes addObject:inIndexPath];
    });
}

-(NSString *)titleForSection:(NSInteger)inSection
{
    NSString *returnTitle = self.headerArray[inSection];
    return returnTitle == nil ? EMPTY_STRING : returnTitle;
}

-(void)clearChangedIndexes
{
    [_addedIndexArray removeAllObjects];
    [_deletedIndexArray removeAllObjects];
}

-(void)dataModelUpdated
{
    
}
@end
