//
//  ListDetailVC.m
//  NavProject
//
//  Created by Student on 12/15/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "ListDetailVC.h"
#import "GroceryItem.h"
#import "AddItemVC.h"
#import "AppDelegate.h"

#define LIST_SUMMARY_SECTION 0
#define LIST_ITEMS_SECTION 1
#define LIST_PAYERS_SECTION 2

@interface ListDetailVC ()

@end

@implementation ListDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    int row;
    switch (section) {
        case LIST_SUMMARY_SECTION:
            row = 3;
            break;
            
        case LIST_ITEMS_SECTION:
            row = (int)[self.list.items count] + 1;
            break;
            
        case LIST_PAYERS_SECTION:
            row = (int)[self.list.payers count] + 1;
            break;
        default:
            row = 0;
            break;
    }
    return row;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title;
    switch (section) {
        case LIST_SUMMARY_SECTION:
            title = @"Summary";
            break;
        case LIST_ITEMS_SECTION:
            title = @"Items";
            break;
        case LIST_PAYERS_SECTION:
            title = @"Payers";
            break;
            
        default:
            NSLog(@"Should not be here");
            break;
    }
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listDetailCell" forIndexPath:indexPath];
    
    
    // Configure the cell...
    switch (indexPath.section) {
        case LIST_SUMMARY_SECTION:
            
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = [NSString stringWithFormat:@"Total Price: $%.2f", (float)[self.list getTotalPrice]];
                    break;
                    
                case 1:
                    cell.textLabel.text = [NSString stringWithFormat:@"Items: %lu", (unsigned long)[self.list.items count]];
                    break;
                    
                case 2:
                    cell.textLabel.text = [NSString stringWithFormat:@"Payers: %lu", (unsigned long)[self.list.payers count]];
                    break;
                    
                default:
                    break;
            }
            break;
            
        case LIST_ITEMS_SECTION:{
            if (indexPath.row == [self.list.items count]){
                cell.textLabel.text = @"Add an Item";
            } else {
                GroceryItem *item = [self.list.items objectAtIndex:indexPath.row];
                cell.textLabel.text = item.itemName;
            }
            break;
        }
        case LIST_PAYERS_SECTION:{
            if (indexPath.row == [self.list.payers count]){
                cell.textLabel.text = @"Add a Payer";
            } else {
                cell.textLabel.text = [self.list.payers objectAtIndex:indexPath.row];
            }
            break;
        }
        default:
            break;
            
    }
    
    return cell;
}

/*
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if( indexPath.section == LIST_ITEMS_SECTION && indexPath.row == [self.list.items count]){//this is the "Add Item" row in items section
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.window
        [self presentViewController:addItemVC animated:YES completion:nil];
    }
}
 */



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    bool editable = NO;
    if (indexPath.section  != LIST_SUMMARY_SECTION ) { //only editable when in item or payer section
        editable = YES;
    }
    return editable;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        switch (indexPath.section) {//depends on which section we are in
            case LIST_ITEMS_SECTION:
                [self.list.items removeObjectAtIndex:indexPath.row];
                break;
                
            case LIST_PAYERS_SECTION:
                [self.list.payers removeObjectAtIndex:indexPath.row];
                break;
                
            default:
                break;
        }
        //visually delete
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

//inserting new item
- (void)addItem:(id)sender {
    GroceryItem *newItem = [[GroceryItem alloc] init];
    newItem.quantity = 0;
    newItem.pricePerUnit = 0;
    newItem.itemName = [NSString stringWithFormat: @"%i",(int)[self.list.items count] + 1 ];
    [self.list.items insertObject:newItem atIndex:(int)[self.list.items count]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.list.items count] inSection:LIST_ITEMS_SECTION];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

//inserting new payer
- (void)addPayer:(id)sender {
    /*
    GroceryItem *newItem = [[GroceryItem alloc] init];
    newItem.quantity = 0;
    newItem.pricePerUnit = 0;
    newItem.itemName = [NSString stringWithFormat: @"%i",(int)[self.list.items count] + 1 ];
    [self.list.items insertObject:newItem atIndex:(int)[self.list.items count]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.list.items count] inSection:LIST_ITEMS_SECTION];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
     */
    //need to search through friend list and add a payer, require implementation of goole+ friend list
}

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
