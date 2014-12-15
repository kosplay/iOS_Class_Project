//
//  ListDetailVC.m
//  NavProject
//
//  Created by Student on 12/15/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "ListDetailVC.h"
#import "GroceryItem.h"
#import "Friend.h"

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
            row = (int)[self.list.items count];
            break;
            
        case LIST_PAYERS_SECTION:
            row = (int)[self.list.payers count];
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
                    cell.textLabel.text = [NSString stringWithFormat:@"Total Price: %lu", (unsigned long)[self.list getTotalPrice]];
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
            GroceryItem *item = [self.list.items objectAtIndex:indexPath.row];
            cell.textLabel.text = item.itemName;
            break;
        }
        case LIST_PAYERS_SECTION:{
            Friend *payer = [self.list.payers objectAtIndex:indexPath.row];
            cell.textLabel.text = payer.name;
            break;
        }
        default:
            break;
            
    }
    
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
