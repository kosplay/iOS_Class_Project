//
//  AppModel.m
//  NavProject
//
//  Created by Student on 12/15/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "appModel.h"
#import "GroceryList.h"
#import "Friend.h"

@implementation AppModel

+(id) sharedAppModel {
    static AppModel *sharedAppModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAppModel = [[self alloc] init];
    });
    return sharedAppModel;
}

-(BOOL) createNewList: (NSString *)listName {
    if ( [self containListWithName:listName] == nil ) {
        GroceryList *newList = [[GroceryList alloc] initWithListName:listName];
        [self.lists addObject:newList];
        return YES;
    } else {
        return NO;
    }
}

-(GroceryList *) containListWithName: (NSString *)listName {
    for (GroceryList *aList in self.lists) {
        if ([aList.listName isEqualToString:listName]) {
            return aList;
        }
    }
    return nil;
}

-(void) removeListWithName: (NSString *)listName {
    GroceryList *aList = [self containListWithName:listName];
    if (aList != nil) {
        [self.lists removeObject:aList];
    }
}

/** remove a friend when it is removed from a list and no list is using that friend as payer.
    @todo
*/
-(void) removeFriendFromFriendList:(NSString *)friendName {
    if ( [[self listsThisPayerShowUp:friendName] count] == 0) {
        //no list is using this friend, ok to remove from friendList
        for (Friend *amigo in self.friends) {
            if ([amigo.name isEqualToString:friendName]) {
                [self.friends removeObject:amigo];
            }
        }
    }
}

/**
    Not allowing directly adding a friend to friendList (self.friends) since it needs to be used in lists to show up in friendList
 */


/**
    check existence of a friend in friendList (self.friends)
 */
-(Friend *) containsInFriendList:(NSString *)friendName {
    for (Friend *aFriend in self.friends) {
        if ([friendName isEqualToString:aFriend.name]) {
            return aFriend;
        }
    }
    return nil;
}

/**
    Not allowing directly removing a friend from friendList since it might be used in some lists.
 */


/** add a friend to self.friends when it is added to a list but it does not exist in self.friends yet
*/
-(void) addAPayerToFrindList:(NSString *)payerName {
    Friend *aFriend = [self containsInFriendList:payerName];
    if (aFriend == nil) {
        aFriend = [[Friend alloc] init];
        aFriend.name = payerName;
        //aFriend
    }
}

/**
    return the listNames as an array
 */
-(NSArray *) listsThisPayerShowUp: (NSString *)payerName {
    NSMutableArray *listNames = [[NSMutableArray alloc] init];
    for (GroceryList *aList in self.lists) {
        if ([aList containsPayer:payerName] ) {
            [listNames addObject:aList.listName];
        }
    }
    return [NSArray arrayWithArray:listNames];
}


/** add an item to a list 
    returning a NO could mean either this item already exist therefore can not be added, or this list doesn't exist
*/
-(BOOL) addItem:(NSString *)itemName ofQuantity:(int)quantity withPrice:(float)pricePerUnit toList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        return [list addItem:itemName ofQuantity:quantity withPrice:pricePerUnit];
    } else {
        return NO;
    }
}

/** remove an item from a list 
 
 */
-(void) removeItem:(NSString *)itemName fromList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        [list removeItem:itemName];
    }
}

/** add a payer to a list
    returning a NO could mean either this payer already exist therefore can not be added, or this list doesn't exist
*/
-(BOOL) addPayer:(NSString *)payerName toList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        return [list addPayer:payerName];
    } else {
        return NO;
    }
}

/** remove a payer from a list

*/
-(void) removePayer:(NSString *)payerName toList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        [list removePayer:payerName];
    }
}

/** get totalPrice from a list 
 
*/
-(float) getTotalPriceFromList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        return [list getTotalPrice];
    } else {
        return -1;
    }
}

/** get Num of items from a list
    return -1 if the list with that name does not exist
 */
-(int) getNumOfItemsFromList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        return [list getNumOfItems];
    } else {
        return -1;
    }
}

/** get Num of payers from a list 
    return -1 if the list with that name does not exist
 */
-(int) getNumOfPayersFromList:(NSString *)listName {
    GroceryList *list = [self containListWithName:listName];
    if ( list != nil ) {
        return [list getNumOfPayers];
    } else {
        return -1;
    }
}

/**
    set imageURL for a friend, after getting one from a platform like google or facebook
 */
-(void) setFriendImgURL:(NSString *)imgURL forFriendWithName:(NSString *)friendName {

}

/**
    load
 */

/**
 
 */

/**
 
 */

@end
