//
//  GroceryList.h
//  NavProject
//
//  Created by Student on 12/2/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryList : NSObject

@property (strong, nonatomic) NSString *listName;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) NSMutableArray *payers;
@property bool foodOrder;

-(id) initWithListName: (NSString *)listName;

-(BOOL) addPayer:(NSString *)friendName;
-(BOOL) containsPayer:(NSString *)payerName;
-(void) removePayer:(NSString *)payerName;

-(BOOL) addItem:(NSString *)itemName ofQuantity:(float)quantity withPrice:(float)pricePerUnit;
-(BOOL) containsItemBool:(NSString *)itemName;
-(void) removeItem:(NSString *)itemName;

-(float) getTotalPrice;
-(int) getNumOfItems;
-(int) getNumOfPayers;

@end
