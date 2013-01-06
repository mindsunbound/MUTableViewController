//
//  MUDataModelBase.h
//  MUTableViewController
//
//  Created by Jonah G. Neugass on 11/29/12.
//
//

#import <Foundation/Foundation.h>
#import "MUTableViewDataModeling.h"

@interface MUDataModelBase : NSObject<MUTableViewDataModeling>

@property(nonatomic, strong, readonly) NSMutableDictionary *dataDictionary;
@property(nonatomic, strong) NSMutableDictionary *headerDictionary;

@property (strong, nonatomic) MUAnonymousBlock selectionStartBlock;
@property (strong, nonatomic) MUAnonymousBlock selectionCompleteBlock;
@property (strong, nonatomic) MUAnonymousBlock selectionErrorBlock;

-(void)setDataDictionary:(NSMutableDictionary *)dataDictionary;
-(void)deleteObjectAtIndexPath:(NSIndexPath *)inIndexPath;
-(NSString *)titleForSection:(NSInteger)inSection;
-(void)dataModelUpdated;

@end
