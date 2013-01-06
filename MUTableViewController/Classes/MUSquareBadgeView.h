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

@property(nonatomic,retain) NSString *badgeText;
@property(nonatomic,retain) UIColor *badgeTextColor;
@property(nonatomic,retain) UIColor *badgeInsetColor;
@property(nonatomic,retain) UIColor *badgeFrameColor;

@property(nonatomic,readwrite) BOOL badgeFrame;
@property(nonatomic,readwrite) BOOL badgeShining;

@property(nonatomic,readwrite) CGFloat badgeCornerRoundness;
@property(nonatomic,readwrite) CGFloat badgeScaleFactor;

+ (MUSquareBadgeView *) customBadgeWithString:(NSString *)badgeString;
+ (MUSquareBadgeView *) customBadgeWithString:(NSString *)badgeString withStringColor:(UIColor *)stringColor withInsetColor:(UIColor *)insetColor withBadgeFrame:(BOOL)badgeFrameYesNo withBadgeFrameColor:(UIColor *)frameColor withScale:(CGFloat)scale withShining:(BOOL)shining;
- (void) autoBadgeSizeWithString:(NSString *)badgeString;

+ (MUSquareBadgeView *)getIPhoneButtonBadgeWithString:(NSString *)string andOrigin:(CGPoint)origin;

@end
