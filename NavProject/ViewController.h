//
//  ViewController.h
//  NavProject
//
//  Created by Student on 11/21/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <FacebookSDK/FacebookSDK.h>

@class GPPSignInButton;
@interface ViewController : UIViewController <GPPSignInDelegate, FBLoginViewDelegate>

@property (retain,nonatomic) IBOutlet GPPSignInButton *signInButton;
@property (strong, nonatomic) GPPSignIn *gppSignIn;
@property (weak, nonatomic) IBOutlet FBLoginView *fbLogInView;


@end


