//
//  GroceryList.m
//  NavProject
//
//  Created by Student on 12/2/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "GroceryList.h"
#import "GroceryItem.h"

@implementation GroceryList

-(id) initWithListName: (NSString *)listName {
    self = [self init];
    self.listName = listName;
    return self;
}

-(BOOL) addPayer:(NSString *)friendName {
    if ( ![self containsPayer:friendName] ){
        [self.payers addObject:friendName];
        return YES;
    } else {
        return NO;
    }
}

-(BOOL) containsPayer:(NSString *)payerName {
    if ([self.payers containsObject:payerName]) {
        return YES;
    }
    return NO;
}

-(void) removePayer:(NSString *)payerName {
    if( [self containsPayer:payerName]){
        [self.payers removeObject:payerName];
    }
}

-(BOOL) addItem:(NSString *)itemName ofQuantity:(float)quantity withPrice:(float)pricePerUnit withItemImgURL:(NSString *)itemImgURL {
    if ( [self containsItem:itemName] == nil ){
        GroceryItem *newItem = [[GroceryItem alloc] init];
        newItem.itemName = itemName;
        newItem.quantity = quantity;
        newItem.pricePerUnit = pricePerUnit;
        newItem.itemImgURL = itemImgURL;
        [self.items addObject:newItem];
        return YES;
    } else {
        return NO;
    }
}

-(BOOL) containsItemBool:(NSString *)itemName {
    bool contains = ([self containsItem:itemName]!=nil) ? YES : NO;
    return contains;
}

-(GroceryItem *) containsItem:(NSString *)itemName {
    for (GroceryItem *anItem in self.items) {
        if ([anItem.itemName isEqualToString:itemName]) {
            return anItem;
        }
    }
    return nil;
}

-(void) removeItem:(NSString *)itemName {
    GroceryItem *anItem = [self containsItem:itemName];
    if ( anItem != nil ) {
        [self.items removeObject:anItem];
    }
}

-(float) getTotalPrice {
    float totalPrice = 0;
    for (GroceryItem *anItem in self.items) {
        totalPrice += anItem.pricePerUnit;
    }
    return totalPrice;
}

-(int) getNumOfItems {
    return (int)[self.items count];
}

-(int) getNumOfPayers {
    return (int)[self.payers count];
}

/*
-(void) getFriendSharedList:(NSString *)friendName {
    if (<#condition#>) {
        <#statements#>
    }
}
 */

@end
