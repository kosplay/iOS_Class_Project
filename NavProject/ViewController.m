//
//  ViewController.m
//  NavProject
//
//  Created by Student on 11/21/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "GroceryList.h"
#import "GroceryItem.h"
#import "Friend.h"

@interface ViewController ()

@end

@implementation ViewController

//google+ client id
static NSString * const kClientID =
@"1043672885379-7mj8d2vsapira1qt1bpgkpjnsskea8qk.apps.googleusercontent.com";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.signInButton.style = kGPPSignInButtonStyleWide;
    
    //now check of mac account or google+ account, if exist, use it, showing using it.
    self.gppSignIn = [GPPSignIn sharedInstance];
    self.gppSignIn.shouldFetchGooglePlusUser = YES;
    self.gppSignIn.shouldFetchGoogleUserEmail = YES;
    self.gppSignIn.clientID = kClientID;
    self.gppSignIn.scopes = @[kGTLAuthScopePlusLogin];
    //self.gppSignIn.actions = [NSArray arrayWithObjects:@"listApp/", nil];// maybe this is how to store user's activity
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
    
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    //if no error, load data and direct to next screen
    //load data
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    //dic
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    
    //lists
    NSArray *array = [dict objectForKey:@"lists"];
    NSMutableArray *lists = [[NSMutableArray alloc]init];
    for (id dict in array) {
        //a list
        GroceryList *list = [[GroceryList alloc]init];
        //name for a list
        list.listName = [dict objectForKey:@"listName"];
        //items for a list
        NSArray *itemArray = [dict objectForKey:@"items"];
        for( NSDictionary *anItem in itemArray){
            GroceryItem *newItem = [[GroceryItem alloc]init];
            newItem.itemName = [anItem objectForKey:@"itemName"];
            newItem.quantity = [[anItem objectForKey:@"itemName"]intValue];
            newItem.price = [[anItem objectForKey:@"pricePerUnit"]doubleValue];
            [list.items addObject:newItem];
        }
        //payer for a list
        NSArray *payerArray = [dict objectForKey:@"payers"];
        for( NSString *anPayer in payerArray){
            [list.payers addObject:anPayer];
        }
        [lists addObject:list];
    }
    app.lists = lists;
    
    //friends
    NSArray *friendArray = [dict objectForKey:@"friends"];
    NSMutableArray *friends = [[NSMutableArray alloc]init];
    for( NSDictionary *aFriend in friendArray){
        Friend *newFriend = [[Friend alloc]init];
        newFriend.name = [aFriend objectForKey:@"name"];
        newFriend.fbID = [aFriend objectForKey:@"fbID"];
        newFriend.googleplusID = [aFriend objectForKey:@"googleplusID"];
        NSMutableArray *relatedLists = [aFriend objectForKey:@"relatedLists"];
        for( NSString *aListName in relatedLists ){
            [newFriend.lists addObject:aListName];
        }
        [friends addObject:newFriend];
    }
    app.friends = friends;

    
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
