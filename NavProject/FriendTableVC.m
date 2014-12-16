//
//  FriendTableVC.m
//  NavProject
//
//  Created by Student on 12/4/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "FriendTableVC.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import "AppModel.h"
#import "Friend.h"

@interface FriendTableVC ()

@end

@implementation FriendTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //top margin so navigation bar gives some space, could be a code debt
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    //load frinds from social network
    //[self loadFriends];
    
    //load local friendlist from app delegate
    //http://stackoverflow.com/questions/5244830/using-a-delegate-to-pass-data-back-up-the-navigation-stack
    //
    AppModel *app = [AppModel sharedAppModel];
    //NSLog(@"%@\n", app.lists);
    //NSLog(@"%@\n", app.friends);
    self.friends = app.friends;
    [self loadFriends];
}   

-(void) loadFriends {
    GTLServicePlus *plusService = [[GTLServicePlus alloc] init];
    [plusService setAuthorizer:[GPPSignIn sharedInstance].authentication];
        plusService.retryEnabled = YES;//This causes error. Can not be found.
    
    GTLQueryPlus *query = [GTLQueryPlus queryForPeopleListWithUserId:@"me" collection:kGTLPlusCollectionVisible];
    [plusService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLPlusPeopleFeed *peopleFeed, NSError *error) {
        if (error) {
            GTMLoggerError(@"Error: %@", error);
        } else {
            //Get an array of people from GTLPlusPeopleFeed
            NSArray* peopleList = peopleFeed.items;
            NSLog(@"%@", peopleList);
            
            for (GTLPlusPerson *aPerson in peopleList) {
                for ( Friend *aFriend in self.friends ){
                    if( [aPerson.displayName isEqualToString:aFriend.name] ){
                        aFriend.imgURL = aPerson.image.url;
                    }
                }
            }
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Friend" forIndexPath:indexPath];
    
    // Configure the cell...
    Friend *friend = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = friend.name;
    if(friend.imgURL) {
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:friend.imgURL]]];

    }
    cell.detailTextLabel.text = @"You have 100 dollar difference";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
