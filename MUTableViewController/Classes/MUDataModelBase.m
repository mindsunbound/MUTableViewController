//
//  MUDataModelBase.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "MUDataModelBase.h"

@implementation MUDataModelBase

-(id)init
{
    self = [super init];
    if( self != nil )
    {
        _arrayQueue = dispatch_queue_create("com.mudatamodelbase.dataqueue", NULL);
        _dataArray = [[NSMutableArray alloc] init];
        _headerArray = [[NSMutableArray alloc] init];
    }
    return self;
}


-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath
{
    __block id returnObject = nil;
    dispatch_sync(self.arrayQueue, ^{
        NSArray *array = self.dataArray[inIndexPath.section];
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

-(void)setDataArray:(NSMutableArray *)dataArray
{
    __weak MUDataModelBase *bSelf = self;
    __block NSMutableArray *bArray = _dataArray;
    dispatch_async(self.arrayQueue, ^{
        __strong MUDataModelBase *sSelf = bSelf;
        if( sSelf.dataArray == nil )
        {
            bArray = [[NSMutableArray alloc] init];
        }
      //  [self willChangeValueForKey:@"dataArray"];
        [sSelf.dataArray setArray:dataArray];
      //  [self didChangeValueForKey:@"dataArray"];
    });
}

-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath
{
    __weak MUDataModelBase *bSelf = self;
    dispatch_async(self.arrayQueue, ^{
        NSMutableArray *objectArray = bSelf.dataArray[inIndexPath.section];
        [objectArray removeObjectAtIndex:inIndexPath.row];
    });
}

-(NSString *)titleForSection:(NSInteger)inSection
{
    NSString *returnTitle = self.headerArray[inSection];
    return returnTitle == nil ? EMPTY_STRING : returnTitle;
}

-(void)dataModelUpdated
{
    
}
@end
