//
//  GroceryList.m
//  NavProject
//
//  Created by Student on 12/2/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "GroceryList.h"
#import "Friend.h"
#import "GroceryItem.h"

@implementation GroceryList

-(void) addPayer:(Friend *)friend {
    [self.payers addObject:friend];
}

-(Friend *) containsPayer:(NSString *)payerName {
    return nil;
}

-(void) removePayer:(Friend *)friend {
    if( [self.payers containsObject:friend] ){
        [self.payers removeObject:friend];
    }
}

-(void) addItem:(GroceryItem *)item {
    [self.items addObject:item];
}

-(GroceryItem *) containsItem:(NSString *)itemName {
    return nil;
}

-(void) removeItem:(GroceryItem *)item {
    if ( [self.items containsObject:item] ) {
        [self.items removeObject:item];
    }
}

-(float) getTotalPrice {
    float totalPrice = 0;
    for (GroceryItem *anItem in self.items) {
        totalPrice += anItem.pricePerUnit;
    }
    return totalPrice;
}

@end
