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

@end
