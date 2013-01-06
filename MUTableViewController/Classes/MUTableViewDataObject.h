//
//  MUTableViewDataObject.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
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
