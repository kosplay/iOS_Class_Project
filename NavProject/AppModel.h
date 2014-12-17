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

-(NSArray *) listsThisPayerShowUp: (NSString *)payerName;

-(BOOL) addItem:(NSString *)itemName ofQuantity:(int)quantity withPrice:(float)pricePerUnit withItemImgURL:(NSString *)itemImgURL toList:(NSString *)listName;

-(void) removeItem:(NSString *)itemName fromList:(NSString *)listName;

-(BOOL) addPayer:(NSString *)payerName toList:(NSString *)listName;

-(void) removePayer:(NSString *)payerName toList:(NSString *)listName;

-(float) getTotalPriceFromList:(NSString *)listName;

-(int) getNumOfItemsFromList:(NSString *)listName;

-(int) getNumOfPayersFromList:(NSString *)listName;

-(void) setFriendImgURL:(NSString *)imgURL forFriendWithName:(NSString *)friendName;

@end
