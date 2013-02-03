//
//  MUSquareBadgeView.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MUSquareBadgeView : UIView {
	
	NSString *badgeText;
	UIColor *badgeTextColor;
	UIColor *badgeInsetColor;
	UIColor *badgeFrameColor;
	BOOL badgeFrame;
	BOOL badgeShining;
	CGFloat badgeCornerRoundness;
	CGFloat badgeScaleFactor;
}

@property(strong, nonatomic) NSString *badgeText;
@property(strong, nonatomic) UIColor *badgeTextColor;
@property(strong, nonatomic) UIColor *badgeInsetColor;
@property(strong, nonatomic) UIColor *badgeFrameColor;

@property(nonatomic,readwrite) BOOL badgeFrame;
@property(nonatomic,readwrite) BOOL badgeShining;

@property(nonatomic,readwrite) CGFloat badgeCornerRoundness;
@property(nonatomic,readwrite) CGFloat badgeScaleFactor;

+ (MUSquareBadgeView *)customBadgeWithString:(NSString *)badgeString;
+ (MUSquareBadgeView *)customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor *)stringColor withInsetColor:(UIColor *)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor *)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining;
- (void) autoBadgeSizeWithString:(NSString *)badgeString;

+ (MUSquareBadgeView *)getIPhoneButtonBadgeWithString:(NSString *)string andOrigin:(CGPoint)origin;

@end
