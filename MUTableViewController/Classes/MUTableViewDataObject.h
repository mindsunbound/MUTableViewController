//
//  MUTableViewDataObject.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUTableViewDataObject : NSObject

@property(nonatomic, strong) NSString *cellClassName;
@property(nonatomic, strong) NSString *storyBoardIdentifier;
@property(nonatomic, strong) NSString *nibName;
@property(nonatomic, strong) id modelObject;
@property(nonatomic, strong) MUAnonymousBlock selectionBlock;
@property(nonatomic) NSInteger cellHeight;
-(id)initWithModel:(id)inModel andSelectionBlock:(MUAnonymousBlock)inSelectionBlock;
@end
