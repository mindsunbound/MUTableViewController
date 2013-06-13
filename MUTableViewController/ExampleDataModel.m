//
//  ExampleDataModel.m
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "ExampleDataModel.h"
#import "MUTableDataModel.h"
#import "MUTableViewDataObject.h"

@implementation ExampleDataModel

#define BIRD_IMAGE @"23-bird"

#define EXAMPLE_CELL_IDENTIFIER @"ExampleCell"
#define EXAMPLE_CELL_ICON_IDENTIFIER @"ExampleIconCell"

-(void)dataModelUpdated
{
    NSMutableArray *parentArray = [[NSMutableArray alloc] init];
    NSMutableArray *dataObjectArray = [[NSMutableArray alloc] init];
    
    
    MUAnonymousBlock selectionBlock = ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:PERFORM_COLOR_SEGUE_NOTIFICATION object:@"redSegue"];
    };
    
    MUTableDataModel *dataModelObject = [[MUTableDataModel alloc] init];
    dataModelObject.titleString = @"Red Segue";
    dataModelObject.subtitleString = @"Perform example segue with red Color";
    
    MUTableViewDataObject *dataObject = [[MUTableViewDataObject alloc] initWithModel:dataModelObject andSelectionBlock:selectionBlock];
    dataObject.storyBoardIdentifier = EXAMPLE_CELL_IDENTIFIER;
    
    [dataObjectArray addObject:dataObject];
    
    selectionBlock = ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:PERFORM_COLOR_SEGUE_NOTIFICATION object:@"blueSegue"];
    };
    
    dataModelObject = [[MUTableDataModel alloc] init];
    dataModelObject.titleString = @"Blue Segue";
    dataModelObject.subtitleString = @"Perform example segue with blue Color";
    
    dataObject = [[MUTableViewDataObject alloc] initWithModel:dataModelObject andSelectionBlock:selectionBlock];
    dataObject.storyBoardIdentifier = EXAMPLE_CELL_IDENTIFIER;
    
    [dataObjectArray addObject:dataObject];
    
    [parentArray addObject:dataObjectArray];
    
    dataObjectArray = [[NSMutableArray alloc] init];
    
    selectionBlock = ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Example Alert"
                                                        message: @"This is an example alert"
                                                       delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    };
    
    dataModelObject = [[MUTableDataModel alloc] init];
    dataModelObject.titleString = @"Alert Cell";
    dataModelObject.subtitleString = @"Show an alert";
    dataModelObject.imageUrlString = BIRD_IMAGE;
    
    dataObject = [[MUTableViewDataObject alloc] initWithModel:dataModelObject andSelectionBlock:selectionBlock];
    dataObject.storyBoardIdentifier = EXAMPLE_CELL_ICON_IDENTIFIER;
    
    [dataObjectArray addObject:dataObject];
    
    [parentArray addObject:dataObjectArray];

    self.dataArray = parentArray;

}

-(void)addItemNewExampleItem
{
    MUTableDataModel *dataModelObject = [[MUTableDataModel alloc] init];
    dataModelObject.titleString = @"Red Segue";
    dataModelObject.subtitleString = @"Perform example segue with red Color";
    
    MUAnonymousBlock selectionBlock = ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:PERFORM_COLOR_SEGUE_NOTIFICATION object:@"blueSegue"];
    };
    
    MUTableViewDataObject *dataObject = [[MUTableViewDataObject alloc] initWithModel:dataModelObject andSelectionBlock:selectionBlock];
    dataObject.storyBoardIdentifier = EXAMPLE_CELL_IDENTIFIER;
    NSMutableArray *sectionArray = self.dataArray[0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sectionArray.count inSection:0];
        
    dataModelObject = [[MUTableDataModel alloc] init];
    dataModelObject.titleString = @"Blue Segue";
    dataModelObject.subtitleString = @"Perform example segue with blue Color";
    dataObject.modelObject = dataModelObject;
    
    [self insertObjectAtIndexPath:dataObject atIndex:indexPath];
}
@end
