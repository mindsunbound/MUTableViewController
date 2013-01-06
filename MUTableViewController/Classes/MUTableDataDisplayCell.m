//
//  MUTableDataDisplayCell.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import "MUTableDataDisplayCell.h"
#import "MUTableDataModel.h"
#import "MUSquareBadgeView.h"
#import "UIImageView+AFNetworking.h"

@implementation MUTableDataDisplayCell


-(void)configureCellWithObject:(id)inObject
{
    MUTableDataModel *dataObject = (MUTableDataModel *)inObject;
    self.titleLabel.text = dataObject.titleString;
    self.subtitleLabel.text = dataObject.subtitleString;
    
    if( dataObject.imageUrlString != nil )
    {
        UIImage *iconImage = [UIImage imageNamed:dataObject.imageUrlString];
        if( iconImage != nil )
        {
            NSInteger yOffset = [self centerYOffset:self.frame.size objectFrameSize:iconImage.size];
            self.iconImageView.image = iconImage;
            CGRect frame = self.iconImageView.frame;
            frame.origin.y = yOffset;
            frame.size = iconImage.size;
            [self.iconImageView setFrame:frame];
        }
        else
        {
            NSURL *imageUrl = [NSURL URLWithString:dataObject.imageUrlString];
            [self.iconImageView setImageWithURL:imageUrl];
        }
    }
    
    if( self.countBadge != nil )
    {
        [self.countBadge removeFromSuperview];
        self.countBadge = nil;
    }
    
    if( dataObject.badgeCount > 0 )
    {
        NSString *badgeCountString = [NSString stringWithFormat:@"%d", dataObject.badgeCount];
        
        self.countBadge = [MUSquareBadgeView customBadgeWithString:badgeCountString withStringColor:[UIColor whiteColor] withInsetColor:[UIColor redColor] withBadgeFrame:YES withBadgeFrameColor:[UIColor whiteColor] withScale:1.0 withShining:YES];
        
        self.countBadge.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        
        NSInteger yOffset = [self centerYOffset:self.frame.size objectFrameSize:self.countBadge.frame.size];
        CGRect frame = self.countBadge.frame;
        frame.origin.x = self.frame.size.width - frame.size.width - 30;
        frame.origin.y = yOffset;
        [self.countBadge setFrame:frame];
        
        [self addSubview:self.countBadge];
    }
}

-(NSInteger)centerYOffset:(CGSize)inParentFrameSize objectFrameSize:(CGSize)inObjectFrameSize
{
    return inParentFrameSize.height/2 - inObjectFrameSize.height / 2;
}
@end
