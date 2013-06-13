//
//  MUDataModelBase.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "MUDataModelBase.h"

@interface MUDataModelBase()

@property(strong, nonatomic, readonly) NSMutableArray *dataArray;
@property(strong, nonatomic) NSMutableArray *headerArray;

@end

@implementation MUDataModelBase

-(id)init
{
    self = [super init];
    if( self != nil )
    {
        _dataArray = [[NSMutableArray alloc] init];
        _headerArray = [[NSMutableArray alloc] init];
        _deletedIndexArray = [[NSMutableArray alloc] init];
        _addedIndexArray = [[NSMutableArray alloc] init];
    }
    return self;
}


-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath
{
    id returnObject = nil;
    
    @synchronized(_dataArray)
    {
        NSArray *array = _dataArray[inIndexPath.section];
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
        
    }
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
    
    NSInteger returnCount;
    @synchronized(_dataArray)
    {
        NSArray *array = _dataArray[inSection];
        returnCount = array.count;
    }
    return returnCount;
}

-(NSInteger)numberOfSections
{
    NSInteger returnCount;
    
    @synchronized(_dataArray)
    {
        returnCount = _dataArray.count;
    }
    return returnCount;
}

-(NSMutableArray *)dataArray
{
    NSMutableArray *returnArray;
    @synchronized(_dataArray)
    {
        returnArray = _dataArray;
    };
    return returnArray;
}

-(void)setDataArray:(NSMutableArray *)dataArray
{
    @synchronized(_dataArray)
    {
        [_dataArray setArray:dataArray];
    };
}

-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath
{
    @synchronized(_dataArray)
    {
        NSMutableArray *objectArray = _dataArray[inIndexPath.section];
        [objectArray removeObjectAtIndex:inIndexPath.row];
        [self.deletedIndexArray addObject:inIndexPath];
    };
}

-(void)insertObjectAtIndexPath:(NSObject *)inObject atIndex:(NSIndexPath *)inIndexPath
{
    @synchronized(_dataArray)
    {
        [self willChangeValueForKey:@"dataArray"];
        NSMutableArray *objectArray = _dataArray[inIndexPath.section];
        [objectArray insertObject:inObject atIndex:inIndexPath.row];
        //_dataArray[inIndexPath.section] = objectArray;
        [self.addedIndexArray addObject:inIndexPath];
        
        [self didChangeValueForKey:@"dataArray"];
    }
    
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
