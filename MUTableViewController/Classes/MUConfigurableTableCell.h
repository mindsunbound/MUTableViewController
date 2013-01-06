//
//  MUConfigurableTableCell.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
//

#import <Foundation/Foundation.h>

@protocol MUConfigurableTableCell <NSObject>

-(void)configureCellWithObject:(id)inObject;

@end
