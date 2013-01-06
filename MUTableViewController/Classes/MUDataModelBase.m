//
//  MUDataModelBase.m
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
//

#import "MUDataModelBase.h"

@implementation MUDataModelBase

-(id)init
{
    self = [super init];
    if( self != nil )
    {
        self.dataDictionary = [[NSMutableDictionary alloc] init];
        self.headerDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath
{
    UIView *returnObject = nil;
    @synchronized(self.dataDictionary)
    {
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
    @synchronized(self.dataDictionary)
    {
        NSArray *array = self.dataDictionary[@(inSection)];
        //DDLogInfo(@"Number or rows in section:%d", array.count);
        return array.count;
    }
}

-(NSInteger)numberOfSections
{
    @synchronized(self.dataDictionary)
    {
        // DDLogInfo(@"Number or rows in section:%d", [self.dataDictionary allKeys].count);
        return [self.dataDictionary allKeys].count;
    }
}

-(void)setDataDictionary:(NSMutableDictionary *)dataDictionary
{
    @synchronized(_dataDictionary)
    {
        if( self.dataDictionary == nil )
        {
            _dataDictionary = [[NSMutableDictionary alloc] init];
        }
        
        [_dataDictionary setDictionary:dataDictionary];
    }
}

-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath
{
    @synchronized(self.dataDictionary)
    {
        NSMutableArray *objectArray = self.dataDictionary[@(inIndexPath.section)];
        [objectArray removeObjectAtIndex:inIndexPath.row];
    }
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
