//
//  AddPayerVC.m
//  NavProject
//
//  Created by Student on 12/17/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "AddPayerVC.h"
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import "AppModel.h"

@interface AddPayerVC ()

@end

@implementation AddPayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void) viewDidAppear:(BOOL)animated {
    //load google+ friends and reload data
    
    self.loadedCircle = [[NSMutableArray alloc]init];
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
            
            for (GTLPlusPerson *aPerson in peopleList) {
                if (![aPerson.objectType isEqualToString:@"page"]){
                    [self.loadedCircle addObject:aPerson];
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
    return [self.loadedCircle count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddPayerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    GTLPlusPerson *thisPerson = [self.loadedCircle objectAtIndex:indexPath.row];
    
    cell.textLabel.text = thisPerson.displayName;
    if(![thisPerson.image.url isEqual:nil] && ![thisPerson.image.url  isEqual: @""]) {
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:thisPerson.image.url]]];
        
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTLPlusPerson *amigo = [self.loadedCircle objectAtIndex:indexPath.row];
    
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
