//
//  AppModel.h
//  NavProject
//
//  Created by Student on 12/15/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
//#import <GooglePlus/GooglePlus.h>
//#import <FacebookSDK/FacebookSDK.h>

@interface AppModel : NSObject

@property float taxRate;
@property (strong, nonatomic) NSMutableArray *lists;
@property (strong, nonatomic) NSMutableArray *friends;
@property GTLPlusPerson *me;

+(id) sharedAppModel;

-(BOOL) createNewList: (NSString *)listName;
-(void) removeListWithName: (NSString *)listName;

@end
