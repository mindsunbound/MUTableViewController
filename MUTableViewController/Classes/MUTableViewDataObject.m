//
//  MUTableViewDataObject.m
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
//

#import "MUTableViewDataObject.h"

@implementation MUTableViewDataObject

-(id)initWithModel:(id)inModel andSelectionBlock:(MUAnonymousBlock)inSelectionBlock
{
    self = [super init];
    if( self != nil )
    {
        self.modelObject = inModel;
        self.selectionBlock = inSelectionBlock;
    }
    return self;
}

@end
