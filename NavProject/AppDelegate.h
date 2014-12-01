//
//  AppDelegate.h
//  NavProject
//
//  Created by Student on 11/21/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GooglePlus/GooglePlus.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GPPSignIn *googleplus;
@property (strong, nonatomic) FBLoginView *facebook;

@end

