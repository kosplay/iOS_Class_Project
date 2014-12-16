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
-(void) removePayer:(NSString *)payerName;
-(BOOL) addItem:(NSString *)itemName ofQuantity:(float)quantity withPrice:(float)pricePerUnit;
-(void) removeItem:(NSString *)itemName;
-(float) getTotalPrice;
-(size_t) getNumOfItems;
-(size_t) getNumOfPayers;

@end
