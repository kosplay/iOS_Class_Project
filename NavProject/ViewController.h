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

@interface ViewController : UIViewController <GPPSignInDelegate>

@property (retain,nonatomic) IBOutlet GPPSignInButton *signInButton;


@end

@class GPPSignInButton;

