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
        _dictionaryQueue = dispatch_queue_create("com.mudatamodelbase.dataqueue", NULL);
        _dataDictionary = [[NSMutableDictionary alloc] init];
        _headerDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}


-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath
{
    __block id returnObject = nil;
    dispatch_sync(self.dictionaryQueue, ^{
        NSArray *array = self.dataDictionary[@(inIndexPath.section)];
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
    dispatch_sync(self.dictionaryQueue, ^{
        NSArray *array = self.dataDictionary[@(inSection)];
        returnCount = array.count;
    });
    return returnCount;
}

-(NSInteger)numberOfSections
{
    __block NSInteger returnCount;
    dispatch_sync(self.dictionaryQueue, ^{
        returnCount = [self.dataDictionary allKeys].count;
    });
    return returnCount;
}

-(void)setDataDictionary:(NSMutableDictionary *)dataDictionary
{
    __weak MUDataModelBase *bSelf = self;
    dispatch_async(self.dictionaryQueue, ^{
        __strong MUDataModelBase *sSelf = bSelf;
        if( sSelf.dataDictionary == nil )
        {
            sSelf->_dataDictionary = [[NSMutableDictionary alloc] init];
        }
        [self willChangeValueForKey:@"dataDictionary"];
        [sSelf->_dataDictionary setDictionary:dataDictionary];
        [self didChangeValueForKey:@"dataDictionary"];
    });
}

-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath
{
    __weak MUDataModelBase *bSelf = self;
    dispatch_async(self.dictionaryQueue, ^{
        NSMutableArray *objectArray = bSelf.dataDictionary[@(inIndexPath.section)];
        [objectArray removeObjectAtIndex:inIndexPath.row];
    });
}

-(NSString *)titleForSection:(NSInteger)inSection
{
    NSString *returnTitle = self.headerDictionary[@(inSection)];
    return returnTitle == nil ? EMPTY_STRING : returnTitle;
}

-(void)dataModelUpdated
{
    
}
@end
