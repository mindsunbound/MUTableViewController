//
//  MUTableDataModel.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUTableDataModel : NSObject

@property (strong, nonatomic) NSString *titleString;
@property (strong, nonatomic) NSString *subtitleString;
@property (strong, nonatomic) NSString *imageUrlString;
@property (nonatomic) NSInteger badgeCount;

@end
