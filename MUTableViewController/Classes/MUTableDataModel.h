//
//  TableDataObject.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 12/10/12.
//
//

#import <Foundation/Foundation.h>

@interface MUTableDataModel : NSObject

@property (strong, nonatomic) NSString *titleString;
@property (strong, nonatomic) NSString *subtitleString;
@property (strong, nonatomic) NSString *imageUrlString;
@property (nonatomic) NSInteger badgeCount;

@end
