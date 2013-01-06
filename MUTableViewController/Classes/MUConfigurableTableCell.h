//
//  MUConfigurableTableCell.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MUConfigurableTableCell <NSObject>

-(void)configureCellWithObject:(id)inObject;

@end
