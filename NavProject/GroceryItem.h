//
//  GroceryItem.h
//  NavProject
//
//  Created by Student on 12/2/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryItem : NSObject

@property (strong,nonatomic) NSString *itemName;
@property (nonatomic) double pricePerUnit;
@property int quantity;
@property (strong,nonatomic) NSString *itemImgURL;

@end
