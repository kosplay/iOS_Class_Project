//
//  Friend.h
//  NavProject
//
//  Created by Student on 12/2/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *lists;
@property (strong, nonatomic) NSString *fbID;
@property (strong, nonatomic) NSString *googleplusID;
@property (strong, nonatomic) NSString *imgURL;

@end
