//
//  ViewController.m
//  NavProject
//
//  Created by Student on 11/21/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

//google+ client id
static NSString * const kClientID =
@"1043672885379-7mj8d2vsapira1qt1bpgkpjnsskea8qk.apps.googleusercontent.com";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.signInButton.style = kGPPSignInButtonStyleStandard;
    
    //now check of mac account or google+ account, if exist, use it, showing using it.
    self.gppSignIn = [GPPSignIn sharedInstance];
    self.gppSignIn.shouldFetchGooglePlusUser = YES;
    self.gppSignIn.shouldFetchGoogleUserEmail = YES;
    self.gppSignIn.clientID = kClientID;
    self.gppSignIn.scopes = @[kGTLAuthScopePlusLogin];
    self.gppSignIn.delegate = self;
    [self.gppSignIn trySilentAuthentication];//hmm, default?
    
    
    //Facebook login
    [FBLoginView class];
    self.fbLogInView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    self.fbLogInView.delegate = self;
}

//google+ signin handler
-(void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error {
    if (error) {
        // Do some error handling here.
    } else {
        [self refreshInterfaceBasedOnSignIn];
    }
    
    //if no error, direct to next screen
    
    //present home screen
    [self presentHomeScreen];
}

//google+ sign in refresh
-(void)refreshInterfaceBasedOnSignIn {
    if ([[GPPSignIn sharedInstance] authentication]) {
        // The user is signed in.
        self.signInButton.hidden = YES;
        // Perform other actions here, such as showing a sign-out button
    } else {
        self.signInButton.hidden = NO;
        // Perform other actions here
    }
}

- (void)presentSignInViewController:(UIViewController *)viewController {
    // This is an example of how you can implement it if your app is navigation-based.
    //[[self navigationController] pushViewController:viewController animated:YES];
}

//google+ disconnect app from google+
- (void)disconnect {
    [[GPPSignIn sharedInstance] disconnect];
}

//google+ disconnect handler
- (void)didDisconnectWithError:(NSError *)error {
    if (error) {
        NSLog(@"Received error %@", error);
    } else {
        // The user is signed out and disconnected.
        // Clean up user data as specified by the Google+ terms.
    }
}

//google+ sign out
- (void)signOut {
    [[GPPSignIn sharedInstance] signOut];
}


//facebook login handler
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
}

//Facebook loged in callback: This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    NSLog(@"User: %@ ProfileID: %@\n",user.name, user.id);
    //self.profilePictureView.profileID = user.id;
    //self.nameLabel.text = user.name;
    
    //present home screen
    [self presentHomeScreen];
}

//to preset homescreen on successful login
-(void) presentHomeScreen {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    UITabBarController *tabBarVC = (UITabBarController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"TabBarVC"];
    [self presentViewController:tabBarVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
