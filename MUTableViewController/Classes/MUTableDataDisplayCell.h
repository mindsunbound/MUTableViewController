//
//  MUTableDataDisplayCell.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 12/10/12.
//
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
