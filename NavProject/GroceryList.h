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

@end
