//
//  MUTableViewDataObject.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MUDefines.h"

@interface MUTableViewDataObject : NSObject

@property(strong, nonatomic) NSString *cellClassName;
@property(strong, nonatomic) NSString *storyBoardIdentifier;
@property(strong, nonatomic) NSString *nibName;
@property(strong, nonatomic) id modelObject;
@property(strong, nonatomic) MUAnonymousBlock selectionBlock;
@property(nonatomic) NSInteger cellHeight;
-(id)initWithModel:(id)inModel andSelectionBlock:(MUAnonymousBlock)inSelectionBlock;
@end
