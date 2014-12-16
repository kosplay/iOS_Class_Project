//
//  AppModel.m
//  NavProject
//
//  Created by Student on 12/15/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "appModel.h"

@implementation AppModel

+(id) sharedAppModel {
    static AppModel *sharedAppModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAppModel = [[self alloc] init];
    });
    return sharedAppModel;
}

@end
