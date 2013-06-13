//
//  MUTableViewDataModeling.h
//  MUTableViewController
//
//  Created by Jonah Neugass on 1/6/13.
//  Copyright (c) 2013 Minds Unbound. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MUTableViewDataModeling <NSObject>

-(id)objectForRowAtIndexPath:(NSIndexPath *)inIndexPath;
-(NSInteger)numberOfRowsInSection:(NSInteger)inSection;
-(NSInteger)numberOfSections;
-(void)dataModelUpdated;

@optional

-(id)objectForRow:(NSInteger)inRow;
-(id)objectForSection:(NSInteger)inSection;
-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)inIndexPath;
-(void)didSelectRowAtIndexPath:(NSIndexPath *)inIndexPath;
-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath;
-(void)insertObjectAtIndexPath:(NSObject *)inObject atIndex:(NSIndexPath *)inIndexPath;
-(void)clearChangedIndexes;

@end
