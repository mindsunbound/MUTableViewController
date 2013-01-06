//
//  MUTableViewDataModeling.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
//

#import <Foundation/Foundation.h>

@protocol MUTableViewDataModeling <NSObject>

-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath;
-(NSInteger)numberOfRowsInSection:(NSInteger)inSection;
-(NSInteger)numberOfSections;

@optional

-(id)objectForRow:(NSInteger)inRow;
-(id)objectForSection:(NSInteger)inSection;
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)inIndexPath;
-(void)didSelectRowAtIndexPath:(NSIndexPath *)inIndexPath;

@end
