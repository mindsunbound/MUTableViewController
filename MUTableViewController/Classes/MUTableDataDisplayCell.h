//
//  MUTableDataDisplayCell.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MUConfigurableTableCell.h"

@class MUSquareBadgeView;

@interface MUTableDataDisplayCell : UITableViewCell <MUConfigurableTableCell>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) MUSquareBadgeView *countBadge;

@end
