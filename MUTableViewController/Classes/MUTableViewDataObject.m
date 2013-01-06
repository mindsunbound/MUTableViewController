//
//  MUTableViewDataObject.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
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
