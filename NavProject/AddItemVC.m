//
//  AddItemVC.m
//  NavProject
//
//  Created by Student on 12/16/14.
//  Copyright (c) 2014 Kosplay. All rights reserved.
//

#import "AddItemVC.h"
#import "AppModel.h"

@interface AddItemVC ()

@end

@implementation AddItemVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addItem:(id)sender {
    //save
    AppModel *app = [AppModel sharedAppModel];
    [app addItem:self.itemNameView.text ofQuantity:[self.quantityView.text intValue] withPrice:[self.pricePerUnitView.text floatValue] withItemImgURL:self.itemImageURLView.text toList:self.listName];
    
    self.saved.hidden = NO;
    //navigate back
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
    //app
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
